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

import static com.itchen.constant.HotConstant.TOU_TIAO_ICON;

/**
 * @author chen
 * @description 头条数据源
 */
@Slf4j
@Component
public class TouTiaoDataSource implements HotDataSource {

    private final PlatformService platformService;

    public TouTiaoDataSource(PlatformService platformService) {
        this.platformService = platformService;
    }

    @Override
    public List<HotSearchVo> getHotSearch(String type) throws Exception {
        Platform platform = platformService.getOne(new QueryWrapper<Platform>().eq("name", type));
        if (platform == null) {
            throw new CustomException(ErrorCode.NOT_FOUND_ERROR);
        }

        try {
            String response = HttpUtil.createGet(platform.getApiUrl() + "?" + platform.getApiParams())
                    .header("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7")
                    .header("accept-language", "zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6")
                    .header("cache-control", "no-cache")
                    .header("dnt", "1")
                    .header("pragma", "no-cache")
                    .header("priority", "u=0, i")
                    .header("referer", "https://alphachain.net.cn/")
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

            // 获取嵌套数据结构
            List<HotSearchVo> hotSearchVoList = null;
            try {
                JSONObject body = new JSONObject(response);
                JSONArray list = body.getJSONArray("data");

                HotSearchVo hotSearchVo;
                hotSearchVoList = new ArrayList<>(list.size());

                for (int i = 0; i < list.size(); i++) {
                    JSONObject item = list.getJSONObject(i);

                    JSONObject imageObj = new JSONObject(item.get("Image"));
                    String tagImg = imageObj.getStr("url");

                    hotSearchVo = new HotSearchVo().builder()
                            .hotTitle(item.getStr("Title"))
                            .hotRank(i + 1)
                            .hotTagImg(tagImg)
                            .hotValue(item.getInt("HotValue"))
                            .hotUrl(item.getStr("Url"))
                            .iconUrl(TOU_TIAO_ICON)
                            .build();
                    hotSearchVoList.add(hotSearchVo);
                }
            } catch (Exception e) {
                log.error("数据解析失败,{}", response);
                throw new CustomException("数据解析失败");
            }
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
