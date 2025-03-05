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
                    .header("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36")
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
                        .build();
                hotSearchVoList.add(hotSearchVo);
            }
            return hotSearchVoList;
        } catch (HttpException e) {
            throw new CustomException(ErrorCode.SYSTEM_ERROR);
        }
    }
}
