package com.ceecloud.controller.system;

import com.ceecloud.annotation.SystemLog;
import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.ResourcesFormMap;
import com.ceecloud.entity.RoleFormMap;
import com.ceecloud.entity.UserFormMap;
import com.ceecloud.mapper.ResourcesMapper;
import com.ceecloud.mapper.RoleMapper;
import com.ceecloud.plugin.PageView;
import com.ceecloud.util.Common;
import org.apache.commons.lang.StringUtils;
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
 * 
 * @author lanyuan 2014-11-19
 * @Email: mmm333zzz520@163.com
 * @version 3.0v
 */
@Controller
@RequestMapping("/role/")
public class RoleController extends BaseController {
	@Inject
	private RoleMapper roleMapper;

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
		return Common.BACKGROUND_PATH + "/system/role/list";
	}

	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage(String pageNow,
							   String pageSize) throws Exception {
		RoleFormMap roleFormMap = getFormMap(RoleFormMap.class);
		roleFormMap=toFormMap(roleFormMap, pageNow, pageSize,roleFormMap.getStr("orderby"));
        pageView.setRecords(roleMapper.findByPage(roleFormMap));
		return pageView;
	}

	@RequestMapping("addUI")
	public String addUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/role/add";
	}

	@ResponseBody
	@RequestMapping("addEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-新增角色")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity() throws Exception {
		RoleFormMap roleFormMap = getFormMap(RoleFormMap.class);
		roleMapper.addEntity(roleFormMap);
		return "success";
	}

	@ResponseBody
	@RequestMapping("deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-删除角色")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			roleMapper.deleteByAttribute("id", id, RoleFormMap.class);
		}
		return "success";
	}

	@RequestMapping("editUI")
	public String editUI(Model model) throws Exception {
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			model.addAttribute("role", roleMapper.findbyFrist("id", id, RoleFormMap.class));
		}
		return Common.BACKGROUND_PATH + "/system/role/edit";
	}

	@ResponseBody
	@RequestMapping("editEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-修改角色")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity() throws Exception {
		RoleFormMap roleFormMap = getFormMap(RoleFormMap.class);
		roleMapper.editEntity(roleFormMap);
		return "success";
	}
	
	
	@RequestMapping("selRole")
	public String seletRole(Model model) throws Exception {
		RoleFormMap roleFormMap = getFormMap(RoleFormMap.class);
		Object userId = roleFormMap.get("userId");
		if(null!=userId){
			List<RoleFormMap> list = roleMapper.seletUserRole(roleFormMap);
			String ugid = "";
			for (RoleFormMap ml : list) {
				ugid += ml.get("id")+",";
			}
			ugid = Common.trimComma(ugid);
			model.addAttribute("txtRoleSelect", ugid);
			model.addAttribute("userRole", list);
			if(StringUtils.isNotBlank(ugid)){
				roleFormMap.put("where", " where id not in ("+ugid+")");
			}
		}else if(null != roleFormMap.get("id")){
			roleFormMap.put("where", " where id not in ("+roleFormMap.get("id")+")");
		}
		List<RoleFormMap> roles = roleMapper.findByWhere(roleFormMap);
		model.addAttribute("role", roles);
		return Common.BACKGROUND_PATH + "/system/user/roleSelect";
	}

}