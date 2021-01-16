package com.neusoft.dao;

import com.neusoft.domain.Goods;
import com.neusoft.domain.Goodsecharts;
import com.neusoft.domain.Num;
import com.neusoft.domain.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author ：konan
 * @date ：2020/11/19 12:12
 */
@Repository
public interface GoodsDao {
    @Select("select * from goods")
    public List<Goods> findAll();
    @Select("insert into goods(goodsname,goodsno,goodscs,goodsprice,goodscategory,goodsnumber) values (#{goodsname},#{goodsno},#{goodscs},#{goodsprice},#{goodscategory},#{goodsnumber})")
    public void save(Goods goods);
    @Select("delete from goods where id=#{id}")
    public void remove(Integer id);
    @Select("select * from goods where id=#{id}")
    public List<Goods> findup(Integer id);
    @Select("update goods set goodsname=#{goodsname},goodsno=#{goodsno},goodscs=#{goodscs},goodsprice=#{goodsprice},goodscategory=#{goodscategory},goodsnumber=#{goodsnumber} where id=#{id}")
    public void update(Goods goods);
    @Select("select * from goodsout")
    public List<Goods> findoutAll();

    @Select("delete from goodsout where id=#{id}")
    public void removeout(Integer id);

    @Select("update goods set goodsnumber=goodsnumber+#{goodsnumber} where id=#{id}")
    public void up(Goods goods);
    @Select("select * from goods where id=#{id}")
    public List<Goods> findnum(Integer id);
    /*取出库表的相同商品名字*/
    @Select("select * from goodsout where id=#{id}")
    public List<Goods> findnum1(Integer id);
    /*计算出库删除源库的数量*/
    @Select("update goods set goodsnumber=goodsnumber-#{goodsnumber} where id=#{id}")
    public void outup(Goods goods);
    /*向出库列表添加数据*/
    @Select("update goodsout set goodsname=#{goodsname},goodsno=#{goodsno},goodscs=#{goodscs},goodsprice=#{goodsprice},goodscategory=#{goodscategory},goodsnumber=goodsnumber+#{goodsnumber} where goodsname=#{goodsname}")
    public void outupp(Goods goods);
    /*向出库列表新增数据*/
    @Select("insert into goodsout(goodsname,goodsno,goodscs,goodsprice,goodscategory,goodsnumber) values (#{goodsname},#{goodsno},#{goodscs},#{goodsprice},#{goodscategory},#{goodsnumber})")
    public void outin(Goods goods);
    /*查询出库表编号是否存在*/
    @Select("select count(*) from goodsout where goodsno=#{goodsno}")
    public int findoutno(Integer goodsno);
    @Select("select goodscategory,sum(goodsnumber) as goodsnumber from goods GROUP BY goodscategory")
    public  List<Goodsecharts> outout();
    @Select("select count,xavg,yavg,zavg,xfc,yfc,zfc,count1,xavg1,yavg1,zavg1,xfc1,yfc1,zfc1 from num")
    public List<Num> outout2();
    @Select("select count(count) from num where count=#{count}")
    public String Login(String username);

}
