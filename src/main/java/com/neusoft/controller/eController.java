package com.neusoft.controller;

import com.neusoft.domain.Goodsecharts;
import com.neusoft.domain.Num;
import com.neusoft.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author ：konan
 * @date ：2020/11/29 16:16
 */
@CrossOrigin
@Controller
@RequestMapping("/echarts")
public class eController {
    @Autowired
    private GoodsService goodsService;

    @RequestMapping(value = "/outout")
    @ResponseBody
    public List<Goodsecharts> outout(){
        List<Goodsecharts> list =goodsService.outout();
        return list;
    }
    @RequestMapping(value = "/outout2")
    @ResponseBody
    public List<Num> outout2(){
        List<Num> list=goodsService.outout2();
        return list;
    }
    @RequestMapping(value = "login")
    @ResponseBody
    public String Login(String username){
        String count=goodsService.Login(username);
        int co=Integer.parseInt(count);
        if(co==1) {
            return "{\"msg\":\"false\"}";
        }
        return "{\"msg\":\"true\"}";


    }
}
