package com.eventbooking.loginAndSignup;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author 解玉新
 * @Date 15:48 2018/5/10
 */
public class LoginAndSignUpController {
    @RequestMapping("/login")
    @ResponseBody
    public String login(String userName, String password) {
        System.out.println(userName + password);
        return null;
    }

    @RequestMapping("/login")
    @ResponseBody
    public String signUp(String userName, String password, String email) {
        System.out.println(userName + password + email);
        return null;
    }

}
