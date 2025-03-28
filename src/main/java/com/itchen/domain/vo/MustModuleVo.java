package com.itchen.domain.vo;

/**
 * @author chen
 * @description 必备功能模块返回对象
 */

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MustModuleVo {
    private Integer id;
    private String title;
    private String description;
    private String icon;
    private String url;
}
