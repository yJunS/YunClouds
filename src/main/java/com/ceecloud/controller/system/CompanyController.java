package com.ceecloud.controller.system;

import com.ceecloud.annotation.SystemLog;
import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.CompanyFormMap;
import com.ceecloud.entity.PersonFormMap;
import com.ceecloud.entity.ResourcesFormMap;
import com.ceecloud.entity.UserFormMap;
import com.ceecloud.exception.SystemException;
import com.ceecloud.mapper.CompanyMapper;
import com.ceecloud.mapper.PersonMapper;
import com.ceecloud.mapper.ResourcesMapper;
import com.ceecloud.mapper.UserMapper;
import com.ceecloud.plugin.PageView;
import com.ceecloud.util.Common;
import com.ceecloud.util.PasswordHelper;
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
@RequestMapping("/company/")
public class CompanyController  extends BaseController {
    @Inject
    private CompanyMapper companyMapper;

    @Inject
    private PersonMapper personMapper;

    @Inject
    private UserMapper userMapper;

    @Inject
    private ResourcesMapper resourcesMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
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
        return Common.BACKGROUND_PATH + "/system/company/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        CompanyFormMap companyFormMap = getFormMap(CompanyFormMap.class);
        companyFormMap=toFormMap(companyFormMap, pageNow, pageSize,companyFormMap.getStr("orderby"));
        companyFormMap.put("column", column);
        companyFormMap.put("sort", sort);
        if(null !=companyFormMap.getStr("name")){
            companyFormMap.put("name", "%" + companyFormMap.getStr("name") + "%");
        }
        pageView.setRecords(companyMapper.findCompanyPage(companyFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        return Common.BACKGROUND_PATH + "/system/company/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module="系统管理",methods="公司管理-新增公司")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    public String addEntity(String txtGroupsSelect){
        try {
            CompanyFormMap companyFormMap = getFormMap(CompanyFormMap.class);
            String error = "";
            if(Common.isNotEmpty(companyFormMap.get("partId").toString()) && Integer.valueOf(companyFormMap.get("partId").toString())<=0){
                error = "partError";
            }else if(Common.isEmpty(txtGroupsSelect)){
                error = "selectError";
            }else if(txtGroupsSelect.indexOf(",")>-1){
                error = "error";
            }
            if (Common.isNotEmpty(error)) {
                return error;
            }
            companyFormMap.set("type",(!txtGroupsSelect.equals("")?txtGroupsSelect:0));
            companyFormMap.set("state","1");
            companyFormMap.set("isAvailable","1");
            companyMapper.addEntity(companyFormMap);//新增后返回新增信息
            PersonFormMap personFormMap1 = new PersonFormMap();
            personFormMap1.set("name",companyFormMap.get("contactName"));
            personFormMap1.set("identityNum",companyFormMap.get("identityNum"));
            personFormMap1.set("email",companyFormMap.get("email"));
            personFormMap1.set("mobile",companyFormMap.get("mobile"));
            personFormMap1.set("type","1");
            personFormMap1.set("companyId",companyFormMap.get("id"));
            personFormMap1.set("state","1");
            personFormMap1.set("partId",companyFormMap.get("partId"));
            personMapper.addEntity(personFormMap1);
            UserFormMap userFormMap = new UserFormMap();
            PasswordHelper passwordHelper = new PasswordHelper();
            userFormMap.set("username",companyFormMap.get("username"));
            userFormMap.set("password","123456");
            userFormMap.set("role","4");
            userFormMap.set("isLock","0");
            userFormMap.set("state","1");
            userFormMap.set("personId",personFormMap1.get("id"));
            passwordHelper.encryptPassword(userFormMap);
            userMapper.addEntity(userFormMap);
        } catch (Exception e) {
            throw new SystemException("添加公司异常");
        }
        return "success";
    }

    @ResponseBody
    @RequestMapping("deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="系统管理",methods="公司管理-删除公司")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            companyMapper.deleteByAttribute("id", id, CompanyFormMap.class);
        }
        return "success";
    }

    @RequestMapping("editUI")
    public String editUI(Model model) throws Exception {
        String id = getPara("id");
        if(Common.isNotEmpty(id)){
            PersonFormMap personFormMap = getFormMap(PersonFormMap.class);
            personFormMap.set("companyId",id);
            personFormMap.set("type","1");
            List<PersonFormMap> list = personMapper.findByNames(personFormMap);
            CompanyFormMap companyFormMap = getFormMap(CompanyFormMap.class);
            companyFormMap = companyMapper.findbyFrist("id", id, CompanyFormMap.class);
            if(list.size()!=0){
               List<UserFormMap> lst  = userMapper.findByAttribute("personId",String.valueOf(list.get(0).get("id")), UserFormMap.class);
               companyFormMap.set("identityNum",list.get(0).get("identityNum")!=null?list.get(0).get("identityNum").toString():"");
               companyFormMap.set("username",lst.get(0).get("username"));
            }
            model.addAttribute("company", companyFormMap);
        }
        return Common.BACKGROUND_PATH + "/system/company/edit";
    }

    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="系统管理",methods="公司管理-修改公司信息")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity(String txtGroupsSelect) throws Exception {
        CompanyFormMap companyFormMap = getFormMap(CompanyFormMap.class);
//        companyFormMap.put("txtGroupsSelect", txtGroupsSelect);
        if(txtGroupsSelect.indexOf(",")>-1){
            return "error";
        }
        companyFormMap.set("type",(!txtGroupsSelect.equals("")?txtGroupsSelect:0));
        PersonFormMap personFormMap = getFormMap(PersonFormMap.class) ;
        personFormMap.set("companyId",companyFormMap.get("id"));
        personFormMap.set("type","1");
        List<PersonFormMap> list = personMapper.findByNames(personFormMap);
        PersonFormMap personFormMap1 = new PersonFormMap();
        if(list!=null&&list.size()!=0){
            personFormMap1 = list.get(0);
            personFormMap1.set("name",companyFormMap.get("contactName"));
            personFormMap1.set("mobile",companyFormMap.get("mobile"));
            personMapper.editEntity(personFormMap1);
        }
        companyMapper.editEntity(companyFormMap);
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
    public boolean isExist(String name,String id) {
        CompanyFormMap companyFormMap = new CompanyFormMap();
        if(id!=null) {
            companyFormMap = companyMapper.findbyFrist("id", id, CompanyFormMap.class);
        }
        CompanyFormMap account = companyMapper.findbyFrist("name", name, CompanyFormMap.class);
        Boolean isTrue = (account!=null && companyFormMap.size()!=0) ? (((account.get("name").toString()).equals(companyFormMap.get("name").toString())) ? true : false) : (account==null) ? true : false;
        if (account == null || isTrue) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 验证公司联系人用户名是否存在
     *
     * @author lanyuan Email：mmm333zzz520@163.com date：2014-2-19
     * @param name
     * @return
     */
    @RequestMapping("isUsernameExist")
    @ResponseBody
    public boolean isUsernameExist(String name,String id) {
        CompanyFormMap companyFormMap = new CompanyFormMap();
        List<PersonFormMap> listPerson = new ArrayList<PersonFormMap>();
        UserFormMap userFormMap1 = new UserFormMap();
        if(id!=null){
            companyFormMap = companyMapper.findbyFrist("id", id, CompanyFormMap.class);
            PersonFormMap personFormMap = new PersonFormMap();
            personFormMap.set("companyId",companyFormMap.get("id"));
            listPerson = personMapper.findCompanyManager(personFormMap);
            userFormMap1 = userMapper.findbyFrist("personId", listPerson.get(0).get("id").toString(), UserFormMap.class);
        }
        UserFormMap userFormMap = userMapper.findbyFrist("username", name, UserFormMap.class);
        Boolean isTrue = (userFormMap!=null && userFormMap1.size()!=0) ? (((userFormMap.get("username").toString()).equals(userFormMap1.get("username").toString())) ? true : false) : (userFormMap==null) ? true : false;
        if (userFormMap == null || isTrue) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 验证公司联系人手机号是否存在
     *
     * @author lanyuan Email：mmm333zzz520@163.com date：2014-2-19
     * @param name
     * @return
     */
    @RequestMapping("isMobileExist")
    @ResponseBody
    public boolean isMobileExist(String name,String id) {
        CompanyFormMap companyFormMap = new CompanyFormMap();
        List<PersonFormMap> listPerson = new ArrayList<PersonFormMap>();
        if(id!=null){
            companyFormMap = companyMapper.findbyFrist("id", id, CompanyFormMap.class);
            PersonFormMap personFormMap = new PersonFormMap();
            personFormMap.set("companyId",companyFormMap.get("id"));
            listPerson = personMapper.findCompanyManager(personFormMap);
        }
        PersonFormMap personFormMap = personMapper.findbyFrist("mobile", name, PersonFormMap.class);
        Boolean isTrue = (personFormMap!=null && companyFormMap.size()!=0) ? (((personFormMap.get("mobile").toString()).equals(listPerson.get(0).get("mobile").toString())) ? true : false) : (personFormMap==null) ? true : false;
        if (personFormMap == null || isTrue) {
            return true;
        } else {
            return false;
        }
    }
}
