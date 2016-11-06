package com.ceecloud.mapper;

import com.ceecloud.entity.UserFormMap;
import com.ceecloud.mapper.base.BaseMapper;

import java.util.List;

/**
 * Created by SyJun on 2016/6/23.
 */
public interface UserMapper extends BaseMapper {

    public List<UserFormMap> findUserPage(UserFormMap userFormMap);

    public List<UserFormMap> findByUsername(UserFormMap userFormMap);

    public UserFormMap findById(UserFormMap userFormMap);
}
