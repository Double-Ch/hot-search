package com.itchen.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itchen.domain.vo.HotSearchVo;

import java.util.List;

/**
 * @author chen
 * @description 功能描述
 * @create 2025/2/27 17:55
 */
public interface hotSearchService extends IService<HotSearchVo> {
    List<HotSearchVo> queryByType(String type);
}
