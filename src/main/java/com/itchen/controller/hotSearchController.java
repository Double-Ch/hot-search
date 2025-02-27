package com.itchen.controller;

import com.itchen.common.Result;
import com.itchen.domain.vo.HotSearchVo;
import com.itchen.service.hotSearchService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author chen
 * @description 热搜Controller
 * @create 2025/2/27 15:13
 */
@Slf4j
@RestController
@RequestMapping("/hotSearch")
public class hotSearchController {

    private final hotSearchService hotSearchService;

    public hotSearchController(com.itchen.service.hotSearchService hotSearchService) {
        this.hotSearchService = hotSearchService;
    }

    @GetMapping("/queryByType/{type}")
    public Result<List<HotSearchVo>> queryByType(@PathVariable String type){
        log.info("获取热搜数据,本次获取平台为:{}", type);
        return Result.success(hotSearchService.queryByType(type));
    }
}
