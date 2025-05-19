package com.itchen.datasource.impl;

import cn.hutool.http.HttpException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itchen.common.ErrorCode;
import com.itchen.common.exception.CustomException;
import com.itchen.datasource.HotDataSource;
import com.itchen.domain.entity.Platform;
import com.itchen.domain.vo.HotSearchVo;
import com.itchen.service.PlatformService;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;


/**
 * @author chen
 * @description 虎扑数据源
 */
@Slf4j
@Component
public class HuPuDataSource implements HotDataSource {

    private final PlatformService platformService;

    public HuPuDataSource(PlatformService platformService) {
        this.platformService = platformService;
    }

    @Override
    public List<HotSearchVo> getHotSearch(String type) throws Exception {
        Platform platform = platformService.getOne(new QueryWrapper<Platform>().eq("name", type));
        if (platform == null) {
            throw new CustomException(ErrorCode.NOT_FOUND_ERROR);
        }

        try {
            log.info("虎扑热搜爬虫任务开始");
            Document doc = Jsoup.connect(platform.getApiUrl())
                    .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")
                    .get();

            // 元素列表 根据.class类名选择
            Elements items = doc.select(".bbs-sl-web-post-body");

            HotSearchVo hotSearchVo;
            List<HotSearchVo> hotSearchVoList = new ArrayList<>(items.size());

            for (int i = 0; i < items.size(); i++) {
                // 文章标题
                String title = items.get(i).select(".p-title").text();
                // 文章id
                String relativeLink = items.get(i).selectFirst("a").attr("href");
                // 文章url
                String link = relativeLink.startsWith("http") ? relativeLink : "https://bbs.hupu.com" + relativeLink;

                hotSearchVo = new HotSearchVo().builder()
                        .hotTitle(title)
                        .hotRank(i + 1)
                        .hotUrl(link)
                        .build();
                hotSearchVoList.add(hotSearchVo);
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
