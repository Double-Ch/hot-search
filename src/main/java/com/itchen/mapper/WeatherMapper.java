package com.itchen.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itchen.domain.entity.Weather;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WeatherMapper extends BaseMapper<Weather> {
}