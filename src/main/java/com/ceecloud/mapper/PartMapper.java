package com.ceecloud.mapper;

import com.ceecloud.entity.PartFormMap;
import com.ceecloud.mapper.base.BaseMapper;

import java.util.List;

/**
 * Created by SyJun on 2017/7/17.
 */
public interface PartMapper extends BaseMapper {
    public List<PartFormMap> findPartPage(PartFormMap partFormMap);
}
