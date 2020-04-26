package com.ceecloud.controller.system;

import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.*;
import com.ceecloud.mapper.CardTranInfoMapper;
import com.ceecloud.mapper.ResourcesMapper;
import com.ceecloud.mapper.UserCardMapper;
import com.ceecloud.plugin.PageView;
import com.ceecloud.util.Common;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/cardTran/")
public class CardTranController extends BaseController {
    @Inject
    private CardTranInfoMapper cardTranInfoMapper;

    @Inject
    private ResourcesMapper resourcesMapper;

    @Inject
    private UserCardMapper userCardMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception{
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        UserFormMap userFormMap = (UserFormMap) Common.findUserSession(request);
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
        return Common.BACKGROUND_PATH + "/system/cardTran/list";
    }

    @RequestMapping("list1")
    public String listUI1(Model model) throws Exception{
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        UserFormMap userFormMap = (UserFormMap) Common.findUserSession(request);
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
        return Common.BACKGROUND_PATH + "/system/cardTran/list1";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize) throws Exception {
        CardTranInfoFormMap cardTranInfoFormMap = getFormMap(CardTranInfoFormMap.class);
        cardTranInfoFormMap=toFormMap(cardTranInfoFormMap, pageNow, pageSize,cardTranInfoFormMap.getStr("orderby"));
        pageView.setRecords(cardTranInfoMapper.findCardTranInfoPage(cardTranInfoFormMap));
        return pageView;
    }

    @ResponseBody
    @RequestMapping("findByPage1")
    public PageView findByPage1(String pageNow,
                               String pageSize) throws Exception {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        UserFormMap userFormMap = (UserFormMap) Common.findUserSession(request);
        UserCardFormMap userCardFormMap = new UserCardFormMap();
        userCardFormMap.set("userId", userFormMap.getInt("id"));
        userCardFormMap = userCardMapper.findUserCardByUserId(userCardFormMap);
        CardTranInfoFormMap cardTranInfoFormMap = getFormMap(CardTranInfoFormMap.class);
        if(userCardFormMap!=null) {
            cardTranInfoFormMap.set("cardId", userCardFormMap.getInt("id"));
        }else{
            cardTranInfoFormMap.set("cardId", 0);
        }
        cardTranInfoFormMap=toFormMap(cardTranInfoFormMap, pageNow, pageSize,cardTranInfoFormMap.getStr("orderby"));
        pageView.setRecords(cardTranInfoMapper.findCardTranInfoPage(cardTranInfoFormMap));
        return pageView;
    }
}
