package com.ceecloud.controller.system;

import com.ceecloud.annotation.SystemLog;
import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.*;
import com.ceecloud.mapper.PartMapper;
import com.ceecloud.mapper.ResourcesMapper;
import com.ceecloud.plugin.PageView;
import com.ceecloud.util.Common;
import com.ceecloud.util.JsonUtils;
import com.ceecloud.util.TreeObject;
import com.ceecloud.util.TreeUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by SyJun on 2017/7/17.
 */
@Controller
@RequestMapping("/part/")
public class PartController extends BaseController {
    @Inject
    private PartMapper partMapper;

    @Inject
    private ResourcesMapper resourcesMapper;

    @ResponseBody
    @RequestMapping("partList")
    public JSONArray partList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        PartFormMap partFormMap = getFormMap(PartFormMap.class);
        List<PartFormMap> mps = partMapper.findByWhere(partFormMap);
        JSONArray jsonArray = new JSONArray();
        for(int i=0;i<mps.size();i++) {
            jsonArray.add(mps.get(i));
        }
        return jsonArray;
    }

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
        return Common.BACKGROUND_PATH + "/system/part/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        PartFormMap partFormMap = getFormMap(PartFormMap.class);
        partFormMap=toFormMap(partFormMap, pageNow, pageSize,partFormMap.getStr("orderby"));
        partFormMap.put("column", column);
        partFormMap.put("sort", sort);
        if(null !=partFormMap.getStr("partName")){
            partFormMap.put("partName", "%" + partFormMap.getStr("partName") + "%");
        }
        pageView.setRecords(partMapper.findPartPage(partFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        return Common.BACKGROUND_PATH + "/system/part/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="系统管理",methods="园区管理-新增园区")//凡需要处理业务逻辑的.都需要记录操作日志
    public String addEntity() throws Exception {
        PartFormMap partFormMap = getFormMap(PartFormMap.class);
        partMapper.addEntity(partFormMap);
        return "success";
    }

    @ResponseBody
    @RequestMapping("deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="系统管理",methods="园区管理-删除园区")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            partMapper.deleteByAttribute("id", id, PartFormMap.class);
        }
        return "success";
    }

    @RequestMapping("editUI")
    public String editUI(Model model) throws Exception {
        String id = getPara("id");
        if(Common.isNotEmpty(id)){
            model.addAttribute("part", partMapper.findbyFrist("id", id, PartFormMap.class));
        }
        return Common.BACKGROUND_PATH + "/system/part/edit";
    }

    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="系统管理",methods="园区管理-修改园区")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity() throws Exception {
        PartFormMap partFormMap = getFormMap(PartFormMap.class);
        partMapper.editEntity(partFormMap);
        return "success";
    }
}
