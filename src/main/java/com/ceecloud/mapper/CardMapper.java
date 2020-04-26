package com.ceecloud.mapper;

import com.ceecloud.entity.CardFormMap;
import com.ceecloud.mapper.base.BaseMapper;

import java.util.List;

/**
 * Created by SyJun on 2016/6/22.
 */
public interface CardMapper extends BaseMapper {

    List<CardFormMap> findCardPage(CardFormMap cardFormMap);

}