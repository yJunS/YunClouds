package com.ceecloud.shiro;


import com.ceecloud.entity.ResUserFormMap;
import com.ceecloud.entity.ResourcesFormMap;
import com.ceecloud.entity.UserFormMap;
import com.ceecloud.entity.UserLoginFormMap;
import com.ceecloud.mapper.ResourcesMapper;
import com.ceecloud.mapper.UserLoginMapper;
import com.ceecloud.mapper.UserMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cas.CasAuthenticationException;
import org.apache.shiro.cas.CasToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.CollectionUtils;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.validation.Assertion;
import org.jasig.cas.client.validation.TicketValidationException;
import org.jasig.cas.client.validation.TicketValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

/**
 * 自定义Realm,进行数据源配置
 * 
 * @author lanyuan 2014-12-25
 * @Email: mmm333zzz520@163.com
 * @version 3.0v
 */
public class MyRealm extends CasRealm {
	private static Logger log = LoggerFactory.getLogger(MyRealm.class);

	@Autowired
	private CacheManager cacheManager;

	public MyRealm() {
		super();
		setCacheManager(cacheManager);
	}

	@Inject
	private ResourcesMapper resourcesMapper;

	@Inject
	private UserMapper userMapper;

	@Inject
	private UserLoginMapper userLoginMapper;

	public void setResourcesMapper(ResourcesMapper resourcesMapper) {
		this.resourcesMapper = resourcesMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	// this is the url of the CAS server (example : http://host:port/cas)
	private String casServerUrlPrefix;

	// this is the CAS service url of the application (example : http://host:port/mycontextpath/shiro-cas)
	private String casService;

	public String getCasService() {
		return casService;
	}

	public void setCasService(String casService) {
		this.casService = casService;
	}

	public String getCasServerUrlPrefix() {
		return casServerUrlPrefix;
	}

	public void setCasServerUrlPrefix(String casServerUrlPrefix) {
		this.casServerUrlPrefix = casServerUrlPrefix;
	}
	/**
	 * 只有需要验证权限时才会调用, 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.在配有缓存的情况下，只加载一次.
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		String loginName = SecurityUtils.getSubject().getPrincipal().toString();
		if (loginName != null) {
			String userId = SecurityUtils.getSubject().getSession().getAttribute("userSessionId").toString();
			UserFormMap userFormMap = userMapper.findbyFrist("id",userId,UserFormMap.class);
			ResUserFormMap resUserFormMap = new ResUserFormMap();
			resUserFormMap.set("userId", userId);
			List<ResourcesFormMap> rs = resourcesMapper.findUserResourcess(resUserFormMap);
			ResourcesFormMap resourcesFormMap = new ResourcesFormMap();
			resourcesFormMap.put("roleId",userFormMap.get("role"));
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

	/**
	 * 认证回调函数,登录时调用
	 * 首先根据传入的用户名获取User信息；然后如果user为空，那么抛出没找到帐号异常UnknownAccountException；
	 * 如果user找到但锁定了抛出锁定异常LockedAccountException；最后生成AuthenticationInfo信息，
	 * 交给间接父类AuthenticatingRealm使用CredentialsMatcher进行判断密码是否匹配，
	 * 如果不匹配将抛出密码错误异常IncorrectCredentialsException；
	 * 另外如果密码重试此处太多将抛出超出重试次数异常ExcessiveAttemptsException；
	 * 在组装SimpleAuthenticationInfo信息时， 需要传入：身份信息（用户名）、凭据（密文密码）、盐（username+salt），
	 * CredentialsMatcher使用盐加密传入的明文密码和此处的密文密码进行匹配。
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		CasToken casToken = (CasToken) token;
		String ticket = (String)casToken.getCredentials();
		TicketValidator ticketValidator = ensureTicketValidator();
		// contact CAS server to validate service ticket
		Assertion casAssertion = null;
		try
		{
			casAssertion = ticketValidator.validate(ticket, getCasService());
			AttributePrincipal casPrincipal = casAssertion.getPrincipal();
			String userId = casPrincipal.getName();
			log.debug("Validate ticket : {} in CAS server : {} to retrieve user : {}", new Object[] {
					ticket, getCasServerUrlPrefix(), userId
			});
			Map attributes = casPrincipal.getAttributes();
			casToken.setUserId(userId);
			String rememberMeAttributeName = getRememberMeAttributeName();
			String rememberMeStringValue = (String)attributes.get(rememberMeAttributeName);
			boolean isRemembered = rememberMeStringValue != null && Boolean.parseBoolean(rememberMeStringValue);
			if(isRemembered)
				casToken.setRememberMe(true);
			List principals = CollectionUtils.asList(new Object[] {
					userId, attributes
			});
			PrincipalCollection principalCollection = new SimplePrincipalCollection(principals, getName());
			String username = attributes.get("username").toString();
			String password = attributes.get("password").toString();
			UserFormMap userFormMap = new UserFormMap();
			userFormMap.put("accountName", "" + username + "");
			List<UserFormMap> userFormMaps = userMapper.findByUsername(userFormMap);
			if (userFormMaps.size() != 0) {
				if ("1".equals(userFormMaps.get(0).get("isLock").toString())) {
					throw new LockedAccountException(); // 帐号锁定
				}
				// 从数据库查询出来的账号名和密码,与用户输入的账号和密码对比
				// 当用户执行登录时,在方法处理上要实现user.login(token);
				// 然后会自动进入这个类进行认证
				// 交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
				SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(principalCollection,// salt=username+salt
						ticket // realm name
				);
				// 当验证都通过后，把用户信息放在session里
				Session session = SecurityUtils.getSubject().getSession();
				session.setAttribute("userSession", userFormMaps.get(0));
				session.setAttribute("userSessionId", userFormMaps.get(0).get("id"));
				session.setTimeout(-1000l);
				UserLoginFormMap userLogin = new UserLoginFormMap();
				userLogin.put("userId", session.getAttribute("userSessionId"));
				userLogin.put("accountName", username);
				userLogin.put("loginIP", session.getHost());
				try {
					userLoginMapper.addEntity(userLogin);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return authenticationInfo;
			} else {
				throw new UnknownAccountException();// 没找到帐号
			}

		}
		catch(TicketValidationException e)
		{
			throw new CasAuthenticationException((new StringBuilder()).append("Unable to validate ticket [").append(ticket).append("]").toString(), e);
		}
	}
	/**
     * 更新用户授权信息缓存.
     */
	public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
		super.clearCachedAuthorizationInfo(principals);
	}
	/**
     * 更新用户信息缓存.
     */
	public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
		super.clearCachedAuthenticationInfo(principals);
	}

	/**
	 * 清除用户授权信息缓存.
	 */
	public void clearAllCachedAuthorizationInfo() {
		getAuthorizationCache().clear();
	}

	/**
	 * 清除用户信息缓存.
	 */
	public void clearAllCachedAuthenticationInfo() {
		getAuthenticationCache().clear();
	}
	
	/**
	 * 清空所有缓存
	 */
	public void clearCache(PrincipalCollection principals) {
		super.clearCache(principals);
	}


	/**
	 * 清空所有认证缓存
	 */
	public void clearAllCache() {
		clearAllCachedAuthenticationInfo();
		clearAllCachedAuthorizationInfo();
	}

}