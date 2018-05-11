package com.eventbooking.utils.generator.mapper;

import com.eventbooking.utils.generator.model.DUser;
import java.util.List;

public interface DUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DUser record);

    DUser selectByPrimaryKey(Long id);

    List<DUser> selectAll();

    int updateByPrimaryKey(DUser record);
}