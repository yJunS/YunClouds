package com.ceecloud.controller.system;

import com.ceecloud.annotation.SystemLog;
import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.*;
import com.ceecloud.mapper.ResourcesMapper;
import com.ceecloud.mapper.UserMapper;
import com.ceecloud.util.Common;
import com.ceecloud.util.TreeObject;
import com.ceecloud.util.TreeUtil;
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
 * 
 * @author lanyuan 2014-11-19
 * @Email: mmm333zzz520@163.com
 * @version 3.0v
 */
@Controller
@RequestMapping("/resources/")
public class ResourcesController extends BaseController {
	@Inject
	private ResourcesMapper resourcesMapper;

	@Inject
	private UserMapper userMapper;

	/**
	 * @param model
	 *            存放返回界面的model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("treelists")
	public ResourcesFormMap findByPage(Model model) {
		ResourcesFormMap resFormMap = getFormMap(ResourcesFormMap.class);
		String order = " order by level asc";
		resFormMap.put("$orderby", order);
		List<ResourcesFormMap> mps = resourcesMapper.findByNames(resFormMap);
		List<TreeObject> list = new ArrayList<TreeObject>();
		for (ResourcesFormMap map : mps) {
			TreeObject ts = new TreeObject();
			Common.flushObject(ts, map);
			list.add(ts);
		}
		TreeUtil treeUtil = new TreeUtil();
		List<TreeObject> ns = treeUtil.getChildTreeObjects(list, 0);
		resFormMap = new ResourcesFormMap();
		resFormMap.put("treelists", ns);
		return resFormMap;
	}

	@ResponseBody
	@RequestMapping("reslists")
	public List<TreeObject> reslists(Model model) throws Exception {
		ResourcesFormMap resFormMap = getFormMap(ResourcesFormMap.class);
		List<ResourcesFormMap> mps = resourcesMapper.findByWhere(resFormMap);
		List<TreeObject> list = new ArrayList<TreeObject>();
		for (ResourcesFormMap map : mps) {
			TreeObject ts = new TreeObject();
			Common.flushObject(ts, map);
			list.add(ts);
		}
		TreeUtil treeUtil = new TreeUtil();
		List<TreeObject> ns = treeUtil.getChildTreeObjects(list, 0, "　");
		return ns;
	}

	/**
	 * @param model
	 *            存放返回界面的model
	 * @return
	 */
	@RequestMapping("list")
	public String list(Model model) {
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
		return Common.BACKGROUND_PATH + "/system/resources/list";
	}

	/**
	 * 跳转到修改界面
	 * 
	 * @param model
	 * @param resourcesId
	 *            修改菜单信息ID
	 * @return
	 */
	@RequestMapping("editUI")
	public String editUI(Model model) {
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			model.addAttribute("resources", resourcesMapper.findbyFrist("id", id, ResourcesFormMap.class));
		}
		return Common.BACKGROUND_PATH + "/system/resources/edit";
	}

	/**
	 * 跳转到新增界面
	 * 
	 * @return
	 */
	@RequestMapping("addUI")
	public String addUI(Model model) {
		return Common.BACKGROUND_PATH + "/system/resources/add";
	}

	/**
	 * 权限分配页面
	 * 
	 * @author lanyuan Email：mmm333zzz520@163.com date：2014-4-14
	 * @param model
	 * @return
	 */
	@RequestMapping("permissions")
	public String permissions(Model model) {
		ResourcesFormMap resFormMap = getFormMap(ResourcesFormMap.class);
		List<ResourcesFormMap> mps = resourcesMapper.findByWhere(resFormMap);
		List<TreeObject> list = new ArrayList<TreeObject>();
		for (ResourcesFormMap map : mps) {
			TreeObject ts = new TreeObject();
			Common.flushObject(ts, map);
			list.add(ts);
		}
		TreeUtil treeUtil = new TreeUtil();
		List<TreeObject> ns = treeUtil.getChildTreeObjects(list, 0);
		model.addAttribute("permissions", ns);
		return Common.BACKGROUND_PATH + "/system/resources/permissions";
	}

	/**
	 * 添加菜单
	 * 
	 * @param resources
	 * @return Map
	 * @throws Exception
	 */
	@RequestMapping("addEntity")
	@ResponseBody
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="资源管理-新增资源")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity() throws Exception {
		ResourcesFormMap resFormMap = getFormMap(ResourcesFormMap.class);
		if("2".equals(resFormMap.get("type"))){
			resFormMap.put("description", Common.htmltoString(resFormMap.get("description")+""));
		}
		Integer maxLevel = resourcesMapper.findMaxLevelByParentId(resFormMap);
		resFormMap.put("level",(maxLevel!=null?maxLevel:0)+1);
		Object o = resFormMap.get("ishide");
		if(null==o){
			resFormMap.set("ishide", "0");
		}
		
		resourcesMapper.addEntity(resFormMap);
		return "success";
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
	@SystemLog(module="系统管理",methods="资源管理-修改资源")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity(Model model) throws Exception {
		ResourcesFormMap resFormMap = getFormMap(ResourcesFormMap.class);
		if(resFormMap.get("id").equals(resFormMap.get("parentId")) && "2".equals(resFormMap.getStr("type"))){
			return "error1";
		}else if(resFormMap.get("id").equals(resFormMap.get("parentId"))){
			return "error2";
		}
		if("2".equals(resFormMap.get("type"))){
			resFormMap.put("description", Common.htmltoString(resFormMap.get("description")+""));
		}
		Integer maxLevel = resourcesMapper.findMaxLevelByParentId(resFormMap);
		resFormMap.put("level",(maxLevel!=null?maxLevel:0)+1);
		Object o = resFormMap.get("ishide");
		if(null==o){
			resFormMap.set("ishide", "0");
		}
		resourcesMapper.editEntity(resFormMap);
		return "success";
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
	@SystemLog(module="系统管理",methods="资源管理-删除资源")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity(Model model) throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			resourcesMapper.deleteByAttribute("id", id, ResourcesFormMap.class);
		};
		return "success";
	}

	@RequestMapping("sortUpdate")
	@ResponseBody
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	public String sortUpdate(Params params) throws Exception {
		List<String> ids = params.getId();
		List<String> es = params.getRowId();
		List<ResourcesFormMap> maps = new ArrayList<ResourcesFormMap>();
		for (int i = 0; i < ids.size(); i++) {
			ResourcesFormMap map = new ResourcesFormMap();
			map.put("id", ids.get(i));
			map.put("level", es.get(i));
			maps.add(map);
		}
		resourcesMapper.updateSortOrder(maps);
		return "success";
	}

	@ResponseBody
	@RequestMapping("findRes")
	public List<ResourcesFormMap> findUserRes() {
		ResourcesFormMap resFormMap = getFormMap(ResourcesFormMap.class);
		List<ResourcesFormMap> rs = resourcesMapper.findRes(resFormMap);
		return rs;
	}
	@ResponseBody
	@RequestMapping("addUserRes")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理/组管理-修改权限")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addUserRes() throws Exception {
		String userId = "";
		String u = getPara("userId");
		String g = getPara("roleId");
		if (null != u && !Common.isEmpty(u.toString())) {
			userId = u.toString();
			userId = Common.trimComma(userId);
			if(Common.isEmpty(userId)){
				return "分配失败,该角色下没有用户!";
			}
			String[] users = userId.split(",");
			for (String uid : users) {
				resourcesMapper.deleteByAttribute("userId", uid, ResUserFormMap.class);
				String[] s = getParaValues("resId[]");
				if(s!=null && Common.isNotEmpty(s.toString())) {
					List<ResUserFormMap> resUserFormMaps = new ArrayList<ResUserFormMap>();
					for (String rid : s) {
						ResUserFormMap resUserFormMap = new ResUserFormMap();
						resUserFormMap.put("resId", rid);
						resUserFormMap.put("userId", uid);
						resUserFormMaps.add(resUserFormMap);

					}
					resourcesMapper.batchSave(resUserFormMaps);
				}
			}
		} else if (null != g && !Common.isEmpty(g.toString())) {
			/*List<UserFormMap> us = userMapper.findByAttribute("role",g.toString(),UserFormMap.class);
			for(UserFormMap ug : us){
				userId += ug.get("id") + ",";
			}*/
			resourcesMapper.deleteByAttribute("roleId",g,RoleResFormMap.class);
			String[] s = getParaValues("resId[]");
			if(s!=null && Common.isNotEmpty(s.toString())) {
				List<RoleResFormMap> roleResFormMaps = new ArrayList<RoleResFormMap>();
				for (String rid : s) {
					RoleResFormMap roleResFormMap = new RoleResFormMap();
					roleResFormMap.put("roleId", g);
					roleResFormMap.put("resId", rid);
					roleResFormMaps.add(roleResFormMap);
				}
				resourcesMapper.batchSave(roleResFormMaps);
			}
			/*List<UserGroupsFormMap> gs = resourcesMapper.findByAttribute("roleId", g.toString(), UserGroupsFormMap.class);
			for (UserGroupsFormMap ug : gs) {
				userId += ug.get("userId") + ",";
			}*/
		}

		return "success";
	}

	@ResponseBody
	@RequestMapping("findByButtom")
	public List<ButtomFormMap> findByButtom(){
		return resourcesMapper.findByWhere(new ButtomFormMap());
	}
	
	/**
	 * 验证菜单是否存在
	 * 
	 * @param name
	 * @return
	 */
	@RequestMapping("isExist")
	@ResponseBody
	public boolean isExist(String name,String resKey) {
		ResourcesFormMap resFormMap = getFormMap(ResourcesFormMap.class);
		resFormMap.set("name",name);
		resFormMap.set("resKey",resKey);
		List<ResourcesFormMap> r = resourcesMapper.findByNames(resFormMap);
		if (r.size()==0) {
			return true;
		} else {
			return false;
		}
	}
}