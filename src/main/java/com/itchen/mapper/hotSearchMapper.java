package com.itchen.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itchen.domain.Platform;
import com.itchen.domain.vo.HotSearchVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface hotSearchMapper extends BaseMapper<HotSearchVo> {
}