package com.itchen.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itchen.domain.vo.HotSearchVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface hotSearchMapper extends BaseMapper<HotSearchVo> {
}