package com.eventbooking.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@org.springframework.stereotype.Controller
public class Controller {

    @RequestMapping("/test")
    @ResponseBody
    public String login(String userName, String password) {
        System.out.println(userName + password);
        return null;
    }

}
