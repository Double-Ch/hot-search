package com.itchen.service.impl;

import cn.hutool.http.HttpException;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itchen.domain.HotSearchItem;
import com.itchen.domain.Platform;
import com.itchen.domain.vo.HotSearchVo;
import com.itchen.mapper.hotSearchMapper;
import com.itchen.service.HotSearchItemService;
import com.itchen.service.PlatformService;
import com.itchen.service.hotSearchService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author chen
 * @description 功能描述
 * @create 2025/2/27 17:56
 */
@Service
@Slf4j
public class hotSearchServiceImpl extends ServiceImpl<hotSearchMapper, HotSearchVo> implements hotSearchService {

    private final hotSearchMapper hotSearchMapper;
    private final HotSearchItemService hotSearchItemService;
    private final PlatformService platformService;

    public hotSearchServiceImpl(com.itchen.mapper.hotSearchMapper hotSearchMapper, HotSearchItemService itemService, PlatformService platformService) {
        this.hotSearchMapper = hotSearchMapper;
        hotSearchItemService = itemService;
        this.platformService = platformService;
    }

    @Override
    public List<HotSearchVo> queryByType(String type) {
        log.info("获取热搜数据,平台:{}", type);
        return switch (type) {
            case "douyin" -> onDouYin(type);
            case "bilibili" -> onBiliBili(type);
            default -> throw new IllegalArgumentException("暂不支持该平台: " + type);
        };
    }

    private List<HotSearchVo> onBiliBili(String type) {
        Platform platform = platformService.getOne(new QueryWrapper<Platform>().eq("name", type));
        if (platform == null) {
            log.error("平台配置信息不存在: {}", type);
            return Collections.emptyList();
        }

        log.info("获取热搜数据开始,url:{}", platform.getApiUrl());
        long startTime = System.currentTimeMillis();

        try {
            String response = HttpUtil.createGet(platform.getApiUrl())
                    .header("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7")
                    .header("accept-language", "zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6")
                    .header("cache-control", "no-cache")
                    .header("dnt", "1")
                    .header("pragma", "no-cache")
                    .header("priority", "u=0, i")
                    .header("sec-ch-ua", "\"Not(A:Brand\";v=\"99\", \"Microsoft Edge\";v=\"133\", \"Chromium\";v=\"133\"")
                    .header("sec-ch-ua-mobile", "?0")
                    .header("sec-ch-ua-platform", "\"Windows\"")
                    .header("sec-fetch-dest", "document")
                    .header("sec-fetch-mode", "navigate")
                    .header("sec-fetch-site", "cross-site")
                    .header("sec-fetch-user", "?1")
                    .header("upgrade-insecure-requests", "1")
                    .header("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0")
                    .timeout(5000)
                    .execute()
                    .charset("UTF-8")
                    .body();
            JSONObject body = new JSONObject(response);
            JSONObject data = new JSONObject(body.get("data"));
            JSONArray list = data.getJSONArray("list");


            if (list == null || list.isEmpty()) {
                log.warn("空的热搜数据列表，平台: {}", type);
                return Collections.emptyList();
            }

            HotSearchVo hotSearchVo;
            List<HotSearchVo> hotSearchVoList = new ArrayList<>(list.size());

            for (int i = 0; i < list.size(); i++) {
                JSONObject item = list.getJSONObject(i);

                JSONObject stat = new JSONObject(item.get("stat"));

                hotSearchVo = new HotSearchVo().builder()
                        .hotTitle(item.getStr("title"))
                        .hotRank(i + 1)
                        .hotTagImg(item.getStr("pic"))
                        .hotValue((Integer) stat.get("view"))
                        .hotUrl((String) item.get("short_link_v2"))
                        .build();
                hotSearchVoList.add(hotSearchVo);
            }
            return hotSearchVoList;
        } catch (HttpException e) {
            log.error("获取{}热搜数据异常, url: {}", type, platform.getApiUrl(), e);
            return Collections.emptyList();
        } finally {
            log.info("获取热搜数据耗时：{}ms", System.currentTimeMillis() - startTime);
        }
    }

    private List<HotSearchVo> onDouYin(String type) {
        Platform platform = platformService.getOne(new QueryWrapper<Platform>().eq("name", type));
        if (platform == null) {
            log.error("平台配置信息不存在: {}", type);
            return Collections.emptyList();
        }

        log.info("获取热搜数据开始,url:{}", platform.getApiUrl());
        long startTime = System.currentTimeMillis();

        try {
            String response = HttpUtil.createGet(platform.getApiUrl())
                    .timeout(5000)
                    .execute()
                    .charset("UTF-8")
                    .body();
            JSONObject body = new JSONObject(response);
            JSONArray wordList = body.getJSONArray("word_list");

            if (wordList == null || wordList.isEmpty()) {
                log.warn("空的热搜数据列表，平台: {}", type);
                return Collections.emptyList();
            }

            HotSearchVo hotSearchVo;
            HotSearchItem hotSearchItem;
            List<HotSearchVo> hotSearchVoList = new ArrayList<>(wordList.size());
            List<HotSearchItem> hotSearchItemList = new ArrayList<>(wordList.size());

            for (int i = 0; i < wordList.size(); i++) {
                JSONObject item = wordList.getJSONObject(i);
//                hotSearchItem = new HotSearchItem().builder()
//                        .platformId(platform.getId())
//                        .hotRank(String.valueOf(i+1))
//                        .title(item.getStr("word"))
//                        .url(platform.getVisitUrl() + item.getStr("word") + "?" + platform.getVisitParams())
//                        .hotValue(item.getStr("hot_value"))
//                        .build();
//                hotSearchItemList.add(hotSearchItem);

                hotSearchVo = new HotSearchVo().builder()
                        .hotTitle(item.getStr("word"))
                        .hotRank(i + 1)
                        .hotValue((Integer) item.get("hot_value"))
                        .hotUrl(platform.getVisitUrl() + item.getStr("word") + "?" + platform.getVisitParams())
                        .build();
                hotSearchVoList.add(hotSearchVo);
            }
//            hotSearchItemService.saveBatch(hotSearchItemList);
            return hotSearchVoList;
        } catch (HttpException e) {
            log.error("获取抖音热搜数据异常, url: {}", platform.getApiUrl(), e);
            return Collections.emptyList();
        } finally {
            log.info("获取热搜数据耗时：{}ms", System.currentTimeMillis() - startTime);
        }
    }
}
