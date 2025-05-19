package com.itchen.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@TableName("feedback_tbl")
public class Feedback {
    @Schema(description = "主键ID")
    private Integer id;

    @Schema(description = "反馈内容")
    private String content;

    @Schema(description = "联系方式")
    private String contact;

    @Schema(description = "创建时间")
    private LocalDateTime createTime;

    @Schema(description = "状态")
    private Integer status;
} 