package com.neusoft.service;

import com.neusoft.domain.Account;
import com.neusoft.domain.User;

import java.util.List;

public interface UserService {
    public List<User> findAll();
    public void save(User user);
    public void remove(Integer id);
    public List<User> findup(Integer id);
    public void update(User user);
    public void deleteselect(String ids[]);
    public int Login(User user);
    public int countuser();
    public int countgoods();
    public int countgoodsout();
}
