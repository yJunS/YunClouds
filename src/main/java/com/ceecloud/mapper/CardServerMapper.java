package com.ceecloud.mapper;

import com.ceecloud.entity.CardServerFormMap;
import com.ceecloud.mapper.base.BaseMapper;

import java.util.List;

/**
 * Created by SyJun on 2016/6/23.
 */
public interface CardServerMapper extends BaseMapper {
    public List<CardServerFormMap> findCardServerPage(CardServerFormMap cardServerFormMap);
}
