package com.igeek.ssm.service;

import com.igeek.ssm.dao.UserMapper;
import com.igeek.ssm.pojo.User;
import com.igeek.ssm.pojo.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserMapper mapper;


    //登录
    @Transactional(readOnly = true)
    public User login(Integer id,String username){
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo(id);
        criteria.andUsernameEqualTo(username);
        List<User> users = mapper.selectByExample(example);
        User user = null;
        for (User u : users) {
            user = u;
        }
        return user;
    }

    //校验用户名是否存在
    public boolean validateName(String username){
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<User> users = mapper.selectByExample(example);
        if (users.size()==0) {
            //当前用户名不存在，可以使用
            return true;
        }
        //当前用户名存在，不可以使用
        return false;
    }

    //注册
    public boolean regist(User user){
        boolean b = this.validateName(user.getUsername());
        if(b){
            //执行插入
            mapper.insertSelective(user);
            return true;
        }
        return false;
    }

}
