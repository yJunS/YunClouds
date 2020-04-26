package com.ceecloud.controller.system;


import com.ceecloud.annotation.SystemLog;
import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.*;
import com.ceecloud.exception.SystemException;
import com.ceecloud.mapper.*;
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

	@Inject
	private ResourcesMapper resourcesMapper;

	@Inject
	private CardMapper cardMapper;

	@Inject
	private UserCardMapper userCardMapper;

	private static String mymeetingDomain = DomainProperties.getProperty("mymeetingDomain");

	private static String liveDomain = DomainProperties.getProperty("liveDomain");
	
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

		if(null !=userFormMap.getStr("username")){
			userFormMap.put("username", "%" + userFormMap.getStr("username") + "%");
		}
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
			personFormMap.set("mobile",userFormMap.get("mobile"));
			personFormMap.set("state","1");
			personFormMap.set("companyId","0");
			personFormMap.set("type","0");
			personMapper.addEntity(personFormMap);
			userFormMap.put("txtGroupsSelect", txtGroupsSelect);
			PasswordHelper passwordHelper = new PasswordHelper();
			userFormMap.set("username",userFormMap.get("username"));
			userFormMap.set("password","123456");
			userFormMap.set("newpassword",userFormMap.get("password"));
			userFormMap.set("isLock","0");
			userFormMap.set("state","1");
			String error = "";
			if(Common.isEmpty(txtGroupsSelect)){
				error = "selectError";
			}else if(txtGroupsSelect.indexOf(",")>-1){
				error = "error";
			}
			if (Common.isNotEmpty(error)) {
				return error;
			}
			userFormMap.set("role",txtGroupsSelect);
			userFormMap.set("personId",personFormMap.get("id"));
			passwordHelper.encryptPassword(userFormMap);
			userMapper.addEntity(userFormMap);//新增后返回新增信息
			if(userFormMap.get("cardNumber") != null) {
				CardFormMap cardFormMap = new CardFormMap();
				cardFormMap.set("cardNumber", userFormMap.get("cardNumber"));
				cardFormMap.set("password", userFormMap.get("cardPassword"));
				cardMapper.addEntity(cardFormMap);
				UserCardFormMap userCardFormMap = new UserCardFormMap();
				userCardFormMap.set("userId", userFormMap.get("id"));
				userCardFormMap.set("cardId", cardFormMap.get("id"));
				userMapper.addUserCard(userCardFormMap);
			}
			/*if (!Common.isEmpty(txtGroupsSelect)) {
				String[] txt = txtGroupsSelect.split(",");
				UserGroupsFormMap userGroupsFormMap = new UserGroupsFormMap();
				for (String roleId : txt) {
					userGroupsFormMap.put("id", userFormMap.get("id"));
					userGroupsFormMap.put("roleId", roleId);
					userMapper.addEntity(userGroupsFormMap);
				}
			}*/
		} catch (Exception e) {
			 throw new SystemException("添加用户异常");
		}
		return "success";
	}

	@ResponseBody
	@RequestMapping("deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理-删除账号")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		try {
			String[] ids = getParaValues("ids");
			for (String id : ids) {
    //			userMapper.deleteByAttribute("userId", id, UserGroupsFormMap.class);
                UserFormMap userFormMap = new UserFormMap();
                userFormMap.set("id",id);
                userFormMap = userMapper.findById(userFormMap);
                userMapper.deleteByAttribute("userId", id, ResUserFormMap.class);
                userMapper.deleteByAttribute("id", id, UserFormMap.class);
                personMapper.deleteByAttribute("id",userFormMap.get("personId").toString(),PersonFormMap.class);
				ResUserFormMap resUserFormMap = new ResUserFormMap();
				resUserFormMap.set("userId", id);
				resourcesMapper.deleteResUser(resUserFormMap);
            }
		} catch (Exception e) {
			throw new SystemException("删除用户异常");
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
		try {
			UserFormMap userFormMap = getFormMap(UserFormMap.class);
			PersonFormMap personFormMap = new PersonFormMap();
			personFormMap.set("id", userFormMap.getStr("personId"));
			personFormMap = personMapper.findById(personFormMap);
			personFormMap.set("name",userFormMap.get("name"));
			personFormMap.set("email",userFormMap.get("email"));
			personFormMap.set("fax",userFormMap.get("fax"));
			personFormMap.set("mobile",userFormMap.get("mobile"));
			personFormMap.set("identityNum",userFormMap.get("identityNum"));
			personMapper.editEntity(personFormMap);
//		userFormMap.put("role", txtGroupsSelect);
			userMapper.editEntity(userFormMap);
			if(userFormMap.get("cardNumber") != null) {
				CardFormMap cardFormMap = new CardFormMap();
				cardFormMap = cardMapper.findbyFrist("cardNumber", userFormMap.getStr("cardNumber"), CardFormMap.class);
				if(cardFormMap==null) {
					cardFormMap = new CardFormMap();
					cardFormMap.set("cardNumber", userFormMap.get("cardNumber"));
					cardFormMap.set("password", userFormMap.get("cardPassword"));
					cardMapper.addEntity(cardFormMap);
				}
				UserCardFormMap userCardFormMap = new UserCardFormMap();
				userCardFormMap.set("userId", userFormMap.get("id"));
				userCardFormMap.set("cardId", cardFormMap.get("id"));
				userMapper.addUserCard(userCardFormMap);
			}else{
				UserCardFormMap userCardFormMap = userCardMapper.findbyFrist("userId",userFormMap.getStr("id"),UserCardFormMap.class);
				if(userCardFormMap!=null){
					userMapper.deleteUserCardByUserId(userCardFormMap);
				}
			}
		} catch (Exception e) {
			throw new SystemException("修改用户异常");
		}
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
		userFormMap.put("username",userFormMap1.get("username"));
		userFormMap.put("password", userFormMap.get("newpassword"));
		userFormMap.put("credentialsSalt",userFormMap1.get("credentialsSalt"));
		//这里对修改的密码进行加密
		PasswordHelper passwordHelper = new PasswordHelper();
		passwordHelper.encryptPassword(userFormMap);
		userMapper.editEntity(userFormMap);
		return "success";
	}

	/**
	 * 验证用户名是否存在
	 *
	 * @author lanyuan Email：mmm333zzz520@163.com date：2014-2-19
	 * @param name
	 * @return
	 */
	@RequestMapping("isUserExist")
	@ResponseBody
	public boolean isUserExist(String name,String id) {
		UserFormMap user = new UserFormMap();
		if(id!=null){
			user = userMapper.findbyFrist("id", id, UserFormMap.class);
		}
		UserFormMap account = userMapper.findbyFrist("username", name, UserFormMap.class);
		Boolean isTrue = (account!=null && user.size()!=0) ? (((account.get("username").toString()).equals(user.get("username").toString())) ? true : false) : (account==null) ? true : false;
		if (account == null  || isTrue) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 验证身份证号是否存在
	 *
	 * @author lanyuan Email：mmm333zzz520@163.com date：2014-2-19
	 * @param name
	 * @return
	 */
	@RequestMapping("isidentityNumExist")
	@ResponseBody
	public boolean isidentityNumExist(String name,String id) {
 		UserFormMap user = new UserFormMap();
		PersonFormMap person = new PersonFormMap();
		if(id!=null){
			user = userMapper.findbyFrist("id", id, UserFormMap.class);
			person = personMapper.findbyFrist("id", user.get("personId").toString(), PersonFormMap.class);
		}
		PersonFormMap personFormMap = personMapper.findbyFrist("identityNum", name, PersonFormMap.class);
		Boolean isTrue = (personFormMap!=null && person.size()!=0 && person.get("identityNum") != null) ? (((personFormMap.get("identityNum").toString()).equals(person.get("identityNum").toString())) ? true : false) : (personFormMap==null) ? true : false;
		if (personFormMap == null || isTrue) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 验证用户手机号是否存在
	 *
	 * @author lanyuan Email：mmm333zzz520@163.com date：2014-2-19
	 * @param name
	 * @return
	 */
	@RequestMapping("isMobileExist")
	@ResponseBody
	public boolean isMobileExist(String name,String id) {
		UserFormMap user = new UserFormMap();
		PersonFormMap person = new PersonFormMap();
		if(id!=null){
			user = userMapper.findbyFrist("id", id, UserFormMap.class);
			person = personMapper.findbyFrist("id", user.get("personId").toString(), PersonFormMap.class);
		}
		PersonFormMap personFormMap = personMapper.findbyFrist("mobile", name, PersonFormMap.class);
		Boolean isTrue = (personFormMap!=null && person.size()!=0 && person.get("mobile") != null) ? (((personFormMap.get("mobile").toString()).equals(person.get("mobile").toString())) ? true : false) : (personFormMap==null) ? true : false;
		if (personFormMap == null || isTrue) {
			return true;
		} else {
			return false;
		}
	}
}