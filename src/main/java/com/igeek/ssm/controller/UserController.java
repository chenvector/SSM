package com.igeek.ssm.controller;

import com.igeek.ssm.pojo.User;
import com.igeek.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService service;

    //登录
    @RequestMapping("/login.action")
    public String login(Integer id, String username, Model model, HttpSession session){
        User user = service.login(id, username);
        if(user!=null){
            //登录成功
            session.setAttribute("user",user);
            return "../main.jsp";
        }else{
            //登录失败
            model.addAttribute("msg","用户名和密码不匹配，请重新登录！");
            model.addAttribute("username",username);
            return "../login.jsp";
        }
    }

    //登出
    @RequestMapping("/logout.action")
    public String logout(Model model , HttpSession session){
        session.invalidate();
        model.addAttribute("msg","已登出！");
        return "../login.jsp";
    }


    //校验用户名是否存在   @ResponseBody 将值抓换成json数据传递至页面
    @RequestMapping("/validate.action")
    @ResponseBody
    public boolean validate(String username){
        boolean b = service.validateName(username);
        return b;
    }

    //注册
    @RequestMapping("/regist.action")
    public String regist(User user, Model model, MultipartFile user_pic) throws IOException {

        //文件上传
        if(user_pic!=null){
            String oldName = user_pic.getOriginalFilename();
            if(oldName!=null && oldName.length()>=0){
                String newName = UUID.randomUUID() + oldName.substring(oldName.lastIndexOf("."));
                user_pic.transferTo(new File("E:\\ssm\\day3\\temp\\"+newName));
                user.setPic("/pic/"+newName);
            }
        }

        //注册
        boolean flag = service.regist(user);
        if(flag){
            //注册成功
            model.addAttribute("username",user.getUsername());
            return "../login.jsp";
        }else{
            //注册失败，回显信息
            return "../regist.jsp";
        }
    }


}
