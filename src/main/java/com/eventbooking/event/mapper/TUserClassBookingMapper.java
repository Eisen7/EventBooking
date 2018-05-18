package com.eventbooking.event.mapper;

import com.eventbooking.event.model.TUserClassBooking;
import java.util.List;

public interface TUserClassBookingMapper {
    int insert(TUserClassBooking record);

    List<TUserClassBooking> selectAll();

    void delByClassId(Integer classId);
}