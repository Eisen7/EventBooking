package com.eventbooking.sign.mapper;

import com.eventbooking.sign.model.TUser;
import java.util.List;

public interface TUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TUser record);

    TUser selectByPrimaryKey(Integer id);

    List<TUser> selectAll();

    int updateByPrimaryKey(TUser record);

    TUser getUserByNamePassword(String username, String password);
}