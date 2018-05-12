package com.eventbooking.event.controller;

import com.eventbooking.event.model.TClass;
import com.eventbooking.event.service.ClassService;
import com.eventbooking.model.JsonResult;
import com.eventbooking.sign.model.TUser;
import com.eventbooking.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
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
            return "list";
        } else {
            List<TClass> list = service.selectByUser0(user.getId());
            request.setAttribute("createList", list);
            return "listEdit";
        }
    }

    @RequestMapping("/delBooking")
    @ResponseBody
    public Object delBooking(String classId, HttpSession session) {
        TUser user = (TUser) session.getAttribute("user");
        if (user == null) {
            return new JsonResult(1, "Please Login");
        }
        service.delBooking(user.getId(), Integer.valueOf(classId));
        return new JsonResult(0, "删除成功");
    }

    @RequestMapping("/booking")
    @ResponseBody
    public Object booking(String classId, HttpSession session) {
        TUser user = (TUser) session.getAttribute("user");
        if (user == null) {
            return new JsonResult(1, "Please Login");
        }

        service.booking(user.getId(), Integer.valueOf(classId));
        return new JsonResult(0, "预定成功");
    }

    @RequestMapping("/delClass")
    @ResponseBody
    public Object delClass(String classId, HttpSession session) {
        TUser user = (TUser) session.getAttribute("user");
        if (user == null || user.getUserType() != 0) {
            return new JsonResult(1, "Please Login");
        }
        service.delClass(Integer.valueOf(classId));
        return new JsonResult(0, "删除成功");
    }

    @RequestMapping("/form")
    public Object form(String classId, HttpServletRequest request) {
        TUser user = (TUser) request.getSession().getAttribute("user");
        if (user == null || user.getUserType() != 0) {
            return new JsonResult(1, "Please Login 或者以管理员身份登录");
        }
        if (!StringUtils.isEmpty(classId)) {
            TClass tClass = service.selectById(Integer.valueOf(classId));
            tClass.setDateString(DateUtil.formatT(tClass.getDate()));
            request.setAttribute("form", tClass);
        }

        return "form";
    }

    @RequestMapping("/addOrUpdateForm")
    public Object addForm(TClass tClass,HttpServletRequest request) throws ParseException {
        TUser user = (TUser) request.getSession().getAttribute("user");
        if (user == null || user.getUserType() != 0) {
            return new JsonResult(1, "Please Login 或者以管理员身份登录");
        }
        tClass.setTeacher(user.getUsername());
        tClass.setCreateUserId(user.getId());
        tClass.setFlag(true);
        tClass.setDate(DateUtil.getH5Date(tClass.getDateString()));

        if (tClass.getId() != null) {
            service.update(tClass);
        } else {
            service.insert(tClass);
        }

        return "redirect:/classList.do";
    }


}
