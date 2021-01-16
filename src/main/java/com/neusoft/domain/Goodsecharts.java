package com.neusoft.domain;

import java.io.Serializable;

/**
 * @author ：konan
 * @date ：2020/11/29 15:48
 */
public class Goodsecharts implements Serializable {
    private String goodscategory;
    private int goodsnumber;

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
        return "Goodsecharts{" +
                "goodscategory='" + goodscategory + '\'' +
                ", goodsnumber='" + goodsnumber + '\'' +
                '}';
    }
}
