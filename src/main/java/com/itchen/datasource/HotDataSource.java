package com.itchen.datasource;

import com.itchen.domain.vo.HotSearchVo;

import java.util.List;

/**
 * @author chen
 * @description 功能描述
 */
public interface HotDataSource {
    List<HotSearchVo> getHotSearch(String type) throws Exception;
}
