package com.itchen.controller.hot;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itchen.common.Result;
import com.itchen.domain.entity.MustModule;
import com.itchen.service.MustModuleService;
import com.itchen.service.WeatherService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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

    public MustModuleController(MustModuleService mustModuleService) {
        this.mustModuleService = mustModuleService;
    }

    @GetMapping("getMustModule/{type}")
    @Operation(summary = "获取必备功能模块")
    public Result<List<MustModule>> getMustModule(@PathVariable String type) {
        List<MustModule> list = mustModuleService.list(new QueryWrapper<MustModule>().eq("type", type));
        return Result.success(list);
    }
}
