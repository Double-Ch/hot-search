package com.itchen.service.impl;

import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itchen.domain.entity.MustModule;
import com.itchen.domain.entity.Weather;
import com.itchen.mapper.MustModuleMapper;
import com.itchen.mapper.WeatherMapper;
import com.itchen.service.MustModuleService;
import com.itchen.service.WeatherService;
import com.itchen.utils.LocationUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class MustModuleServiceImpl extends ServiceImpl<MustModuleMapper, MustModule> implements MustModuleService {
}