package com.ceecloud.controller.system;

import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.ResourcesFormMap;
import com.ceecloud.entity.UserFormMap;
import com.ceecloud.mapper.ResourcesMapper;
import com.ceecloud.util.Common;
import com.ceecloud.util.HttpClientUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

/**
 * @author yJunS
 */
@Controller
@RequestMapping("/other/")
public class OtherController extends BaseController {
    @Inject
    private ResourcesMapper resourcesMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        UserFormMap userFormMap = (UserFormMap) Common.findUserSession(request);
        List<ResourcesFormMap> resourcesFormMapList = findByRes();
        ResourcesFormMap resFormMap1 = new ResourcesFormMap();
        resFormMap1.put("parentId", getPara("id"));
        resFormMap1.put("roleId", userFormMap.get("role"));
        String order = " order by level asc";
        resFormMap1.put("$orderby", order);
        List<ResourcesFormMap> resourcesFormMapList1 = resourcesMapper.findRes(resFormMap1);
        for (ResourcesFormMap resFormMap : resourcesFormMapList1) {
            Object o = resFormMap.get("description");
            if (o != null && !Common.isEmpty(o.toString())) {
                resFormMap.put("description", Common.stringtohtml(o.toString()));
            }
        }
        for (int i = 0; i < resourcesFormMapList1.size(); i++) {
            ResourcesFormMap resourcesFormMap = resourcesFormMapList1.get(i);
            boolean as = false;
            for (int j = 0; j < resourcesFormMapList.size(); j++) {
                if (resourcesFormMap.get("resKey").equals(resourcesFormMapList.get(j).get("resKey"))) {
                    as = true;
                    break;
                }
            }
            if (!as) {
                resourcesFormMapList.add(resourcesFormMap);
            }
        }
        model.addAttribute("res", resourcesFormMapList);
        return Common.BACKGROUND_PATH + "/system/other/list";
    }

    @RequestMapping("meetinginfo")
    public String meetinginfo(Model model) throws Exception {
        return Common.BACKGROUND_PATH + "/system/other/meetinginfo";
    }

    @ResponseBody
    @RequestMapping(value = "find")
    public void find(HttpServletRequest request, HttpServletResponse response,String callback) {
        HttpClientUtil httpClientUtil = new HttpClientUtil();
        String result = httpClientUtil.doPost("http://mymeeting.peony.cn/StatisticsTotal_getTotalParticipantTime1.action", new HashMap());
        org.json.JSONArray jsonArray;
        jsonArray = new org.json.JSONArray(result);
        response.setContentType("text/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = null;
        String output = "";
        if(callback!=null && !"".equals(callback)) {
            output = callback + "(" + jsonArray.toString() + ")";
        }else {
            output = jsonArray.toString();
        }
        try {
            out = response.getWriter();
            out.write(output);
        } catch (Exception e) {
            e.getMessage();
        } finally {
            out.flush();
            out.close();
        }
    }

    @RequestMapping("operationlist")
    public String operationlist(Model model) throws Exception {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        UserFormMap userFormMap = (UserFormMap) Common.findUserSession(request);
        List<ResourcesFormMap> resourcesFormMapList = findByRes();
        ResourcesFormMap resFormMap1 = new ResourcesFormMap();
        resFormMap1.put("parentId", getPara("id"));
        resFormMap1.put("roleId", userFormMap.get("role"));
        String order = " order by level asc";
        resFormMap1.put("$orderby", order);
        List<ResourcesFormMap> resourcesFormMapList1 = resourcesMapper.findRes(resFormMap1);
        for (ResourcesFormMap resFormMap : resourcesFormMapList1) {
            Object o = resFormMap.get("description");
            if (o != null && !Common.isEmpty(o.toString())) {
                resFormMap.put("description", Common.stringtohtml(o.toString()));
            }
        }
        for (int i = 0; i < resourcesFormMapList1.size(); i++) {
            ResourcesFormMap resourcesFormMap = resourcesFormMapList1.get(i);
            boolean as = false;
            for (int j = 0; j < resourcesFormMapList.size(); j++) {
                if (resourcesFormMap.get("resKey").equals(resourcesFormMapList.get(j).get("resKey"))) {
                    as = true;
                    break;
                }
            }
            if (!as) {
                resourcesFormMapList.add(resourcesFormMap);
            }
        }
        model.addAttribute("res", resourcesFormMapList);
        return Common.BACKGROUND_PATH + "/system/other/operationlist";
    }
}
