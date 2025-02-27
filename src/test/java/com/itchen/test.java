package com.itchen;

/**
 * @author chen
 * @description 功能描述
 * @create 2025/1/14 16:41
 */
public class test {
    public static void main(String[] args) {
        String dataString = "898604F81623D018856381.69.46.160";
        // 898604F81623D018856381.69.46.160
        String s = dataString.split("81.69.46.160")[0];
        System.out.println(s);
    }
}
