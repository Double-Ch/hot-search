package com.itchen.domain.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author chen
 * @description 功能描述
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Weather {
    @Schema(description = "省份")
    private String province;

    @Schema(description = "城市")
    private String city;

    @Schema(description = "区")
    private String district;

    @Schema(description = "天气")
    private String weather;

    @Schema(description = "温度")
    private String temperature;
}
