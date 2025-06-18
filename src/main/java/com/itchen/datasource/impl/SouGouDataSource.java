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

/**
 * @author chen
 * @description 搜狗数据源
 */
@Slf4j
@Component
public class SouGouDataSource implements HotDataSource {

    private final PlatformService platformService;
    private final RedisTemplate redisTemplate;

    public SouGouDataSource(PlatformService platformService, RedisTemplate redisTemplate) {
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
                    .timeout(5000)
                    .execute()
                    .charset("UTF-8")
                    .body();

            // 获取嵌套数据结构
            JSONObject body = new JSONObject(response);
            JSONArray list = body.getJSONArray("data");

            HotSearchVo hotSearchVo;
            List<HotSearchVo> hotSearchVoList = new ArrayList<>(list.size());

            for (int i = 0; i < list.size(); i++) {

                JSONObject item = list.getJSONObject(i);
                item = item.getJSONObject("attributes");

                hotSearchVo = new HotSearchVo().builder()
                        .hotTitle(item.getStr("title"))
                        .hotRank(i + 1)
                        .hotValue(item.getInt("num"))
                        .hotUrl(platform.getVisitUrl() + item.getStr("title"))
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
