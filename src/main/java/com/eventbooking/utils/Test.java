package com.eventbooking.utils;

import com.eventbooking.event.service.ClassService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Test {
    public static void main(String[] args) {
        ApplicationContext ac = new FileSystemXmlApplicationContext("D:\\IdeaProjects\\EventBooking\\src\\main\\resources\\spring-application.xml");
        ClassService service = (ClassService) ac.getBean("classService");
        System.out.println(service.booking(1, 14));
    }
}
