package com.eventbooking.utils;

import com.eventbooking.model.JsonResult;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JsonUtil {

    static Gson gson = new GsonBuilder().create();

    public static String objToJson(Object object) {
        return gson.toJson(object);
    }

    public static String getResult(Integer state, Object data) {
        String result =  gson.toJson(new JsonResult(state, "返回成功", data));
        System.out.println(result);
        return result;
    }


}
