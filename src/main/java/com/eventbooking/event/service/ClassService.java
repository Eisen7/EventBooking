package com.eventbooking.event.service;

import com.eventbooking.event.mapper.TClassMapper;
import com.eventbooking.event.model.TClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassService {

    @Autowired
    TClassMapper mapper;

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
}
