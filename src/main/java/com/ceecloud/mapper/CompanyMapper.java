package com.ceecloud.mapper;

import com.ceecloud.entity.CompanyFormMap;
import com.ceecloud.mapper.base.BaseMapper;

import java.util.List;

/**
 * Created by SyJun on 2016/6/22.
 */
public interface CompanyMapper extends BaseMapper {

    public List<CompanyFormMap> findCompanyPage(CompanyFormMap companyFormMap);
}
