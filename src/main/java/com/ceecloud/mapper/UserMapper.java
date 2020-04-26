package com.ceecloud.mapper;

import com.ceecloud.entity.UserCardFormMap;
import com.ceecloud.entity.UserFormMap;
import com.ceecloud.mapper.base.BaseMapper;
import org.owasp.esapi.User;

import java.util.List;

/**
 * Created by SyJun on 2016/6/23.
 */
public interface UserMapper extends BaseMapper {

    public List<UserFormMap> findUserPage(UserFormMap userFormMap);

    public List<UserFormMap> findByUsername(UserFormMap userFormMap);

    public UserFormMap findById(UserFormMap userFormMap);

    public List<UserFormMap> findCompanyManager(UserFormMap userFormMap);

    public List<UserFormMap> findFreePerson(UserFormMap userFormMap);

    public UserFormMap findByPersonId(UserFormMap userFormMap);

    public void addUserCard(UserCardFormMap userCardFormMap);

    public UserCardFormMap findUserCardById(UserCardFormMap userCardFormMap);

    public void deleteUserCardByUserId(UserCardFormMap userCardFormMap);
}
