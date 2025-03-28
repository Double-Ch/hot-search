package com.itchen.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author chen
 * @description 必备功能模块实体类
 * @create 2025/2/27 15:21
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("must_module_tbl")
public class MustModule {
    @TableId(value = "id", type = IdType.AUTO)
    @Schema(description = "主键ID")
    private Integer id;

    @Schema(description = "名称")
    private String title;

    @Schema(description = "描述")
    private String description;

    @Schema(description = "icon")
    private String icon;

    @Schema(description = "跳转地址")
    private String url;


}
