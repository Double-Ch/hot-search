package com.itchen.controller.hot;

import com.itchen.common.Result;
import com.itchen.domain.vo.HotSearchVo;
import com.itchen.service.hotSearchService;
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
 * @description 热搜Controller
 * @create 2025/2/27 15:13
 */
@Slf4j
@RestController
@Tag(name = "热搜数据-拉取管理")
@RequestMapping("/hotSearch")
public class hotSearchController {

    private final hotSearchService hotSearchService;

    public hotSearchController(com.itchen.service.hotSearchService hotSearchService) {
        this.hotSearchService = hotSearchService;
    }

    @GetMapping("/queryByType/{type}")
    @Operation(summary = "根据类型查询热搜数据")
    public Result<List<HotSearchVo>> queryByType(@PathVariable String type){
        return Result.success(hotSearchService.queryByType(type));
    }
}
