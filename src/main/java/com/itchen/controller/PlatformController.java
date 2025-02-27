package com.itchen.controller;

import com.itchen.domain.Platform;
import com.itchen.service.PlatformService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/platform")
@Tag(name = "平台管理")
public class PlatformController {
    @Autowired
    private PlatformService platformService;

    @GetMapping("getAll")
    @Operation(summary = "获取所有平台信息")
    public List<Platform> getAllPlatforms() {
        return platformService.list();
    }

    @PostMapping
    public void addPlatform(@RequestBody Platform platform) {
        platformService.save(platform);
    }

    @DeleteMapping("/{id}")
    public void deletePlatform(@PathVariable Long id) {
        platformService.removeById(id);
    }
}