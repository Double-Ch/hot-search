package com.itchen.factory;

import com.itchen.common.ErrorCode;
import com.itchen.common.exception.CustomException;
import com.itchen.datasource.HotDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author chen
 * @description 数据源工厂
 */
@Component
public class DataSourceFactory {
    private final Map<String, HotDataSource> dataSourceMap = new ConcurrentHashMap<>();

    @Autowired
    public DataSourceFactory(List<HotDataSource> dataSources) {
        for (HotDataSource source : dataSources) {
            String simpleName = source.getClass().getSimpleName();
            String type = simpleName.replace("DataSource", "").toLowerCase();
            dataSourceMap.put(type, source);
        }
    }

    public HotDataSource getDataSource(String type) {
        return Optional.ofNullable(dataSourceMap.get(type))
                .orElseThrow(() -> new CustomException(ErrorCode.PARAMS_ERROR, "不支持的平台类型"));
    }
}
