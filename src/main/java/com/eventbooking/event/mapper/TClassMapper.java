package com.eventbooking.event.mapper;

import com.eventbooking.event.model.TClass;
import java.util.List;

public interface TClassMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TClass record);

    TClass selectByPrimaryKey(Integer id);

    List<TClass> selectAll();

    int updateByPrimaryKey(TClass record);

    List<TClass> selectByUser1(Integer userId);

    List<TClass> selectByUser1Exit(Integer userId);

    List<TClass> selectByUser0(Integer userId);

    void delBooking(Integer userId, Integer classId);

    int booking(Integer userId, Integer classId);

    Integer countClassPeople(Integer classId);
}