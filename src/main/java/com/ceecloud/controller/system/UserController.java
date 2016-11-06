package com.ceecloud.controller.system;


import com.ceecloud.annotation.SystemLog;
import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.PersonFormMap;
import com.ceecloud.entity.ResUserFormMap;
import com.ceecloud.entity.UserFormMap;
import com.ceecloud.exception.SystemException;
import com.ceecloud.mapper.PersonMapper;
import com.ceecloud.mapper.UserMapper;
import com.ceecloud.plugin.PageView;
import com.ceecloud.util.*;
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
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author lanyuan 2014-11-19
 * @Email: mmm333zzz520@163.com
 * @version 3.0v
 */
@Controller
@RequestMapping("/user/")
public class UserController extends BaseController {
	@Inject
	private UserMapper userMapper;

	@Inject
	private PersonMapper personMapper;

	private static String mymeetingDomain = DomainProperties.getProperty("mymeetingDomain");

	private static String liveDomain = DomainProperties.getProperty("liveDomain");
	
	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/user/list";
	}

	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage(String pageNow,
							   String pageSize, String column, String sort) throws Exception {
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		userFormMap=toFormMap(userFormMap, pageNow, pageSize,userFormMap.getStr("orderby"));
		userFormMap.put("column", column);
		userFormMap.put("sort", sort);
		userFormMap.put("username",userFormMap.get("accountName"));
        pageView.setRecords(userMapper.findUserPage(userFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
	}
	
	@RequestMapping("/export")
	public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String fileName = "用户列表";
		UserFormMap userFormMap = findHasHMap(UserFormMap.class);
		//exportData = 
		// [{"colkey":"sql_info","name":"SQL语句","hide":false},
		// {"colkey":"total_time","name":"总响应时长","hide":false},
		// {"colkey":"avg_time","name":"平均响应时长","hide":false},
		// {"colkey":"record_time","name":"记录时间","hide":false},
		// {"colkey":"call_count","name":"请求次数","hide":false}
		// ]
		String exportData = userFormMap.getStr("exportData");// 列表头的json字符串

		List<Map<String, Object>> listMap = JsonUtils.parseJSONList(exportData);

		List<UserFormMap> lis = userMapper.findUserPage(userFormMap);
		POIUtils.exportToExcel(response, listMap, lis, fileName);
	}

	@RequestMapping("addUI")
	public String addUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/user/add";
	}

	@ResponseBody
	@RequestMapping("addEntity")
	@SystemLog(module="系统管理",methods="用户管理-新增账号")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	public String addEntity(String txtGroupsSelect){
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		try {
			UserFormMap userFormMap = getFormMap(UserFormMap.class);
			PersonFormMap personFormMap = getFormMap(PersonFormMap.class);
			personFormMap.set("name",userFormMap.get("name"));
			personFormMap.set("email",userFormMap.get("email"));
			personFormMap.set("fax",userFormMap.get("fax"));
			personFormMap.set("mobile1",userFormMap.get("mobile"));
			personFormMap.set("state","1");
			personFormMap.set("companyId","0");
			personFormMap.set("type","0");
			personMapper.addEntity(personFormMap);
			userFormMap.put("txtGroupsSelect", txtGroupsSelect);
			PasswordHelper passwordHelper = new PasswordHelper();
			userFormMap.set("username",userFormMap.get("accountName"));
			userFormMap.set("password","123456789");
			userFormMap.set("newpassword",userFormMap.get("password"));
			userFormMap.set("isLock","0");
			userFormMap.set("state","1");
			if(txtGroupsSelect.indexOf(",")>-1){
				return "error";
			}
			userFormMap.set("role",txtGroupsSelect);
			userFormMap.set("personId",personFormMap.get("id"));
			passwordHelper.encryptPassword(userFormMap);
			userMapper.addEntity(userFormMap);//新增后返回新增信息
			/*if (!Common.isEmpty(txtGroupsSelect)) {
				String[] txt = txtGroupsSelect.split(",");
				UserGroupsFormMap userGroupsFormMap = new UserGroupsFormMap();
				for (String roleId : txt) {
					userGroupsFormMap.put("id", userFormMap.get("id"));
					userGroupsFormMap.put("roleId", roleId);
					userMapper.addEntity(userGroupsFormMap);
				}
			}*/
			HttpClientUtil httpClientUtil = new HttpClientUtil();
			JSONObject as = httpClientUtil.doGet(mymeetingDomain + "CasUserSync_syncCasUser.action","username="+userFormMap.get("username")+"&password="+userFormMap.get("newpassword") + "&casId=" + userFormMap.get("id"));
			if(as.getBoolean("status")) {
				JSONObject as1 = httpClientUtil.doGet(liveDomain + "CasUserSync_syncCasUser.action", "username=" + userFormMap.get("username") + "&password=" + userFormMap.get("newpassword") + "&casId=" + userFormMap.get("id"));
				if(as1.getBoolean("status")){
					System.out.println("add is ok!");
				}
			}
		} catch (Exception e) {
			 throw new SystemException("添加账号异常");
		}
		return "success";
	}

	@ResponseBody
	@RequestMapping("deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理-删除账号")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
//			userMapper.deleteByAttribute("userId", id, UserGroupsFormMap.class);
			userMapper.deleteByAttribute("userId", id, ResUserFormMap.class);
			userMapper.deleteByAttribute("id", id, UserFormMap.class);
		}
		return "success";
	}

	@RequestMapping("editUI")
	public String editUI(Model model) throws Exception {
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			UserFormMap userFormMap = getFormMap(UserFormMap.class);
			userFormMap.set("id",id);
			model.addAttribute("user", userMapper.findById(userFormMap));
		}
		return Common.BACKGROUND_PATH + "/system/user/edit";
	}

	@ResponseBody
	@RequestMapping("editEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理-修改账号")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity(String txtGroupsSelect) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		if(txtGroupsSelect!=null && txtGroupsSelect.indexOf(",")>-1){
			return "error";
		}
		PersonFormMap personFormMap = personMapper.findbyFrist("id",userFormMap.get("personId").toString(),PersonFormMap.class);
		personFormMap.set("name",userFormMap.get("name"));
		personFormMap.set("email",userFormMap.get("email"));
		personFormMap.set("fax",userFormMap.get("fax"));
		personFormMap.set("mobile1",userFormMap.get("mobile"));
		personMapper.editEntity(personFormMap);
//		userFormMap.put("role", txtGroupsSelect);
		userMapper.editEntity(userFormMap);
//		userMapper.deleteByAttribute("userId", userFormMap.get("id")+"", UserGroupsFormMap.class);
//		if(!Common.isEmpty(txtGroupsSelect)){
//			String[] txt = txtGroupsSelect.split(",");
//			for (String roleId : txt) {
//				UserGroupsFormMap userGroupsFormMap = new UserGroupsFormMap();
//				userGroupsFormMap.put("userId", userFormMap.get("id"));
//				userGroupsFormMap.put("roleId", roleId);
//				userMapper.addEntity(userGroupsFormMap);
//			}
//		}
		return "success";
	}
	/**
	 * 验证账号是否存在
	 * 
	 * @author lanyuan Email：mmm333zzz520@163.com date：2014-2-19
	 * @param name
	 * @return
	 */
	@RequestMapping("isExist")
	@ResponseBody
	public boolean isExist(String name) {
		UserFormMap account = userMapper.findbyFrist("username", name, UserFormMap.class);
		if (account == null) {
			return true;
		} else {
			return false;
		}
	}
	
	//密码修改
	@RequestMapping("updatePassword")
	public String updatePassword(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/user/updatePassword";
	}
	
	//保存新密码
	@RequestMapping("editPassword")
	@ResponseBody
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理-修改密码")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editPassword() throws Exception{
		// 当验证都通过后，把用户信息放在session里
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		UserFormMap userFormMap1 = userMapper.findById(userFormMap);
		userFormMap.put("accountName",userFormMap1.get("username"));
		userFormMap.put("password", userFormMap.get("newpassword"));
		//这里对修改的密码进行加密
		PasswordHelper passwordHelper = new PasswordHelper();
		passwordHelper.encryptPassword(userFormMap);
		userMapper.editEntity(userFormMap);
		HttpClientUtil httpClientUtil = new HttpClientUtil();
		JSONObject as = httpClientUtil.doGet(mymeetingDomain + "CasUserSync_updateCasUser.action","username="+userFormMap1.get("username")+"&password="+userFormMap.get("newpassword") + "&casId=" + userFormMap.get("id"));
		if(as.getBoolean("status")) {
			JSONObject as1 = httpClientUtil.doGet(liveDomain + "CasUserSync_updateCasUser.action", "username=" + userFormMap1.get("username") + "&password=" + userFormMap.get("newpassword") + "&casId=" + userFormMap.get("id"));
			if(as1.getBoolean("status")){
				System.out.println("add is ok!");
			}
		}
		return "success";
	}
}