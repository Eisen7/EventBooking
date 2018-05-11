package com.eventbooking.sign.controller;

import com.eventbooking.model.JsonResult;
import com.eventbooking.sign.model.TUser;
import com.eventbooking.sign.service.SignService;
import com.eventbooking.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Author Silk Road
 * @Date 15:48 2018/5/10
 */
@Controller
public class SignController {

    @Autowired
    SignService service;

    @RequestMapping("/login")
    @ResponseBody
    public Object login(String username, String password, HttpSession session) {

        TUser user = service.getUserByNamePassword(username, password);
        if (user == null) {
            return new JsonResult(1, "User name or password error");
        } else {
            session.setAttribute("user", user);
            return new JsonResult(0, "Login Success");
        }

    }

    @RequestMapping("/signup")
    @ResponseBody
    public Object signup(TUser user) {
        if (StringUtils.isEmpty(user.getUsername() + user.getPassword())) {
            return new JsonResult(1, "User name or password is not allow null");
        }
        user.setUserType(1);
        service.insert(user);
        return new JsonResult(0, "Sign Up success,your user name is " + user.getUsername());
    }

}
