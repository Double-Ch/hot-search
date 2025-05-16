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
import org.springframework.stereotype.Component;

import java.util.ArrayList;
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

    public ZhiHuDataSource(PlatformService platformService) {
        this.platformService = platformService;
    }

    @Override
    public List<HotSearchVo> getHotSearch(String type) throws Exception {
        Platform platform = platformService.getOne(new QueryWrapper<Platform>().eq("name", type));
        if (platform == null) {
            throw new CustomException(ErrorCode.NOT_FOUND_ERROR);
        }

        try {
            String response = HttpUtil.createGet(platform.getApiUrl())
                    .header("cookie", "_xsrf=VN96XyHRESB738GJVA30aJpWs9iN5DZi; _zap=06bee125-d912-48bb-9268-a20bc0e082f4; d_c0=AACSIeP7GxmPTrLfEYb8pFFlDMCr0B6-pgY=|1724154699; __snaker__id=bLAEX3gz29CFPiwb; q_c1=f2a6f5588c8b4405995f66908ca721c0|1740453050000|1740453050000; z_c0=2|1:0|10:1745735104|4:z_c0|80:MS4xUThEb0R3QUFBQUFtQUFBQVlBSlZUY0FiLTJnVkUxc3p2ZF9mZ2ZrZ09BQzk5QUJ6aXpXM0R3PT0=|342ba90896869fd4c624fd72d9713b900697e5af55a28e9744eb641d57fbceb8; tst=r; __zse_ck=004_/yVfDVIRfmBxlQ80NWNy8Rmq36dTtvQAvqxgMVYiQBHwCVKp3BS=2HJ5es8i1PwBhOnE6jaNQrqLA0cxI5Bjnr6jAYqgEqvNsljMp9phkL/AwW7aKHEg6kQwQgyPYNuM-oCXOyo+Pryalr24skc5gdVekNL89t2gmyLzKeIQDYtX8Ec6sPBm4tWMi2qPn1Vx3KlhFNRriQl42VcWtYxw8EaywywGGOFUWm+NCaHJdDNiDtNbDylMPJtuD+rFbUUm5; Hm_lvt_98beee57fd2ef70ccdd5ca52b9740c49=1745735105,1745800809,1746276491,1746581413; Hm_lpvt_98beee57fd2ef70ccdd5ca52b9740c49=1746581413; HMACCOUNT=DC7B5A5643487E58; BEC=b7b0f394f3fd074c6bdd2ebbdd598b4e")
                    .timeout(5000)
                    .execute()
                    .charset("UTF-8")
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
                        .hotValue(Integer.parseInt(detailText))
                        .hotUrl(url)
                        .iconUrl(ZHI_HU_ICON)
                        .build();
                hotSearchVoList.add(hotSearchVo);
            }
            return hotSearchVoList;
        } catch (HttpException e) {
            throw new CustomException(ErrorCode.SYSTEM_ERROR);
        }
    }
}
