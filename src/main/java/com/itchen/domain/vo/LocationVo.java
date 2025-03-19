package com.itchen.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author chen
 * @description 返回给前端的经纬度数据
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LocationVo {
    private String adcode;
    private String city;
}
