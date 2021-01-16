package com.neusoft.dao;

import com.neusoft.domain.Account;
import com.neusoft.domain.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author ：konan
 * @date ：2020/11/19 12:12
 */
@Repository
public interface UserDao {
    @Select("select * from user")
    public List<User> findAll();
    @Select("insert into user(username,password) values (#{username},#{password})")
    public void save(User user);
    @Select("delete from user where id=#{id}")
    public void remove(Integer id);
    @Select("select * from user where id=#{id}")
    public List<User> findup(Integer id);
    @Select("update user set username=#{username},password=#{password} where id=#{id}")
    public void update(User user);
    @Select("select * from user where username=#{username} and password=#{password}")
    public int Login(User user);
    @Select("select count(*) from user")
    public int countuser();
    @Select("select count(*) from goods")
    public int countgoods();
    @Select("select count(*) from goodsout")
    public int countgoodsout();
}
