package com.eventbooking.sign.mapper;

import com.eventbooking.sign.model.TUser;

public interface TUserMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TUser record);

    int updateByPrimaryKey(TUser record);

    TUser getUserByNamePassword(String username, String password);

    int countUserName(String username);
}