package com.itchen.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itchen.domain.entity.MustModule;
import com.itchen.domain.entity.Weather;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MustModuleMapper extends BaseMapper<MustModule> {
}