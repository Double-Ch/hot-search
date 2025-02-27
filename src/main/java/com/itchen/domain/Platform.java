package com.itchen.domain;

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
 * @description 平台实体类
 * @create 2025/2/27 15:21
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("platform_tbl")
public class Platform {
    @TableId(value = "id", type = IdType.AUTO)
    @Schema(description = "主键ID")
    private Integer id;

    @Schema(description = "平台名称")
    private String name;

    @Schema(description = "热搜数据的API地址")
    private String apiUrl;

    @Schema(description = "携带参数")
    private String params;

//    @Schema(description = "热搜数据列表")
//    private List<HotSearchItem> hotSearchItems;

}
