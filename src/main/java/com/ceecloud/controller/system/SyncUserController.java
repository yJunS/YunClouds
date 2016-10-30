package com.ceecloud.controller.system;

import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.PersonFormMap;
import com.ceecloud.entity.UserFormMap;
import com.ceecloud.mapper.PersonMapper;
import com.ceecloud.mapper.UserMapper;
import com.ceecloud.util.PasswordHelper;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by SyJun on 2016/8/26.
 */
@Controller
@RequestMapping("/sync/")
public class SyncUserController extends BaseController {
    @Inject
    private UserMapper userMapper;

    @Inject
    private PersonMapper personMapper;

    @ResponseBody
    @RequestMapping("/syncUser")
    public JSONObject syncUser(HttpServletRequest request, HttpServletResponse response){
        String name = null;
        String username = null;
        String password = null;
        name = request.getParameter("name");
        if(name==null || name.equals(""))
            name = "";
        username = request.getParameter("username");
        if(username==null || username.equals(""))
            username = "";
        password = request.getParameter("password");
        if(password==null || password.equals(""))
            password = "";
        JSONObject jo = new JSONObject();
        try {
            if(!username.equals("")) {
                UserFormMap user = new UserFormMap();
                user = userMapper.findbyFrist("username",username,UserFormMap.class);
                if(user==null) {
                    PersonFormMap person = new PersonFormMap();
                    person.set("name", name);
                    person.set("type", "3");
                    person.set("companyId", -1);
                    person.set("state", 1);
                    personMapper.addEntity(person);
                    user = new UserFormMap();
                    PasswordHelper passwordHelper = new PasswordHelper();
                    user.set("username", username);
                    user.set("accountName",username);
                    user.set("password", password);
                    user.set("isLock", "0");
                    user.set("state", "1");
                    user.set("role", 6);
                    user.set("personId", person.get("id"));
                    passwordHelper.encryptPassword(user);
                    userMapper.addEntity(user);
                }
                jo.element("status", true);
                jo.element("userId", user.get("id"));
            }
        } catch (Exception e) {
            jo.element("status",false);
            jo.element("errMsg",e.getMessage());
            e.printStackTrace();
        }
        return jo;
    }

    @ResponseBody
    @RequestMapping("/syncUserPassword")
    public JSONObject syncUserPassword(HttpServletRequest request, HttpServletResponse response){
        String username = null;
        String password = null;
        username = request.getParameter("username");
        if(username==null || username.equals(""))
            username = "";
        password = request.getParameter("password");
        if(password==null || password.equals(""))
            password = "";
        JSONObject jo = new JSONObject();
        try {
            UserFormMap user = new UserFormMap();
            user = userMapper.findbyFrist("username",username,UserFormMap.class);
            PasswordHelper passwordHelper = new PasswordHelper();
            user.set("password",password);
            passwordHelper.encryptPassword(user);
            userMapper.editEntity(user);
            jo.element("status",true);
            jo.element("userId",user.get("id"));
        } catch (Exception e) {
            jo.element("status",false);
            jo.element("errMsg",e.getMessage());
            e.printStackTrace();
        }
        return jo;
    }
}
