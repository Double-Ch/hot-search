package com.itchen.service.impl;

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
        log.debug("获取{},平台热搜数据", type);
        return switch (type) {
            case "douyin" -> onDouYin(type);
            case "bilibili" -> onBiliBili(type);
            default -> throw new IllegalArgumentException("暂不支持该平台: " + type);
        };
    }

    private List<HotSearchVo> onBiliBili(String type) {
        return null;
    }

    private List<HotSearchVo> onDouYin(String type) {
        Platform platform = platformService.getOne(new QueryWrapper<Platform>().eq("name", type));
        String response = HttpUtil.createGet(platform.getApiUrl()).body("")
                .execute()
                .charset("UTF-8")
                .body();
        log.info("获取热搜数据成功,response:{}", response);

        JSONObject body = new JSONObject(response);
        JSONArray wordList = body.getJSONArray("word_list");

        HotSearchVo hotSearchVo = new HotSearchVo();
        List<HotSearchVo> list = new ArrayList<>();
        for (int i = 0; i < wordList.size(); i++) {
            JSONObject item = wordList.getJSONObject(i);
            HotSearchItem hotSearchItem = new HotSearchItem().builder()
                    .platformId(platform.getId())
                    .hotRank(String.valueOf(i+1))
                    .title(item.getStr("word"))
                    .url("https://www.douyin.com/search/" + item.getStr("word") + "?type=general")
                    .hotValue(item.getStr("hot_value"))
                    .build();
            hotSearchItemService.save(hotSearchItem);

            hotSearchVo = new HotSearchVo().builder()
                    .hotTitle(item.getStr("word"))
                    .hotRank(String.valueOf(i + 1))
                    .hotValue((Integer) item.get("hot_value"))
                    .hotUrl("https://www.douyin.com/search/" + item.getStr("word") + "?type=general")
                    .build();
            list.add(hotSearchVo);
        }
        //List<HotSearchItem> list = hotSearchItemService.list(new QueryWrapper<HotSearchItem>().eq("platform_id", platform.getId()));
        return list;
    }
}
