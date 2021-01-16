package com.neusoft.service.Impl;

import com.neusoft.dao.GoodsDao;
import com.neusoft.domain.Goods;
import com.neusoft.domain.Goodsecharts;
import com.neusoft.domain.Num;
import com.neusoft.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ：konan
 * @date ：2020/11/19 12:25
 */
@Service("GoodsServiceImpl")
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsDao dao;
    @Override
    public List<Goods> findAll() {
        return dao.findAll();
    }

    @Override
    public List<Goods> findoutAll() {
        return dao.findoutAll();
    }

    @Override
    public void save(Goods goods) {
        dao.save(goods);
    }

    @Override
    public void remove(Integer id) {
        dao.remove(id);
    }

    @Override
    public void removeout(Integer id) {dao.removeout(id);

    }

    @Override
    public List<Goods> findup(Integer id) {
        return dao.findup(id);
    }

    @Override
    public List<Goods> findnum(Integer id) {
        return dao.findnum(id);
    }

    @Override
    public List<Goods> findnum1(Integer id) {
        return dao.findnum1(id);
    }

    @Override
    public void update(Goods goods) {
        dao.update(goods);
    }

    @Override
    public void up(Goods goods) {
        dao.up(goods);
    }

    @Override
    public void outup(Goods goods) {
        dao.outup(goods);
        int na=0;
        int count =0;
        List<Goods> list=dao.findup(goods.getId());
        na=dao.findoutno(goods.getGoodsno());
        for(Goods name:list){
             count=name.getGoodsnumber();
        }
         if(na==0&&count==0){
             dao.outin(goods);
             dao.remove(goods.getId());
         }else if(na==1&&count==0){
             dao.outupp(goods);
             dao.remove(goods.getId());
         }else if(na==0&&count!=0){
             dao.outin(goods);
         }else if(na==1&&count!=0){
             dao.outupp(goods);
         }

    }

    @Override
    public int findoutno(Integer goodsno) {
        return dao.findoutno(goodsno);
    }

    @Override
    public List<Goodsecharts> outout() {
        return dao.outout();
    }

    @Override
    public List<Num> outout2() {
        return dao.outout2();
    }

    @Override
    public String Login(String username) {
        return dao.Login(username);
    }
}
