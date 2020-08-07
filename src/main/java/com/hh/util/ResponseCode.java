package com.hh.util;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-01 1:19
 */
public enum ResponseCode {
    SUCCESS(true),
    ERROR(false);
    private final boolean success ;
    private ResponseCode(boolean success) {
        this.success=success;
    }
    public boolean getCode() {
        return success;
    }
}
