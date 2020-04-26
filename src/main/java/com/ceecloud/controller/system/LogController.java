package com.ceecloud.controller.system;


import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.LogFormMap;
import com.ceecloud.entity.ResourcesFormMap;
import com.ceecloud.entity.UserFormMap;
import com.ceecloud.mapper.LogMapper;
import com.ceecloud.mapper.ResourcesMapper;
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

/**
 * 
 * @author lanyuan 2014-11-19
 * @Email: mmm333zzz520@163.com
 * @version 3.0v
 */
@Controller
@RequestMapping("/log/")
public class LogController extends BaseController {
	@Inject
	private LogMapper logMapper;

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
		return Common.BACKGROUND_PATH + "/system/log/list";
	}

	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage(String pageNow,
							   String pageSize, String column, String sort) throws Exception {
		LogFormMap logFormMap = getFormMap(LogFormMap.class);
		String order = "";
		if(Common.isNotEmpty(column)){
			order = " order by "+column+" "+sort;
		}else{
			order = " order by id asc";
		}
		
		logFormMap.put("$orderby", order);
		logFormMap=toFormMap(logFormMap, pageNow, pageSize,logFormMap.getStr("orderby"));
        pageView.setRecords(logMapper.findByPage(logFormMap));
		return pageView;
	}
}