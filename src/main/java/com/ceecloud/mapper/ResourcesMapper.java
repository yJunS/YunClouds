package com.ceecloud.mapper;

import com.ceecloud.entity.ResourcesFormMap;
import com.ceecloud.mapper.base.BaseMapper;

import java.util.List;

/**
 * Created by SyJun on 2016/6/24.
 */
public interface ResourcesMapper extends BaseMapper {
    public List<ResourcesFormMap> findChildlists(ResourcesFormMap map);

    public List<ResourcesFormMap> findRes(ResourcesFormMap map);

    public void updateSortOrder(List<ResourcesFormMap> map);

    public List<ResourcesFormMap> findUserResourcess(String userId);
}
