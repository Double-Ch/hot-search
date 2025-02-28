package com.itchen.domain.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author chen
 * @description 返回给前端的热搜数据
 * @create 2025/2/27 17:45
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class HotSearchVo {
//    @Schema(description = "热搜ID")
//    private Integer htoId;

    @Schema(description = "热搜排名")
    private Integer hotRank;

    @Schema(description = "热搜值")
    private Integer hotValue;

    @Schema(description = "热搜标题")
    private String hotTitle;

    @Schema(description = "热搜链接")
    private String hotUrl;

    @Schema(description = "热搜图片")
    private String hotTagImg;
}
