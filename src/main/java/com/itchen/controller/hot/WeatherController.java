package com.itchen.controller.hot;

import com.itchen.common.Result;
import com.itchen.domain.entity.Weather;
import com.itchen.service.WeatherService;
import com.itchen.utils.LocationUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author chen
 * @description 功能描述
 */
@Slf4j
@RestController
@Tag(name = "天气")
@RequestMapping("/Weather")
public class WeatherController {

    private final WeatherService weatherService;

    public WeatherController(WeatherService weatherService) {
        this.weatherService = weatherService;
    }

    @GetMapping("getWeather")
    @Operation(summary = "获取天气信息")
    public Result<Weather> getWeather(double latitude, double longitude) {
        return Result.success(weatherService.getWeather(latitude, longitude));
    }
}
