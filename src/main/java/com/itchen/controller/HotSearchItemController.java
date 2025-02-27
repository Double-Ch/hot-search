package com.itchen.controller;

import com.itchen.domain.HotSearchItem;
import com.itchen.service.HotSearchItemService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/hot-search")
@Tag(name = "热搜管理")
public class HotSearchItemController {
    @Autowired
    private HotSearchItemService hotSearchItemService;

    @GetMapping
    @Operation(summary = "获取所有热搜信息")
    public List<HotSearchItem> getAllHotSearchItems() {
        return hotSearchItemService.list();
    }

    @PostMapping
    public void addHotSearchItem(@RequestBody HotSearchItem hotSearchItem) {
        hotSearchItemService.save(hotSearchItem);
    }

    @DeleteMapping("/{id}")
    public void deleteHotSearchItem(@PathVariable Long id) {
        hotSearchItemService.removeById(id);
    }
}