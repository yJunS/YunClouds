package com.ceecloud.shiro.filter;

import com.ceecloud.entity.UserFormMap;
import com.ceecloud.mapper.UserMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.PathMatchingFilter;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class SysUserFilter extends PathMatchingFilter {

	@Inject
	private UserMapper userMapper;

    @Override
    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {

        String username = (String)SecurityUtils.getSubject().getPrincipal();
        UserFormMap userFormMap = new UserFormMap();
		userFormMap.put("accountName", "" + username + "");
        request.setAttribute("user", userMapper.findByNames(userFormMap));
        return true;
    }
}