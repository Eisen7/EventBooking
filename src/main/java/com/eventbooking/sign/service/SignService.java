package com.eventbooking.sign.service;

import com.eventbooking.sign.mapper.TUserMapper;
import com.eventbooking.sign.model.TUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author Silk Road
 * @Date 15:49 2018/5/10
 */
@Service
public class SignService {

    @Autowired
    TUserMapper mapper;

    public TUser getUserByNamePassword(String username,String password) {
        return mapper.getUserByNamePassword(username, password);
    }

    public void insert(TUser user) {
        mapper.insert(user);
    }

    public void update(TUser user) {
        mapper.updateByPrimaryKey(user);
    }

    public int countUserName(String username) {
        return mapper.countUserName(username);

    }
}
