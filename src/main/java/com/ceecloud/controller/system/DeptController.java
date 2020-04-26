package com.ceecloud.controller.system;

import com.ceecloud.annotation.SystemLog;
import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.DeptFormMap;
import com.ceecloud.entity.PersonFormMap;
import com.ceecloud.entity.ResourcesFormMap;
import com.ceecloud.entity.UserFormMap;
import com.ceecloud.mapper.DeptMapper;
import com.ceecloud.mapper.PersonMapper;
import com.ceecloud.mapper.ResourcesMapper;
import com.ceecloud.mapper.UserMapper;
import com.ceecloud.util.Common;
import com.ceecloud.util.TreeObject;
import com.ceecloud.util.TreeUtil;
import org.apache.commons.lang.StringUtils;
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
 * Created by SyJun on 2016/7/1.
 */
@Controller
@RequestMapping("/dept/")
public class DeptController extends BaseController {

    @Inject
    private DeptMapper deptMapper;

    @Inject
    private PersonMapper personMapper;

    @Inject
    private UserMapper userMapper;

    @Inject
    private ResourcesMapper resourcesMapper;

    /**
     * @param model
     *            存放返回界面的model
     * @return
     */
    @RequestMapping("list")
    public String list(Model model) {
        model.addAttribute("companyId",getPara("companyId"));
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
        return Common.BACKGROUND_PATH + "/system/dept/list";
    }

    /**
     * @param model
     *            存放返回界面的model
     * @return
     */
    @RequestMapping("slist")
    public String slist(Model model) {
        model.addAttribute("res", findByRes());
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
        return Common.BACKGROUND_PATH + "/system/dept/list";
    }

    /**
     * @param model
     *            存放返回界面的model
     * @return
     */
    @ResponseBody
    @RequestMapping("treelists")
    public DeptFormMap findByPage(Model model) {
        DeptFormMap deptFormMap = getFormMap(DeptFormMap.class);
        Integer companyId = Integer.valueOf(getPara("companyId"));
        deptFormMap.put("companyId",companyId);
        List<DeptFormMap> mps = deptMapper.findByAttribute("companyId",companyId.toString(),DeptFormMap.class);
        List<TreeObject> list = new ArrayList<TreeObject>();
        for (DeptFormMap map : mps) {
            TreeObject ts = new TreeObject();
            map.set("isAvailable",(map.get("isAvailable").toString().equals("1")?"可用":"不可用"));
            Common.flushObject(ts, map);
            list.add(ts);
        }
        TreeUtil treeUtil = new TreeUtil();
        List<TreeObject> ns = treeUtil.getChildTreeObjects(list, 0);
        deptFormMap = new DeptFormMap();
        deptFormMap.put("treelists", ns);
        model.addAttribute("companyId",getPara("companyId"));
        return deptFormMap;
    }

    @ResponseBody
    @RequestMapping("reslists")
    public List<TreeObject> reslists(Model model) throws Exception {
        DeptFormMap deptFormMap = getFormMap(DeptFormMap.class);
        List<DeptFormMap> mps = deptMapper.findByAttribute("companyId",deptFormMap.get("companyId").toString(),DeptFormMap.class);
        List<TreeObject> list = new ArrayList<TreeObject>();
        for (DeptFormMap map : mps) {
            TreeObject ts = new TreeObject();
            Common.flushObject(ts, map);
            list.add(ts);
        }
        TreeUtil treeUtil = new TreeUtil();
        List<TreeObject> ns = treeUtil.getChildTreeObjects(list, 0, "　");
        return ns;
    }

    /**
     * 跳转到修改界面
     *
     * @param model
     *            修改菜单信息ID
     * @return
     */
    @RequestMapping("editUI")
    public String editUI(Model model) {
        String id = getPara("id");
        if(Common.isNotEmpty(id)){
            model.addAttribute("dept", deptMapper.findbyFrist("id", id, DeptFormMap.class));
        }
        return Common.BACKGROUND_PATH + "/system/dept/edit";
    }

    /**
     * 根据ID删除菜单
     *
     * @param model
 * @param ids
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("deleteEntity")
    @SystemLog(module="系统管理",methods="资源管理-删除部门")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity(Model model) throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            deptMapper.deleteByAttribute("id", id, DeptFormMap.class);
        };
        return "success";
    }

    /**
     * 跳转到修改界面
     *
     * @param model
     *            修改菜单信息ID
     * @return
     */
    @RequestMapping("seditUI")
    public String seditUI(Model model) {
        String id = getPara("id");
        if(Common.isNotEmpty(id)){
            model.addAttribute("dept", deptMapper.findbyFrist("id", id, DeptFormMap.class));
        }
        return Common.BACKGROUND_PATH + "/system/dept/edit";
    }

    /**
     * 更新菜单
     *
     * @param model
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="系统管理",methods="资源管理-修改部门")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity(Model model) throws Exception {
        DeptFormMap deptFormMap = getFormMap(DeptFormMap.class);
        if(deptFormMap.get("id").equals(deptFormMap.get("parentId"))){
            return "error";
        }
        deptMapper.editEntity(deptFormMap);
        return "success";
    }

    /**
     * 跳转到新增界面
     *
     * @return
     */
    @RequestMapping("addUI")
    public String addUI(Model model) {
        String id = getPara("companyId");
        model.addAttribute("companyId",id);
        return Common.BACKGROUND_PATH + "/system/dept/add";
    }

    /**
     * 跳转到新增界面
     *
     * @return
     */
    @RequestMapping("saddUI")
    public String saddUI(Model model) {
        String id = getPara("companyId");
        model.addAttribute("companyId",id);
        return Common.BACKGROUND_PATH + "/system/dept/add";
    }

    /**
     * 添加菜单
     *
     * @return Map
     * @throws Exception
     */
    @RequestMapping("addEntity")
    @ResponseBody
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="系统管理",methods="资源管理-新增部门")//凡需要处理业务逻辑的.都需要记录操作日志
    public String addEntity() throws Exception {
        DeptFormMap deptFormMap = getFormMap(DeptFormMap.class);
        deptFormMap.set("isAvailable","1");
        deptFormMap.set("companyId",deptFormMap.get("companyId"));
        deptMapper.addEntity(deptFormMap);
        return "success";
    }

    @RequestMapping("selDept")
    public String selectDept(Model model) throws Exception{
        DeptFormMap deptFormMap = getFormMap(DeptFormMap.class);
        Object userId = deptFormMap.get("personId");
        Object companyId = deptFormMap.get("companyId");
        if(null!=userId && null!=companyId){
            List<DeptFormMap> list = deptMapper.seletUserDept(deptFormMap);
            String ugid = "";
            for (DeptFormMap ml : list) {
                ugid += ml.get("id")+",";
            }
            ugid = Common.trimComma(ugid);
            model.addAttribute("txtDeptSelect", ugid);
            model.addAttribute("userDept", list);
            if(StringUtils.isNotBlank(ugid)){
                deptFormMap.put("where", " where id not in ("+ugid+") and companyId = " + companyId);
            }else{
                deptFormMap.put("where","where companyId = " + companyId);
            }
        }
        List<DeptFormMap> depts = deptMapper.findByWhere(deptFormMap);
        model.addAttribute("dept", depts);
        return Common.BACKGROUND_PATH + "/system/person/deptSelect";
    }

    /**
     * 验证部门是否存在
     *
     * @param name
     * @return
     */
    @RequestMapping("isExist")
    @ResponseBody
    public boolean isExist(String name,String resKey) {
        DeptFormMap deptFormMap = getFormMap(DeptFormMap.class);
        deptFormMap.set("name",name);
        List<DeptFormMap> r = deptMapper.findByNames(deptFormMap);
        if (r.size()==0) {
            return true;
        } else {
            return false;
        }
    }
}
