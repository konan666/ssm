package com.neusoft.service;

import com.neusoft.domain.Goods;
import com.neusoft.domain.Goodsecharts;
import com.neusoft.domain.Num;
import com.neusoft.domain.User;

import java.util.List;

public interface GoodsService {
    public List<Goods> findAll();
    public List<Goods> findoutAll();
    public void save(Goods goods);
    public void remove(Integer id);
    public void removeout(Integer id);
    public List<Goods> findup(Integer id);
    public List<Goods> findnum(Integer id);
    public List<Goods> findnum1(Integer id);
    public void update(Goods goods);
    public void up(Goods goods);
    public void outup(Goods goods);
    public int findoutno(Integer goodsno);
    public  List<Goodsecharts> outout();
    public List<Num> outout2();
    public String Login(String username);
}
