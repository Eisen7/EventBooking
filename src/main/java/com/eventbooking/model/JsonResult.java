package com.eventbooking.model;

import com.eventbooking.utils.JsonUtil;

public class JsonResult {

    Integer state = 00;
    String message;
    Object data;

    public JsonResult(Integer state, Object data) {
        this.state = state;
        this.data = JsonUtil.objToJson(data);
    }

    public JsonResult(Integer state, String message, Object data) {
        this.state = state;
        this.message = message;
        this.data = JsonUtil.objToJson(data);
    }

    @Override
    public String toString() {
        return "JsonResult{" +
                "state=" + state +
                ", message='" + message + '\'' +
                ", data=" + data +
                '}';
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
