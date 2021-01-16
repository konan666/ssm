package com.neusoft.domain;

import java.io.Serializable;

/**
 * @author ：konan
 * @date ：2020/9/9 14:41
 */
public class Account implements Serializable {
 private Integer id;
 private Integer uid;
 private double money;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", uid=" + uid +
                ", money=" + money +
                '}';
    }
}

