package com.ceecloud.mapper;

import com.ceecloud.entity.CardFormMap;
import com.ceecloud.entity.UserCardFormMap;
import com.ceecloud.mapper.base.BaseMapper;

import java.util.List;

/**
 * Created by SyJun on 2016/6/22.
 */
public interface UserCardMapper extends BaseMapper {

    List<UserCardFormMap> findCardPage(UserCardFormMap userCardFormMap);

    UserCardFormMap findUserCardByUserId(UserCardFormMap userCardFormMap);

}