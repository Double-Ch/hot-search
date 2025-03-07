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

import static com.itchen.constant.HotConstant.TIE_BA_ICON;

/**
 * @author chen
 * @description 贴吧数据源
 */
@Slf4j
@Component
public class TieBaDataSource implements HotDataSource {

    private final PlatformService platformService;

    public TieBaDataSource(PlatformService platformService) {
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
                    .header("Cookie", "BAIDUID=12A046D5B3C774D9F5CED53780FEA513:FG=1; BAIDUID_BFESS=12A046D5B3C774D9F5CED53780FEA513:FG=1")
                    .timeout(5000)
                    .execute()
                    .charset("UTF-8")
                    .body();

            // 获取嵌套数据结构
            List<HotSearchVo> hotSearchVoList = null;
            try {
                JSONObject body = new JSONObject(response);
                JSONObject data = new JSONObject(body.get("data"));
                JSONObject bangTopic = new JSONObject(data.get("bang_topic"));
                JSONArray list = bangTopic.getJSONArray("topic_list");

                HotSearchVo hotSearchVo;
                hotSearchVoList = new ArrayList<>(list.size());

                for (int i = 0; i < list.size(); i++) {
                    JSONObject item = list.getJSONObject(i);

                    hotSearchVo = new HotSearchVo().builder()
                            .hotTitle(item.getStr("topic_name"))
                            .hotRank(i + 1)
                            .hotTagImg(item.getStr("topic_avatar"))
                            .hotValue(item.getInt("discuss_num"))
                            .hotUrl(item.getStr("topic_url"))
                            .iconUrl(TIE_BA_ICON)
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
