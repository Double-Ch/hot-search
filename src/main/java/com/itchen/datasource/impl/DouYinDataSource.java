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

import static com.itchen.constant.HotConstant.DOU_YIN_ICON;

/**
 * @author chen
 * @description 抖音数据源
 */
@Slf4j
@Component
public class DouYinDataSource implements HotDataSource {

    private final PlatformService platformService;

    public DouYinDataSource(PlatformService platformService) {
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
                    .timeout(5000)
                    .execute()
                    .charset("UTF-8")
                    .body();

            // 获取嵌套数据结构
            List<HotSearchVo> hotSearchVoList = null;
            try {
                JSONObject body = new JSONObject(response);
                JSONArray wordList = body.getJSONArray("word_list");

                HotSearchVo hotSearchVo;
                hotSearchVoList = new ArrayList<>(wordList.size());

                for (int i = 0; i < wordList.size(); i++) {
                    JSONObject item = wordList.getJSONObject(i);
                    hotSearchVo = new HotSearchVo().builder()
                            .hotTitle(item.getStr("word"))
                            .hotRank(i + 1)
                            .hotValue((Integer) item.get("hot_value"))
                            .hotUrl(platform.getVisitUrl() + item.getStr("word") + "?" + platform.getVisitParams())
                            .iconUrl(DOU_YIN_ICON)
                            .build();
                    hotSearchVoList.add(hotSearchVo);
                }
            } catch (Exception e) {
                log.error("数据解析失败,{}", response);
                throw new CustomException("数据解析失败");
            }

            return hotSearchVoList;

        } catch (HttpException e) {
            log.error("请求url失败,{}", platform.getApiUrl());
            throw new CustomException(ErrorCode.SYSTEM_ERROR, "请求url失败");
        } catch (Exception e) {
            log.error("未知错误", e);
            throw new CustomException(ErrorCode.SYSTEM_ERROR);
        }
    }
}
