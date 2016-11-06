package com.ceecloud.mapper;

import com.ceecloud.entity.DeptFormMap;
import com.ceecloud.mapper.base.BaseMapper;

import java.util.List;

/**
 * Created by SyJun on 2016/6/23.
 */
public interface DeptMapper extends BaseMapper {

    public List<DeptFormMap> seletUserDept(DeptFormMap deptFormMap);

}
