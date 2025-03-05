package com.itchen.common.exception;

import com.itchen.common.ErrorCode;

/**
 * 自定义异常类
 */
public class CustomException extends RuntimeException {
    /**
     * 错误码
     */
    private final int code;

    public CustomException(String message) {
        super(message);
        this.code = 400;
    }

    public CustomException(int code, String message) {
        super(message);
        this.code = code;
    }

    public CustomException(ErrorCode errorCode) {
        super(errorCode.getMessage());
        this.code = errorCode.getCode();
    }

    public CustomException(ErrorCode errorCode, String message) {
        super(message);
        this.code = errorCode.getCode();
    }

    public int getCode() {
        return code;
    }
}
