package com.ceecloud.shiro;

import com.ceecloud.entity.ResUserFormMap;
import com.ceecloud.entity.ResourcesFormMap;
import com.ceecloud.entity.UserFormMap;
import com.ceecloud.entity.UserLoginFormMap;
import com.ceecloud.mapper.ResourcesMapper;
import com.ceecloud.mapper.UserLoginMapper;
import com.ceecloud.mapper.UserMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cas.CasAuthenticationException;
import org.apache.shiro.cas.CasRealm;
import org.apache.shiro.cas.CasToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.util.StringUtils;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.validation.Assertion;
import org.jasig.cas.client.validation.TicketValidationException;
import org.jasig.cas.client.validation.TicketValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

public class CasAuthorizingRealm extends CasRealm {
	 private static Logger log = LoggerFactory.getLogger(CasAuthorizingRealm.class);
	@Inject
	private ResourcesMapper resourcesMapper;

	@Inject
	private UserMapper userMapper;

	@Inject
	private UserLoginMapper userLoginMapper;

	/***
	 * 单点认证方法
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		 CasToken casToken = (CasToken) token;
	        if (token == null) {
	            return null;
	        }
	        
	        String ticket = (String)casToken.getCredentials();
	        if (!StringUtils.hasText(ticket)) {
	            return null;
	        }
	        
	        TicketValidator ticketValidator = ensureTicketValidator();

	        try {
	            // contact CAS server to validate service ticket
	            Assertion casAssertion = ticketValidator.validate(ticket, getCasService());
	            // get principal, user id and attributes
	            AttributePrincipal casPrincipal = casAssertion.getPrincipal();
	            String userId = casPrincipal.getName();
	            log.debug("Validate ticket : {} in CAS server : {} to retrieve user : {}", new Object[]{
	                    ticket, getCasServerUrlPrefix(), userId
	            });

	            Map<String, Object> attributes = casPrincipal.getAttributes();
	            // refresh authentication token (user id + remember me)
	            casToken.setUserId(userId);
	            String rememberMeAttributeName = getRememberMeAttributeName();
	            String rememberMeStringValue = (String)attributes.get(rememberMeAttributeName);
	            boolean isRemembered = rememberMeStringValue != null && Boolean.parseBoolean(rememberMeStringValue);
	            if (isRemembered) {
	                casToken.setRememberMe(true);
	            }
	            // create simple authentication info
	           // List<Object> principals = CollectionUtils.asList(userId, attributes);
				UserFormMap userFormMap1 = new UserFormMap();
				userFormMap1.set("accountName",attributes.get("username"));
	            List<UserFormMap> userFormMapList = this.userMapper.findByUsername(userFormMap1);
	            
	            //获取当前系统所对应的左侧菜单集合
				ResUserFormMap resUserFormMap = new ResUserFormMap();
				resUserFormMap.set("userId",userFormMapList.get(0).get("id"));
				List<ResourcesFormMap> rs = resourcesMapper.findUserResourcess(resUserFormMap);
				ResourcesFormMap resourcesFormMap = new ResourcesFormMap();
				resourcesFormMap.put("roleId",userFormMapList.get(0).get("role"));
				List<ResourcesFormMap> rs1 = resourcesMapper.findRes(resourcesFormMap);
				// 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
				SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
				// 用户的角色集合
				// info.addRole("default");
				// 用户的角色集合
				// info.setRoles(user.getRolesName());
				// 用户的角色对应的所有权限，如果只使用角色定义访问权限
				for (ResourcesFormMap resources : rs) {
					info.addStringPermission(resources.get("resKey").toString());
				}
				for(ResourcesFormMap resources : rs1){
					if(info.getRoles()==null){
						info.addStringPermission(resources.get("resKey").toString());
					}else if(info.getRoles()!=null && !info.getObjectPermissions().contains(resources.get("resKey").toString())){
						info.addStringPermission(resources.get("resKey").toString());
					}
				}
				SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(userFormMapList.get(0).get("username"), // 用户名
						userFormMapList.get(0).get("password"), // 密码
						ByteSource.Util.bytes(userFormMapList.get(0).get("username") + "" + userFormMapList.get(0).get("credentialsSalt")),// salt=username+salt
						getName() // realm name
				);
				// 当验证都通过后，把用户信息放在session里
				Session session = SecurityUtils.getSubject().getSession();
				session.setAttribute("userSession", userFormMapList.get(0));
				session.setAttribute("userSessionId", userFormMapList.get(0).get("id"));
				UserLoginFormMap userLogin = new UserLoginFormMap();
				System.out.println(session.getAttribute("userSessionId"));
				PrincipalCollection principalCollection = new SimplePrincipalCollection(userFormMapList.get(0), getName());
	            return authenticationInfo;
	        } catch (TicketValidationException e) { 
	            throw new CasAuthenticationException("Unable to validate ticket [" + ticket + "]", e);
	        }
	}

	/****
	 * 授权方法
	 */
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		UserFormMap user = (UserFormMap) principals.fromRealm(getName()).iterator().next();
		if(user != null) {

			//获取当前系统所对应的左侧菜单集合
			ResUserFormMap resUserFormMap = new ResUserFormMap();
			resUserFormMap.set("userId",user.get("id"));
			List<ResourcesFormMap> rs = resourcesMapper.findUserResourcess(resUserFormMap);
			ResourcesFormMap resourcesFormMap = new ResourcesFormMap();
			resourcesFormMap.put("roleId",user.get("role"));
			List<ResourcesFormMap> rs1 = resourcesMapper.findRes(resourcesFormMap);
			// 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			// 用户的角色集合
			// info.addRole("default");
			// 用户的角色集合
			// info.setRoles(user.getRolesName());
			// 用户的角色对应的所有权限，如果只使用角色定义访问权限
			for (ResourcesFormMap resources : rs) {
				info.addStringPermission(resources.get("resKey").toString());
			}
			for(ResourcesFormMap resources : rs1){
				if(info.getRoles()==null){
					info.addStringPermission(resources.get("resKey").toString());
				}else if(info.getRoles()!=null && !info.getObjectPermissions().contains(resources.get("resKey").toString())){
					info.addStringPermission(resources.get("resKey").toString());
				}
			}
				
				return info;
			}
			
		return null;
	}
	

	
}
