package com.itchen.service.impl;

import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itchen.domain.entity.Weather;
import com.itchen.mapper.WeatherMapper;
import com.itchen.service.WeatherService;
import com.itchen.utils.LocationUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class WeatherServiceImpl extends ServiceImpl<WeatherMapper, Weather> implements WeatherService {
    @Override
    public Weather getWeather(double latitude, double longitude) {
        try {
            // 获取城市编码
            String adcode = LocationUtil.convertLatLngToAdcode(latitude, longitude);

            // 根据城市编码获取天气信息
            String response = HttpUtil.createGet("https://i.news.qq.com/i/getWeather?adcode=" + adcode + "&from_scene=6")
                    .timeout(5000)
                    .execute()
                    .charset("UTF-8")
                    .body();
            log.info("response: {}", response);
            JSONObject body = new JSONObject(response);
            JSONObject data = body.getJSONObject("data");
            JSONObject city = data.getJSONObject("city");
            JSONObject weather = data.getJSONObject("weather");

            return Weather.builder()
                    .weather(weather.getStr("weather_name"))
                    .district(city.getStr("county"))
                    .city(city.getStr("cname"))
                    .province(city.getStr("pname"))
                    .temperature(weather.getStr("cur_tp"))
                    .build();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}