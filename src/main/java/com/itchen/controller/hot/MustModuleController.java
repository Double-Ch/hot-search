package com.itchen.controller.hot;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itchen.common.Result;
import com.itchen.domain.entity.MustModule;
import com.itchen.service.MustModuleService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author chen
 * @description 获取必备功能模块数据
 */
@Slf4j
@RestController
@Tag(name = "必备功能")
@RequestMapping("/MustModule")
public class MustModuleController {

    private final MustModuleService mustModuleService;
    private final RedisTemplate redisTemplate;

    public MustModuleController(MustModuleService mustModuleService, RedisTemplate redisTemplate) {
        this.mustModuleService = mustModuleService;
        this.redisTemplate = redisTemplate;
    }

    @GetMapping("getMustModule/{type}")
    @Operation(summary = "获取必备功能模块")
    public Result<List<MustModule>> getMustModule(@PathVariable String type) {
        // 先查询redis
        List<MustModule> mustModuleList = (List<MustModule>) redisTemplate.opsForHash().get("must-module", type);
        if (mustModuleList != null) {
            log.info("从redis中获取: {}数据成功", type);
            return Result.success(mustModuleList);
        }

        log.info("从redis中获取: {} 模块数据失败,开始从数据库拉取", type);
        List<MustModule> list = mustModuleService.list(new QueryWrapper<MustModule>().eq("type", type));

        HashMap<String, List<MustModule>> hashMap = new HashMap<>();
        hashMap.put(type, list);
        redisTemplate.opsForHash().put("must-module", type, list);
        redisTemplate.expire("must-module", 10, TimeUnit.MINUTES);

        return Result.success(list);
    }
}
