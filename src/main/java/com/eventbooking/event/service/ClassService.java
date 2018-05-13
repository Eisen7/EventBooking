package com.eventbooking.event.service;

import com.eventbooking.event.mapper.TClassMapper;
import com.eventbooking.event.mapper.TUserClassBookingMapper;
import com.eventbooking.event.model.TClass;
import com.eventbooking.event.model.TUserClassBooking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ClassService {

    @Autowired
    TClassMapper mapper;

    @Autowired
    TUserClassBookingMapper tUserClassBookingMapper;


    public void insert(TClass tClass) {
        mapper.insert(tClass);
    }

    public void del(Integer id) {
        mapper.deleteByPrimaryKey(id);
    }

    public void update(TClass tClass) {
        mapper.updateByPrimaryKey(tClass);
    }

    public List<TClass> selectByUser1(Integer userId) {
        return mapper.selectByUser1(userId);
    }
    public List<TClass> selectByUser1Exit(Integer userId) {
        return mapper.selectByUser1Exit(userId);
    }

    public List<TClass> selectByUser0(Integer userId) {
        return mapper.selectByUser0(userId);
    }

    public void delBooking(Integer userId, Integer classId) {
        mapper.delBooking(userId,classId);
    }

    public int booking(Integer userId, Integer classId) {


        TUserClassBooking tUserClassBooking = new TUserClassBooking();
        tUserClassBooking.setUserId(userId);
        tUserClassBooking.setBookingDate(new Date());
        tUserClassBooking.setClassId(classId);
        tUserClassBooking.setFlag(true);
       return tUserClassBookingMapper.insert(tUserClassBooking);
    }


    public TClass selectById(Integer classId) {
        return mapper.selectByPrimaryKey(classId);
    }

    public void delClass(Integer classId) {
        mapper.deleteByPrimaryKey(classId);
    }

    public Integer countClassPeople(Integer classId) {
        return mapper.countClassPeople(classId);
    }

    public List<TClass> selectAll() {
        return mapper.selectAll();
    }
}
