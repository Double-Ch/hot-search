package com.itchen.common;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * @author chen
 * @description 功能描述
 * @create 2025/1/14 16:41
 */

@Data
@Schema(description = "统一封装")
public class Result<T> implements Serializable {
    @Schema(description = "是否成功")
    private boolean success;
    @Schema(description = "错误代码")
    private int code;
    @Schema(description = "错误提示")
    private String msg;
    @Schema(description = "数据")
    private T data;

    private Result(T data) {
        this.code = 200;
        this.success=true;
        this.data = data;
    }

    private Result(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    @JsonIgnore
    public static <T> Result<T> error(int code, String msg){
        return new Result<>(code, msg);
    }

    @JsonIgnore
    public static <T> Result<T> success(T data){
        return new Result<>(data);
    }

    @JsonIgnore
    public static <T> Result<PageResult<T>> success(IPage<T> data){
        return new Result<>(new PageResult<>(data));
    }
}
