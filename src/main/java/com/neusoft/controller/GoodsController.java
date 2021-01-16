package com.neusoft.controller;

import com.neusoft.domain.Goods;
import com.neusoft.domain.Goodsecharts;
import com.neusoft.domain.User;
import com.neusoft.service.GoodsService;
import com.neusoft.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

/**
 * @author ：konan
 * @date ：2020/11/19 12:33
 */
@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    private GoodsService goodsService;
    @RequestMapping(value = "/findAll",produces = "text/plain;charset=utf-8")
    public String findAll(Model model,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        List<Goods> list=goodsService.findAll();
        for(Goods l:list){
            System.out.println(l);
        }
        model.addAttribute("goodslist",list);
        return "goodslist";
    }
    @RequestMapping(value = "/findoutAll",produces = "application/json")
    public String findoutAll(Model model,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        List<Goods> list=goodsService.findoutAll();
        for(Goods l:list){
            System.out.println(l);
        }
        model.addAttribute("goodsoutlist",list);
        return "goodsoutlist";
    }
    @RequestMapping(value = "/save",produces = "text/plain;charset=utf-8")
    public void save(Goods goods, HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        goodsService.save(goods);
        response.sendRedirect(request.getContextPath()+"/goods/findAll");
    }
    @RequestMapping("/delete")
    public void delete(Integer id,HttpServletResponse response,HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        goodsService.remove(id);
        response.sendRedirect(request.getContextPath()+"/goods/findAll");
    }
    @RequestMapping(value = "/update",produces = "text/plain;charset=utf-8")
    public void update(Goods goods,HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        System.out.println(goods.getGoodsprice());
        System.out.println(goods.getGoodsname());
        goodsService.update(goods);
        response.sendRedirect(request.getContextPath()+"/goods/findAll");
    }
    @RequestMapping("/deleteout")
    public void deleteout(Integer id,HttpServletResponse response,HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        goodsService.removeout(id);
        response.sendRedirect(request.getContextPath()+"/goods/findoutAll");
    }
    @RequestMapping("/findup")
    public String findup(Model model,Integer id,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<Goods> uplist=goodsService.findup(id);
        model.addAttribute("goodsuplist",uplist);
        return "goodsupdate";
    }

    @RequestMapping("/findnum")
    public String  findnum(Integer id,Model model,HttpServletResponse response,HttpServletRequest request){
        List<Goods> list=goodsService.findnum(id);
        model.addAttribute("goodsup",list);
        return "goodsup";
    }
    @RequestMapping("/findoutnum")
    public String  findoutnum(Integer id,Model model,HttpServletResponse response,HttpServletRequest request){
        List<Goods> list=goodsService.findup(id);
        model.addAttribute("goodsoutup",list);
        return "goodsoutup";
    }
    @RequestMapping(value = "/up",produces = "text/plain;charset=utf-8")
    public void up(Goods goods,HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        System.out.println(goods.getGoodsnumber());
        goodsService.up(goods);
        response.sendRedirect(request.getContextPath()+"/goods/findAll");
    }
    @RequestMapping(value = "/outup",produces = "text/plain;charset=utf-8")
    public void outup(Goods goods,HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        goodsService.outup(goods);

        response.sendRedirect(request.getContextPath()+"/goods/findAll");
    }

}
