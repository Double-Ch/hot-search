package com.itchen.datasource.impl;

import cn.hutool.http.HttpException;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itchen.common.ErrorCode;
import com.itchen.common.exception.CustomException;
import com.itchen.datasource.HotDataSource;
import com.itchen.domain.entity.Platform;
import com.itchen.domain.vo.HotSearchVo;
import com.itchen.service.PlatformService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static com.itchen.constant.HotConstant.ZHI_HU_ICON;

/**
 * @author chen
 * @description 知乎数据源
 */
@Slf4j
@Component
public class ZhiHuDataSource implements HotDataSource {

    private final PlatformService platformService;
    private final RedisTemplate redisTemplate;

    public ZhiHuDataSource(PlatformService platformService, RedisTemplate redisTemplate) {
        this.platformService = platformService;
        this.redisTemplate = redisTemplate;
    }

    @Override
    public List<HotSearchVo> getHotSearch(String type) throws Exception {
        // 先查询redis
        List<HotSearchVo> hotSearchVoListByRedis = (List<HotSearchVo>) redisTemplate.opsForHash().get("hot-search", type);
        if (hotSearchVoListByRedis != null) {
            log.info("从redis中获取: {}数据成功", type);
            return hotSearchVoListByRedis;
        }

        log.info("从redis中获取: {}数据失败,开始拉取", type);
        Platform platform = platformService.getOne(new QueryWrapper<Platform>().eq("name", type));
        if (platform == null) {
            throw new CustomException(ErrorCode.NOT_FOUND_ERROR);
        }

        try {
            String response = HttpUtil.createGet(platform.getApiUrl())
                    .header("cookie", "_xsrf=VN96XyHRESB738GJVA30aJpWs9iN5DZi; _zap=06bee125-d912-48bb-9268-a20bc0e082f4; d_c0=AACSIeP7GxmPTrLfEYb8pFFlDMCr0B6-pgY=|1724154699; __snaker__id=bLAEX3gz29CFPiwb; q_c1=f2a6f5588c8b4405995f66908ca721c0|1740453050000|1740453050000; Hm_lvt_98beee57fd2ef70ccdd5ca52b9740c49=1745735105,1745800809,1746276491,1746581413; tst=r; __zse_ck=004_/m=q5eURIMk7o4hs5a5S8c5giljft3HGoumm6X4rR82zSWY1PkCge4/3JEJ/AFZsTnKfwNwvBjNTBXNUZyYYeIW5OM7KiKDZQs1EwKOIAeOwnjCpIqQJ4H36E5VLCaVj-NwR8TGDf4/uXmR4ZnySbpBNCfToQ76zmzamZPEg5ppOXE1FKEf6X44n0aT9QuthGYG0VMXx2MWjOyZ6hXPv/+EGw/4Bz35/OwbGm6BdYNGXY/1hP/lNDwSm/JdDfzI32; z_c0=2|1:0|10:1748394479|4:z_c0|80:MS4xUThEb0R3QUFBQUFtQUFBQVlBSlZUUWUzSW1sNXZDd0Q3VUg4RkxNcUZPMkRXY2NEZmFxQlpnPT0=|159cc6e91f2eff8bd1313ae5f79e3d8bcb3d4d5a4128c77bf0d66b2b0b1e01b0; SUBMIT_0=ebbba76c-10d4-4812-b550-5b39b23052ac; BEC=46faae78ffea44ab7c29d705bdab5c18; SESSIONID=zbKfuXuEfLlYnSoiZiL3Hm3sKSed6Mm1jeXmMzfz9DR")
                    .header("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
                    .header("referer", "https://www.zhihu.com/hot")
                    .header("accept", "application/json, text/plain, */*")
                    .header("accept-language", "zh-CN,zh;q=0.9")
                    .execute()
                    .body();

            // 获取嵌套数据结构
            JSONObject body = new JSONObject(response);
            JSONArray data = body.getJSONArray("data");

            HotSearchVo hotSearchVo;
            List<HotSearchVo> hotSearchVoList = new ArrayList<>(data.size());

            for (int i = 0; i < data.size(); i++) {
                JSONObject item = data.getJSONObject(i);

                // 获取目标数据结构
                JSONObject target = new JSONObject(item.get("target"));

                // 获取热搜链接
                String url = (String) target.get("url");
                // 去掉 "api.",去掉 "questions" 后的 "s"
                url = url.replace("api.", "").replace("questions", "question");

                // 获取热度值
                String detailText = (String) item.get("detail_text");
                detailText = detailText.split(" 万")[0];

                // 获取热搜图片
                JSONArray children = item.getJSONArray("children");
                JSONObject jsonObject = children.getJSONObject(0);
                String thumbnail = (String) jsonObject.get("thumbnail");

                hotSearchVo = new HotSearchVo().builder()
                        .hotTitle(target.getStr("title"))
                        .hotRank(i + 1)
                        .hotTagImg(thumbnail)
                        .hotValue(Integer.parseInt(detailText) * 10000)
                        .hotUrl(url)
                        .iconUrl(ZHI_HU_ICON)
                        .build();
                hotSearchVoList.add(hotSearchVo);
            }
            HashMap<String, List<HotSearchVo>> hashMap = new HashMap<>();
            hashMap.put(type, hotSearchVoList);
            redisTemplate.opsForHash().put("hot-search", type, hotSearchVoList);
            return hotSearchVoList;
        } catch (HttpException e) {
            throw new CustomException(ErrorCode.SYSTEM_ERROR);
        }
    }
}
