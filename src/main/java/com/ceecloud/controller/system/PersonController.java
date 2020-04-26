package com.ceecloud.controller.system;

import com.ceecloud.annotation.SystemLog;
import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.*;
import com.ceecloud.exception.SystemException;
import com.ceecloud.mapper.DeptPersonMapper;
import com.ceecloud.mapper.PersonMapper;
import com.ceecloud.mapper.ResourcesMapper;
import com.ceecloud.mapper.UserMapper;
import com.ceecloud.plugin.PageView;
import com.ceecloud.util.Common;
import com.ceecloud.util.DomainProperties;
import com.ceecloud.util.PasswordHelper;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by SyJun on 2016/6/28.
 */
@Controller
@RequestMapping("/person/")
public class PersonController extends BaseController{
    @Inject
    private PersonMapper personMapper;

    @Inject
    private UserMapper userMapper;

    @Inject
    private DeptPersonMapper deptPersonMapper;

    @Inject
    private ResourcesMapper resourcesMapper;

    private static String mymeetingDomain = DomainProperties.getProperty("mymeetingDomain");

    private static String liveDomain = DomainProperties.getProperty("liveDomain");

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("companyId",getPara("companyId"));
        if(Common.isEmpty(getPara("companyId"))){
            String userId = SecurityUtils.getSubject().getSession().getAttribute("userSessionId").toString();
            UserFormMap userFormMap = userMapper.findbyFrist("id",userId,UserFormMap.class);
            PersonFormMap personFormMap = personMapper.findbyFrist("id",userFormMap.get("personId").toString(),PersonFormMap.class);
            if(Common.isNotEmpty(personFormMap.get("companyId").toString()) && !personFormMap.get("companyId").equals("0")){
                model.addAttribute("companyId",personFormMap.get("companyId"));
            }
        }
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        UserFormMap userFormMap = (UserFormMap)Common.findUserSession(request);
        List<ResourcesFormMap> resourcesFormMapList = findByRes();
        ResourcesFormMap resFormMap1 = new ResourcesFormMap();
        resFormMap1.put("parentId",getPara("id"));
        resFormMap1.put("roleId",userFormMap.get("role"));
        String order = " order by level asc";
        resFormMap1.put("$orderby", order);
        List<ResourcesFormMap> resourcesFormMapList1 =  resourcesMapper.findRes(resFormMap1);
        for (ResourcesFormMap resFormMap : resourcesFormMapList1) {
            Object o =resFormMap.get("description");
            if(o!=null&&!Common.isEmpty(o.toString())){
                resFormMap.put("description",Common.stringtohtml(o.toString()));
            }
        }
        for(int i = 0;i<resourcesFormMapList1.size();i++){
            ResourcesFormMap resourcesFormMap = resourcesFormMapList1.get(i);
            boolean as = false;
            for(int j=0;j<resourcesFormMapList.size();j++){
                if(resourcesFormMap.get("resKey").equals(resourcesFormMapList.get(j).get("resKey"))){
                    as = true;
                    break;
                }
            }
            if(!as){
                resourcesFormMapList.add(resourcesFormMap);
            }
        }
        model.addAttribute("res", resourcesFormMapList);
        return Common.BACKGROUND_PATH + "/system/person/list";
    }

    @RequestMapping("slist")
    public String slistUI(Model model) throws Exception {
        model.addAttribute("companyId",getPara("companyId"));
        if(Common.isEmpty(getPara("companyId"))){
            String userId = SecurityUtils.getSubject().getSession().getAttribute("userSessionId").toString();
            UserFormMap userFormMap = userMapper.findbyFrist("id",userId,UserFormMap.class);
            PersonFormMap personFormMap = personMapper.findbyFrist("id",userFormMap.get("personId").toString(),PersonFormMap.class);
            if(Common.isNotEmpty(personFormMap.get("companyId").toString()) && !personFormMap.get("companyId").equals("0")){
                model.addAttribute("companyId",personFormMap.get("companyId"));
            }
        }
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        UserFormMap userFormMap = (UserFormMap)Common.findUserSession(request);
        List<ResourcesFormMap> resourcesFormMapList = findByRes();
        ResourcesFormMap resFormMap1 = new ResourcesFormMap();
        resFormMap1.put("parentId",getPara("id"));
        resFormMap1.put("roleId",userFormMap.get("role"));
        String order = " order by level asc";
        resFormMap1.put("$orderby", order);
        List<ResourcesFormMap> resourcesFormMapList1 =  resourcesMapper.findRes(resFormMap1);
        for (ResourcesFormMap resFormMap : resourcesFormMapList1) {
            Object o =resFormMap.get("description");
            if(o!=null&&!Common.isEmpty(o.toString())){
                resFormMap.put("description",Common.stringtohtml(o.toString()));
            }
        }
        for(int i = 0;i<resourcesFormMapList1.size();i++){
            ResourcesFormMap resourcesFormMap = resourcesFormMapList1.get(i);
            boolean as = false;
            for(int j=0;j<resourcesFormMapList.size();j++){
                if(resourcesFormMap.get("resKey").equals(resourcesFormMapList.get(j).get("resKey"))){
                    as = true;
                    break;
                }
            }
            if(!as){
                resourcesFormMapList.add(resourcesFormMap);
            }
        }
        model.addAttribute("res", resourcesFormMapList);
        return Common.BACKGROUND_PATH + "/system/person/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        PersonFormMap personFormMap = getFormMap(PersonFormMap.class);
        String companyId = getPara("companyId");
        if(Common.isNotEmpty(companyId)) {
            personFormMap.put("companyId", companyId);
        }
        personFormMap=toFormMap(personFormMap, pageNow, pageSize,personFormMap.getStr("orderby"));
        personFormMap.put("column", column);
        personFormMap.put("sort", sort);
        if(null !=personFormMap.getStr("name")){
            personFormMap.put("name", "%" + personFormMap.getStr("name") + "%");
        }
        pageView.setRecords(personMapper.findPersonPage(personFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        model.addAttribute("companyId",getPara("companyId"));
        return Common.BACKGROUND_PATH + "/system/person/add";
    }

    @RequestMapping("saddUI")
    public String saddUI(Model model) throws Exception {
        model.addAttribute("companyId",getPara("companyId"));
        return Common.BACKGROUND_PATH + "/system/person/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module="系统管理",methods="公司管理-新增员工")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    public String addEntity(String txtGroupsSelect){
        try {
            PersonFormMap personFormMap = getFormMap(PersonFormMap.class);
            if(Common.isEmpty(getPara("companyId"))){
                String userId = SecurityUtils.getSubject().getSession().getAttribute("userSessionId").toString();
                UserFormMap userFormMap = userMapper.findbyFrist("id",userId,UserFormMap.class);
                PersonFormMap personFormMap1 = personMapper.findByAttribute("id",userFormMap.get("personId").toString(),PersonFormMap.class).get(0);
                if(!personFormMap1.get("companyId").toString().equals("0")) {
                    personFormMap.set("companyId", personFormMap1.get("companyId"));
                }
            }
            personFormMap.set("type", 2);
            personFormMap.set("state", 1);
            personMapper.addEntity(personFormMap);//新增后返回新增信息
            UserFormMap userFormMap = getFormMap(UserFormMap.class);
            PasswordHelper passwordHelper = new PasswordHelper();
            userFormMap.set("username",personFormMap.get("username"));
            userFormMap.set("password","123456");
            userFormMap.set("newpassword",userFormMap.get("password"));
            userFormMap.set("isLock","0");
            userFormMap.set("state","1");
            /*if(txtGroupsSelect.indexOf(",")>-1){
                return "error";
            }*/
            userFormMap.set("role",5);
            userFormMap.set("personId",personFormMap.get("id"));
            passwordHelper.encryptPassword(userFormMap);
            userMapper.addEntity(userFormMap);
        } catch (Exception e) {
            throw new SystemException("添加员工异常");
        }
        return "success";
    }

    @ResponseBody
    @RequestMapping("deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="系统管理",methods="公司管理-删除员工")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            UserFormMap userFormMap = new UserFormMap();
            userFormMap = userMapper.findbyFrist("personId",id,UserFormMap.class);
            userMapper.deleteByAttribute("personId", id, UserFormMap.class);
            personMapper.deleteByAttribute("id",id,PersonFormMap.class);
            ResUserFormMap resUserFormMap = new ResUserFormMap();
            resUserFormMap.set("userId", userFormMap.get("id"));
            resourcesMapper.deleteResUser(resUserFormMap);
        }
        return "success";
    }

    @RequestMapping("editUI")
    public String editUI(Model model) throws Exception {
        String id = getPara("id");
        if(Common.isNotEmpty(id)){
            UserFormMap userFormMap = getFormMap(UserFormMap.class);
            PersonFormMap personFormMap = getFormMap(PersonFormMap.class);
            personFormMap.set("id",id);
            List<PersonFormMap> list = personMapper.findByNames(personFormMap);
            personFormMap = list.get(0);
            List<UserFormMap> lst = userMapper.findByAttribute("personId",id,UserFormMap.class);
            personFormMap.set("username",lst.get(0).get("username"));
            personFormMap.set("userId",lst.get(0).get("id"));
            model.addAttribute("person", personFormMap);
        }
        return Common.BACKGROUND_PATH + "/system/person/edit";
    }

    @RequestMapping("seditUI")
    public String seditUI(Model model) throws Exception {
        String id = getPara("id");
        if(Common.isNotEmpty(id)){
            UserFormMap userFormMap = getFormMap(UserFormMap.class);
            PersonFormMap personFormMap = getFormMap(PersonFormMap.class);
            personFormMap.set("id",id);
            List<PersonFormMap> list = personMapper.findByNames(personFormMap);
            personFormMap = list.get(0);
            List<UserFormMap> lst = userMapper.findByAttribute("personId",id,UserFormMap.class);
            personFormMap.set("username",lst.get(0).get("username"));
            personFormMap.set("userId",lst.get(0).get("id"));
            model.addAttribute("person", personFormMap);
        }
        return Common.BACKGROUND_PATH + "/system/person/edit";
    }

    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="系统管理",methods="公司管理-修改员工信息")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity(String txtGroupsSelect) throws Exception {
        PersonFormMap personFormMap = getFormMap(PersonFormMap.class);
//        companyFormMap.put("txtGroupsSelect", txtGroupsSelect);
        if(txtGroupsSelect.indexOf(",")>-1){
            return "error";
        }
        personMapper.editEntity(personFormMap);
        DeptPersonFormMap deptPersonFormMap = getFormMap(DeptPersonFormMap.class);
        List<PersonFormMap> list = personMapper.findByAttribute("id",personFormMap.getStr("id"),PersonFormMap.class);
        personMapper.deleteByAttribute("personId", personFormMap.get("id")+"", DeptPersonFormMap.class);
        if(Common.isNotEmpty(txtGroupsSelect)) {
            deptPersonFormMap.put("deptId", txtGroupsSelect);
            deptPersonFormMap.put("personId", personFormMap.get("id"));
            deptPersonFormMap.put("companyId", list.get(0).get("companyId"));
            deptPersonMapper.addEntity(deptPersonFormMap);
        }
        return "success";
    }

    @RequestMapping("toFreePersonUI")
    public String toFreePersonUI(Model model) {
        return Common.BACKGROUND_PATH + "/system/person/freelist";
    }

    @ResponseBody
    @RequestMapping("findFreePerson")
    public PageView findFreePerson(String pageNow,
                                   String pageSize, String column, String sort) throws Exception {
        String name = getPara("name");
        PersonFormMap person = getFormMap(PersonFormMap.class);
        person = toFormMap(person, pageNow, pageSize, person.getStr("orderby"));
        if(Common.isNotEmpty(name)){
            person.put("name", name);
        }
        person.put("column", column);
        person.put("sort", sort);
        if(null !=person.getStr("name")){
            person.put("name", "%" + person.getStr("name") + "%");
        }
        List<PersonFormMap> personList = personMapper.findFreePerson(person);
        pageView.setRecords(personList);//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
    }

    @ResponseBody
    @RequestMapping("fixPerson")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="系统管理",methods="公司管理-分配员工")//凡需要处理业务逻辑的.都需要记录操作日志
    public String fixPerson() throws Exception {
        String companyId = getPara("companyId");
        try {
            if(Common.isEmpty(getPara("companyId"))){
                String userId = SecurityUtils.getSubject().getSession().getAttribute("userSessionId").toString();
                UserFormMap userFormMap = userMapper.findbyFrist("id",userId,UserFormMap.class);
                PersonFormMap personFormMap = personMapper.findByAttribute("id",userFormMap.get("personId").toString(),PersonFormMap.class).get(0);
                companyId = personFormMap.get("companyId").toString();
            }
            String ids = getPara("ids");
            if (Common.isNotEmpty(ids)) {
                if(ids.contains(",")) {
                    String[] idss = ids.split(",");
                    for (int i = 0; i < idss.length; i++) {
                        UserFormMap userFormMap = new UserFormMap();
                        userFormMap.put("personId", idss[i]);
                        UserFormMap user = userMapper.findByPersonId(userFormMap);
                        user.set("role", 5);
                        userMapper.editEntity(user);
                        PersonFormMap person = new PersonFormMap();
                        person = personMapper.findbyFrist("id", idss[i], PersonFormMap.class);
                        person.set("type", 2);
                        person.set("companyId", companyId);
                        personMapper.editEntity(person);
                    }
                }else{
                    UserFormMap userFormMap = new UserFormMap();
                    userFormMap.put("personId", ids);
                    UserFormMap user = userMapper.findByPersonId(userFormMap);
                    user.set("role", 5);
                    userMapper.editEntity(user);
                    PersonFormMap person = new PersonFormMap();
                    person = personMapper.findbyFrist("id", ids.toString(), PersonFormMap.class);
                    person.set("type", 2);
                    person.set("companyId", companyId);
                    personMapper.editEntity(person);
                }
            }
        } catch (Exception e) {
            throw new SystemException("分配员工异常");
        }
        return "success";
    }

    /**
     * 验证用户名是否存在
     *
     * @author lanyuan Email：mmm333zzz520@163.com date：2014-2-19
     * @param name
     * @return
     */
    @RequestMapping("isUserExist")
    @ResponseBody
    public boolean isUserExist(String name,String id) {
        UserFormMap user = new UserFormMap();
        if(id!=null){
            user = userMapper.findbyFrist("personId", id, UserFormMap.class);
        }
        UserFormMap account = userMapper.findbyFrist("username", name, UserFormMap.class);
        Boolean isTrue = (account!=null && user.size()!=0) ? (((account.get("username").toString()).equals(user.get("username").toString())) ? true : false) : (account==null) ? true : false;
        if (account == null  || isTrue) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 验证用户手机号是否存在
     *
     * @author lanyuan Email：mmm333zzz520@163.com date：2014-2-19
     * @param name
     * @return
     */
    @RequestMapping("isMobileExist")
    @ResponseBody
    public boolean isMobileExist(String name,String id) {
        PersonFormMap person = new PersonFormMap();
        if(id!=null){
            person = personMapper.findbyFrist("id", id, PersonFormMap.class);
        }
        PersonFormMap personFormMap = personMapper.findbyFrist("mobile", name, PersonFormMap.class);
        Boolean isTrue = (personFormMap!=null && person.size()!=0) ? (((personFormMap.get("mobile").toString()).equals(person.get("mobile").toString())) ? true : false) : (personFormMap==null) ? true : false;
        if (personFormMap == null || isTrue) {
            return true;
        } else {
            return false;
        }
    }
}
