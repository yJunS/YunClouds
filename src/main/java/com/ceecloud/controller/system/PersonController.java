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
import com.ceecloud.util.HttpClientUtil;
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
        Integer companyId = Integer.valueOf(getPara("companyId"));
        personFormMap.put("companyId",companyId);
        personFormMap=toFormMap(personFormMap, pageNow, pageSize,personFormMap.getStr("orderby"));
        personFormMap.put("column", column);
        personFormMap.put("sort", sort);
        pageView.setRecords(personMapper.findPersonPage(personFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        return Common.BACKGROUND_PATH + "/system/person/add";
    }

    @RequestMapping("saddUI")
    public String saddUI(Model model) throws Exception {
        return Common.BACKGROUND_PATH + "/system/person/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module="系统管理",methods="公司管理-新增员工")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    public String addEntity(String txtGroupsSelect){
        try {
            PersonFormMap personFormMap = getFormMap(PersonFormMap.class);
            personMapper.addEntity(personFormMap);//新增后返回新增信息
            UserFormMap userFormMap = getFormMap(UserFormMap.class);
            PasswordHelper passwordHelper = new PasswordHelper();
            userFormMap.set("username",personFormMap.get("username"));
            userFormMap.set("password","123456789");
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
            HttpClientUtil httpClientUtil = new HttpClientUtil();
            JSONObject as = httpClientUtil.doGet(mymeetingDomain + "CasUserSync_syncCasUser.action","username="+userFormMap.get("username")+"&password="+userFormMap.get("newpassword") + "&casId=" + userFormMap.get("id"));
            if(as.getBoolean("status")) {
                JSONObject as1 = httpClientUtil.doGet(liveDomain + "CasUserSync_syncCasUser.action", "username=" + userFormMap.get("username") + "&password=" + userFormMap.get("newpassword") + "&casId=" + userFormMap.get("id"));
                if(as1.getBoolean("status")){
                    System.out.println("add is ok!");
                }
            }
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
            personMapper.deleteByAttribute("id", id, PersonFormMap.class);
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

    /**
     * 验证公司是否存在
     *
     * @author lanyuan Email：mmm333zzz520@163.com date：2014-2-19
     * @param name
     * @return
     */
    @RequestMapping("isExist")
    @ResponseBody
    public boolean isExist(String name) {
        CompanyFormMap account = personMapper.findbyFrist("name", name, CompanyFormMap.class);
        if (account == null) {
            return true;
        } else {
            return false;
        }
    }
}
