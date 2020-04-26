package com.ceecloud.mapper;

import com.ceecloud.entity.CardFormMap;
import com.ceecloud.entity.CardTranInfoFormMap;
import com.ceecloud.mapper.base.BaseMapper;

import java.util.List;

public interface CardTranInfoMapper extends BaseMapper{
    List<CardTranInfoFormMap> findCardTranInfoPage(CardTranInfoFormMap cardTranInfoFormMap);
}
