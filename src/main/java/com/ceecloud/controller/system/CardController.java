package com.ceecloud.controller.system;

import com.ceecloud.annotation.SystemLog;
import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.CardFormMap;
import com.ceecloud.entity.ResourcesFormMap;
import com.ceecloud.entity.UserFormMap;
import com.ceecloud.mapper.CardMapper;
import com.ceecloud.mapper.ResourcesMapper;
import com.ceecloud.plugin.PageView;
import com.ceecloud.util.Common;
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

@Controller
@RequestMapping("/card/")
public class CardController extends BaseController {
    @Inject
    private CardMapper cardMapper;

    @Inject
    private ResourcesMapper resourcesMapper;

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
        return Common.BACKGROUND_PATH + "/system/card/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,String pageSize) throws Exception {
        CardFormMap cardFormMap = getFormMap(CardFormMap.class);
        if(null != cardFormMap.getStr("cardNumber")){
            cardFormMap.set("cardNumber","%"+cardFormMap.getStr("cardNumber")+"%");
        }
        cardFormMap=toFormMap(cardFormMap, pageNow, pageSize,cardFormMap.getStr("orderby"));
        if(null !=cardFormMap.getStr("cardNumber")){
            cardFormMap.put("cardNumber", "%" + cardFormMap.getStr("cardNumber") + "%");
        }
        pageView.setRecords(cardMapper.findCardPage(cardFormMap));
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        return Common.BACKGROUND_PATH + "/system/card/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="系统管理",methods="卡管理-新增一卡通")//凡需要处理业务逻辑的.都需要记录操作日志
    public String addEntity() throws Exception {
        CardFormMap cardFormMap = getFormMap(CardFormMap.class);
        cardMapper.addEntity(cardFormMap);
        return "success";
    }

    @ResponseBody
    @RequestMapping("deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="系统管理",methods="卡管理-删除一卡通")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            cardMapper.deleteByAttribute("id", id, CardFormMap.class);
        }
        return "success";
    }

    @RequestMapping("editUI")
    public String editUI(Model model) throws Exception {
        String id = getPara("id");
        if(Common.isNotEmpty(id)){
            model.addAttribute("card", cardMapper.findbyFrist("id", id, CardFormMap.class));
        }
        return Common.BACKGROUND_PATH + "/system/card/edit";
    }

    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="系统管理",methods="卡管理-修改一卡通")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity() throws Exception {
        CardFormMap cardFormMap = getFormMap(CardFormMap.class);
        cardMapper.editEntity(cardFormMap);
        return "success";
    }


}
