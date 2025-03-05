package com.itchen.domain.entity;

import cn.hutool.core.date.DateTime;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @author chen
 * @description 热搜实体类
 * @create 2025/2/27 15:26
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("hot_search_item_tbl")
public class HotSearchItem {
    @TableId(value = "id", type = IdType.AUTO)
    @Schema(description = "主键ID")
    private Integer id;

    @Schema(description = "所属平台ID")
    private Integer platformId;

    @Schema(description = "热搜排名")
    private String hotRank;

    @Schema(description = "搜索标题")
    private String title;

    @Schema(description = "搜索链接")
    private String url;

    @Schema(description = "热搜值")
    private String hotValue;

    @Schema(description = "更新时间")
    private LocalDateTime updateTime;

//    @Schema(description = "所属平台")
//    private Platform platform;
}
