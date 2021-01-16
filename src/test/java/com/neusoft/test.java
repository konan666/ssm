package com.neusoft;

import com.neusoft.dao.GoodsDao;
import com.neusoft.domain.Goods;
import com.neusoft.domain.Goodsecharts;
import com.neusoft.domain.User;
import com.neusoft.service.GoodsService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ：konan
 * @date ：2020/11/28 19:43
 */
public class test {
    ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
    GoodsService as= ac.getBean("GoodsServiceImpl", GoodsService.class);
    @Test
    public void findall() throws SQLException {
        List<Goods> list=as.findAll();
        for(Goods e:list){
            System.out.println(e);
        }
    }
    @Test
    public void findall11() throws SQLException {
        List<Goodsecharts> list=as.outout();
        for(Goodsecharts e:list){
            System.out.println(e);
        }
    }
    @Test
    public void findall111() throws SQLException {
        String num=as.Login("500");
        System.out.println(num);
    }
}
