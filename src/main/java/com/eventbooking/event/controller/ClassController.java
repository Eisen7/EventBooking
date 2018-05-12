package com.eventbooking.event.controller;

import com.eventbooking.event.model.TClass;
import com.eventbooking.event.service.ClassService;
import com.eventbooking.model.JsonResult;
import com.eventbooking.sign.model.TUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ClassController {

    @Autowired
    ClassService service;

    @RequestMapping("/classList")
    public String toEvent(HttpServletRequest request) {
        TUser user = (TUser) request.getSession().getAttribute("user");
        if (user == null) {
            return "redirect:/index.jsp";
        }
        if (user.getUserType() == 1) {
            List<TClass> list = service.selectByUser1(user.getId());
            request.setAttribute("bookingList", list);
            List<TClass> listExit = service.selectByUser1Exit(user.getId());
            request.setAttribute("bookingExit", listExit);
        }else {
            List<TClass> list = service.selectByUser0(user.getId());
            request.setAttribute("createList",list);
        }
        return "list";
    }

    @RequestMapping("/delBooking")
    @ResponseBody
    public Object delBooking(String classId, HttpSession session) {
        TUser user = (TUser) session.getAttribute("user");
        if (user == null) {
            return "redirect:/index.jsp";
        }
        service.delBooking(user.getId(), Integer.valueOf(classId));
        return new JsonResult(0, "删除成功");
    }

}
