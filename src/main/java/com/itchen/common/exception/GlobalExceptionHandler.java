package com.itchen.common.exception;

import com.itchen.common.ErrorCode;
import com.itchen.common.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理器
 */
@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public Result<?> ExceptionHandler(Exception e) {
        log.error("Exception", e);
        return Result.error(e.getMessage());
    }

    @ExceptionHandler(CustomException.class)
    public Result<?> CustomExceptionHandler(CustomException e) {
        log.error("CustomException", e);
        return Result.error(e.getCode(), e.getMessage());
    }

    @ExceptionHandler(RuntimeException.class)
    public Result<?> runtimeExceptionHandler(RuntimeException e) {
        log.error("RuntimeException", e);
        return Result.error(ErrorCode.SYSTEM_ERROR, "系统错误");
    }
}
