package com.itchen.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itchen.domain.entity.Weather;

public interface WeatherService extends IService<Weather> {
    Weather getWeather(double latitude, double longitude);
}