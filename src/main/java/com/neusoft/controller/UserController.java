package com.neusoft.controller;

import com.neusoft.domain.Goods;
import com.neusoft.domain.User;
import com.neusoft.service.GoodsService;
import com.neusoft.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * @author ：konan
 * @date ：2020/11/19 12:33
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userservice;
    @Autowired
    private GoodsService goodsService;
    @RequestMapping("/findAll")
    public String findAll(Model model,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<User> list=userservice.findAll();
        model.addAttribute("userlist",list);
        return "userlist";
    }
    @RequestMapping("/save")
    public void save(User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        userservice.save(user);
        response.sendRedirect(request.getContextPath()+"/user/findAll");
    }
    @RequestMapping("/delete")
    public void delete(Integer id,HttpServletResponse response,HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        userservice.remove(id);
        response.sendRedirect(request.getContextPath()+"/user/findAll");
    }
    @RequestMapping("/findup")
    public String findup(Model model,Integer id,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<User> uplist=userservice.findup(id);
        model.addAttribute("useruplist",uplist);
        return "userupdate";
    }
    @RequestMapping("/update")
    public void update(User user,HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        userservice.update(user);
        response.sendRedirect(request.getContextPath()+"/user/findAll");
    }
    @RequestMapping("/deletes")
    public void deletes(String ids[],HttpServletResponse response,HttpServletRequest request) throws IOException {
        System.out.println(ids);
        for (String id:ids){
            System.out.println(id);
        }
        userservice.deleteselect(ids);
        response.sendRedirect(request.getContextPath()+"/user/findAll");
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public Integer Login(User user, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int count=userservice.Login(user);
        int countsum=0;
        int countuser=userservice.countuser();
        int countgoods=userservice.countgoods();
        int countgoodsout=userservice.countgoodsout();
        List<Goods> list1=goodsService.findAll();
        List<Goods> list=goodsService.findoutAll();
        if(count!=0){
            HttpSession session=request.getSession();
            session.setAttribute("username",user.getUsername());
            session.setAttribute("countuser",countuser);
            countsum=countgoods+countgoodsout;
            session.setAttribute("countgoods",countgoods);
            session.setAttribute("countgoodsout",countgoodsout);
            session.setAttribute("countsum",countsum);
            session.setAttribute("goodsoutlist",list);
            session.setAttribute("goodslist",list1);
            response.sendRedirect(request.getContextPath()+"../../1.jsp");
        }else{
            response.setContentType("text/html;charser=utf-8");
            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.println("<p style=\"color:red;font-size:4vw;text-align:center;\">用户名或密码错误，返回登录页面</p>");
            response.setHeader("refresh", "2;URL=../../login.jsp");
        }
        return count;
    }
}
