package com.itchen.utils;

import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * @author chen
 * @description 经纬度转换工具类
 */
public class LocationUtil {

    // 腾讯地图API密钥
    private static final String TENCENT_MAP_KEY = "CYNBZ-2Y2HN-B3NFP-SUOMX-DY26V-UZFN4";

    /**
     * 将经纬度转换为adcode
     *
     * @param latitude  纬度
     * @param longitude 经度
     * @return adcode 行政区划代码
     * @throws Exception
     */
    public static String convertLatLngToAdcode(double latitude, double longitude) throws Exception {
        // 构造腾讯地图API请求URL
        String apiUrl = "https://apis.map.qq.com/ws/geocoder/v1/?location=" + latitude + "," + longitude + "&key=" + TENCENT_MAP_KEY;

        // 发送HTTP请求
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Accept-Charset", "utf-8");

        // 读取响应
        BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = in.readLine()) != null) {
            response.append(line);
        }
        in.close();

        // 解析响应JSON
        return parseAdcodeFromResponse(response.toString());
    }

    /**
     * 从腾讯地图API的响应中解析adcode
     *
     * @param response 响应JSON字符串
     * @return adcode 行政区划代码
     * @throws Exception
     */
    private static String parseAdcodeFromResponse(String response) throws Exception {
        // 使用JSON解析库（如Jackson或Gson）来解析响应
        // 这里为了简单起见，使用字符串操作来提取adcode
        JSONObject body = new JSONObject(response);
        Integer status = body.getInt("status");

        if (status != 0) {
            throw new Exception("腾讯地图API返回错误状态: " + status);
        }

        JSONObject result = body.getJSONObject("result");
        JSONObject adInfo = result.getJSONObject("ad_info");
        String adcode = adInfo.getStr("adcode");

        return adcode;
    }

    public static void main(String[] args) {
        try {
            double latitude = 30.6901;
            double longitude = 104.0787;
            String adcode = convertLatLngToAdcode(latitude, longitude);
            System.out.println("转换成功，adcode: " + adcode);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
