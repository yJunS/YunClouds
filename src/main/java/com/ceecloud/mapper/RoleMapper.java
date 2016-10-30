package com.ceecloud.mapper;

import com.ceecloud.mapper.base.BaseMapper;
import com.ceecloud.entity.RoleFormMap;

import java.util.List;

/**
 * Created by SyJun on 2016/6/23.
 */
public interface RoleMapper extends BaseMapper {
    public List<RoleFormMap> seletUserRole(RoleFormMap map);

    public void deleteById(RoleFormMap map);
}
