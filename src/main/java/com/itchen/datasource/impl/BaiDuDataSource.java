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
import java.util.concurrent.TimeUnit;

import static com.itchen.constant.HotConstant.BAI_DU_ICON;

/**
 * @author chen
 * @description baidu数据源
 */
@Slf4j
@Component
public class BaiDuDataSource implements HotDataSource {

    private final PlatformService platformService;
    private final RedisTemplate redisTemplate;

    public BaiDuDataSource(PlatformService platformService, RedisTemplate redisTemplate) {
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
            String response = HttpUtil.createGet(platform.getApiUrl() + "?" + platform.getApiParams())
                    .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7")
                    .header("Accept-Language", "zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6")
                    .header("Cache-Control", "no-cache")
                    .header("Connection", "keep-alive")
                    .header("DNT", "1")
                    .header("Pragma", "no-cache")
                    .header("Sec-Fetch-Dest", "document")
                    .header("Sec-Fetch-Mode", "navigate")
                    .header("Sec-Fetch-Site", "cross-site")
                    .header("Sec-Fetch-User", "?1")
                    .header("Upgrade-Insecure-Requests", "1")
                    .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0")
                    .header("sec-ch-ua", "\"Not(A:Brand\";v=\"99\", \"Microsoft Edge\";v=\"133\", \"Chromium\";v=\"133\"")
                    .header("sec-ch-ua-mobile", "?0")
                    .header("sec-ch-ua-platform", "\"Windows\"")
                    .timeout(5000)
                    .execute()
                    .charset("UTF-8")
                    .body();

            // 获取嵌套数据结构
            List<HotSearchVo> hotSearchVoList = null;
            try {
                JSONObject body = new JSONObject(response);
                JSONObject data = new JSONObject(body.get("data"));
                JSONArray cards = data.getJSONArray("cards");
                JSONObject jsonObject = cards.getJSONObject(0);
                JSONArray list = jsonObject.getJSONArray("content");

                HotSearchVo hotSearchVo;
                hotSearchVoList = new ArrayList<>(list.size());

                for (int i = 0; i < list.size(); i++) {
                    JSONObject item = list.getJSONObject(i);

                    hotSearchVo = new HotSearchVo().builder()
                            .hotTitle(item.getStr("word"))
                            .hotRank(i + 1)
                            .hotTagImg(item.getStr("img"))
                            .hotValue(item.getInt("hotScore"))
//                            .hotUrl(item.getStr("url"))
                            .hotUrl("https://www.baidu.com/s?wd=" + item.getStr("word") + "&sa=fyb_news&rsv_dl=fyb_news")
                            .iconUrl(BAI_DU_ICON)
                            .build();
                    hotSearchVoList.add(hotSearchVo);
                }
            } catch (Exception e) {
                log.error("数据解析失败,{}", response);
                throw new CustomException("数据解析失败");
            }
            HashMap<String, List<HotSearchVo>> hashMap = new HashMap<>();
            hashMap.put(type, hotSearchVoList);
            redisTemplate.opsForHash().put("hot-search", type, hotSearchVoList);
            redisTemplate.expire("hot-search", 10, TimeUnit.MINUTES);
            return hotSearchVoList;
        } catch (HttpException e) {
            log.error("请求url失败,{}", platform.getApiUrl() + "?" + platform.getApiParams());
            throw new CustomException(ErrorCode.SYSTEM_ERROR, "请求url失败");
        } catch (Exception e) {
            log.error("未知错误", e);
            throw new CustomException(ErrorCode.SYSTEM_ERROR);
        }
    }
}
