package com.neusoft.domain;

import java.io.Serializable;

/**
 * @author ：konan
 * @date ：2020/11/19 12:06
 */
public class Goods implements Serializable {
    private int id;/*商品id*/
    private String goodsname;/*商品名称*/
    private int goodsno;/*商品编号*/
    private String goodscs;/*生产厂商*/
    private Double goodsprice;/*商品价格*/
    private String goodscategory;/*商品类别*/
    private int goodsnumber;/*商品数量*/

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public int getGoodsno() {
        return goodsno;
    }

    public void setGoodsno(int goodsno) {
        this.goodsno = goodsno;
    }

    public String getGoodscs() {
        return goodscs;
    }

    public void setGoodscs(String goodscs) {
        this.goodscs = goodscs;
    }

    public Double getGoodsprice() {
        return goodsprice;
    }

    public void setGoodsprice(Double goodsprice) {
        this.goodsprice = goodsprice;
    }

    public String getGoodscategory() {
        return goodscategory;
    }

    public void setGoodscategory(String goodscategory) {
        this.goodscategory = goodscategory;
    }

    public int getGoodsnumber() {
        return goodsnumber;
    }

    public void setGoodsnumber(int goodsnumber) {
        this.goodsnumber = goodsnumber;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", goodsname='" + goodsname + '\'' +
                ", goodsno=" + goodsno +
                ", goodscs='" + goodscs + '\'' +
                ", goodsprice=" + goodsprice +
                ", goodscategory='" + goodscategory + '\'' +
                ", goodsnumber=" + goodsnumber +
                '}';
    }
}
