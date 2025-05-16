package com.itchen.datasource.impl;

import cn.hutool.http.HttpException;
import cn.hutool.http.HttpResponse;
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
import java.util.Set;
import java.util.concurrent.TimeUnit;

import static com.itchen.constant.HotConstant.WEI_BO_ICON;

@Slf4j
@Component
public class WeiBoDataSource implements HotDataSource {

    private static final int MAX_RETRIES = 3;       // 最大重试次数
    private static final int RETRY_INTERVAL = 1000; // 重试间隔（毫秒）
    private static final Set<Integer> RETRY_STATUS_CODES = Set.of(502, 503, 504); // 需重试的状态码

    private final PlatformService platformService;

    public WeiBoDataSource(PlatformService platformService) {
        this.platformService = platformService;
    }

    @Override
    public List<HotSearchVo> getHotSearch(String type) {
        Platform platform = platformService.getOne(new QueryWrapper<Platform>().eq("name", type));
        if (platform == null) {
            throw new CustomException(ErrorCode.NOT_FOUND_ERROR);
        }

        String apiUrl = platform.getApiUrl() + "?" + platform.getApiParams();
        List<HotSearchVo> result = null;
        Exception lastException = null;

        // 重试逻辑
        for (int retry = 0; retry <= MAX_RETRIES; retry++) {
            try (HttpResponse response = HttpUtil.createGet(apiUrl).timeout(5000).execute()) {
                int statusCode = response.getStatus();
                String body = response.charset("UTF-8").body();

                // 检查HTTP状态码
                if (statusCode >= 200 && statusCode < 300) {
                    result = parseResponse(body); // 解析成功则返回
                    break;
                } else if (retry < MAX_RETRIES && RETRY_STATUS_CODES.contains(statusCode)) {
                    log.warn("请求失败，状态码: {}，第{}次重试...", statusCode, retry + 1);
                    sleepRetry(retry);
                } else {
                    throw new HttpException("HTTP请求失败，状态码: " + statusCode);
                }
            } catch (Exception e) {
                lastException = e;
                if (retry < MAX_RETRIES) {
                    log.warn("请求异常: {}，第{}次重试...", e.getMessage(), retry + 1);
                    sleepRetry(retry);
                }
            }
        }

        if (result == null && lastException != null) {
            throw new CustomException(ErrorCode.SYSTEM_ERROR, "重试耗尽后仍失败: " + lastException.getMessage());
        }
        return result;
    }

    // 数据解析方法（解耦）
    private List<HotSearchVo> parseResponse(String responseBody) {
        try {
            JSONObject body = new JSONObject(responseBody);
            JSONObject data = body.getJSONObject("data");
            JSONArray list = data.getJSONArray("realtime");

            List<HotSearchVo> hotSearchList = new ArrayList<>(list.size());
            for (int i = 0; i < list.size(); i++) {
                JSONObject item = list.getJSONObject(i);
                HotSearchVo vo = HotSearchVo.builder()
                        .hotTitle(item.getStr("note"))
                        .hotRank(i + 1)
                        .hotTagImg(item.getStr("icon"))
                        .hotValue(item.getInt("num"))
                        .hotUrl("https://s.weibo.com/weibo?q=" + item.getStr("word"))
                        .iconUrl(WEI_BO_ICON)
                        .build();
                hotSearchList.add(vo);
            }
            return hotSearchList;
        } catch (Exception e) {
            log.error("数据解析失败，原始响应: {}", responseBody);
            throw new CustomException(ErrorCode.PARAMS_ERROR, "数据解析异常");
        }
    }

    // 指数退避休眠
    private void sleepRetry(int retryCount) {
        try {
            long sleepTime = (long) (RETRY_INTERVAL * Math.pow(2, retryCount));
            TimeUnit.MILLISECONDS.sleep(sleepTime);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new CustomException(ErrorCode.SYSTEM_ERROR, "请求被中断");
        }
    }
}