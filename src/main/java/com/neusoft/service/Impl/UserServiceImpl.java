package com.neusoft.service.Impl;

import com.neusoft.dao.UserDao;
import com.neusoft.domain.User;
import com.neusoft.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ：konan
 * @date ：2020/11/19 12:25
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao dao;
    @Override
    public List<User> findAll() {
        return dao.findAll();
    }

    @Override
    public void save(User user) {
        dao.save(user);
    }

    @Override
    public void remove(Integer id) {
        dao.remove(id);
    }

    @Override
    public List<User> findup(Integer id) {
        return dao.findup(id);
    }

    @Override
    public void update(User user) {
        dao.update(user);
    }

    @Override
    public void deleteselect(String[] ids) {
        if(ids!=null&&ids.length>0){
            for (String id:ids){
                System.out.println(id);
                dao.remove(Integer.parseInt(id));
            }
        }
    }

    @Override
    public int Login(User user) {
        return dao.Login(user);
    }

    @Override
    public int countuser() {
        return dao.countuser();
    }

    @Override
    public int countgoods() {
        return dao.countgoods();
    }

    @Override
    public int countgoodsout() {
        return dao.countgoodsout();
    }
}
