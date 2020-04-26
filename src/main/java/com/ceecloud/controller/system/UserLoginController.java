package com.ceecloud.controller.system;

import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.ResourcesFormMap;
import com.ceecloud.entity.UserFormMap;
import com.ceecloud.entity.UserLoginFormMap;
import com.ceecloud.mapper.ResourcesMapper;
import com.ceecloud.mapper.UserLoginMapper;
import com.ceecloud.mapper.UserMapper;
import com.ceecloud.plugin.PageView;
import com.ceecloud.util.Common;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 
 * @author lanyuan 2014-11-19
 * @Email: mmm333zzz520@163.com
 * @version 3.0v
 */
@Controller
@RequestMapping("/userlogin/")
public class UserLoginController extends BaseController {
	@Inject
	private UserLoginMapper userLoginMapper;

	@Inject
	private ResourcesMapper resourcesMapper;

	@Inject
	private UserMapper userMapper;


	@RequestMapping("listUI")
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
		return Common.BACKGROUND_PATH + "/system/userlogin/list";
	}

	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage(String pageNow,
							   String pageSize) throws Exception {
		UserLoginFormMap userLoginFormMap = getFormMap(UserLoginFormMap.class);
		userLoginFormMap=toFormMap(userLoginFormMap, pageNow, pageSize,userLoginFormMap.getStr("orderby"));
        pageView.setRecords(userLoginMapper.findByPage(userLoginFormMap));
		return pageView;
	}

	@RequestMapping("logout")
	public String logout(Model model) throws Exception {
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		if(session.getAttribute("userSession")==null){
			PrincipalCollection principalCollection = subject.getPrincipals();
			List list = principalCollection.asList();
			Map attributes = null;
			for(int i=0;i<list.size();i++) {
				if(i==1){
					attributes = (Map) list.get(i);
				}
			}
			UserFormMap userFormMap = new UserFormMap();
			userFormMap.put("accountName", "" + attributes.get("username").toString() + "");
			List<UserFormMap> userFormMaps = userMapper.findByUsername(userFormMap);
			session.setAttribute("userSession", userFormMaps.get(0));
			session.setAttribute("userSessionId", userFormMaps.get(0).get("id"));
		}
		return Common.BACKGROUND_PATH + "/system/userlogin/logout";
	}

}