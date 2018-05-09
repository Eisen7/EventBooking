package controller;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@org.springframework.stereotype.Controller
public class Controller {

    @RequestMapping("/test")
    @ResponseBody
    public Object test(String s) {
        if (StringUtils.isEmpty(s)) {
            s = "傻子超";
        }
        return s;
    }

}
