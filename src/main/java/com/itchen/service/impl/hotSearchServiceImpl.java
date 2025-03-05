package com.itchen.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itchen.common.ErrorCode;
import com.itchen.common.exception.CustomException;
import com.itchen.datasource.HotDataSource;
import com.itchen.domain.vo.HotSearchVo;
import com.itchen.factory.DataSourceFactory;
import com.itchen.mapper.hotSearchMapper;
import com.itchen.service.hotSearchService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author chen
 * @description 功能描述
 * @create 2025/2/27 17:56
 */
@Service
@Slf4j
public class hotSearchServiceImpl extends ServiceImpl<hotSearchMapper, HotSearchVo> implements hotSearchService {

    private final DataSourceFactory dataSourceFactory;

    public hotSearchServiceImpl(DataSourceFactory dataSourceFactory) {
        this.dataSourceFactory = dataSourceFactory;
    }

    @Override
    public List<HotSearchVo> queryByType(String type) {
        try {
            HotDataSource dataSource = dataSourceFactory.getDataSource(type);
            return dataSource.getHotSearch(type);
        } catch (Exception e) {
            throw new CustomException(ErrorCode.SYSTEM_ERROR, "获取热搜数据失败");
        }
    }
}
