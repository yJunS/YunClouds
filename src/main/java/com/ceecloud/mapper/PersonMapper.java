package com.ceecloud.mapper;

import com.ceecloud.entity.PersonFormMap;
import com.ceecloud.mapper.base.BaseMapper;

import java.util.List;

/**
 * Created by SyJun on 2016/6/23.
 */
public interface PersonMapper extends BaseMapper {

    public List<PersonFormMap> findPersonPage(PersonFormMap personFormMap);

    public List<PersonFormMap> findCompanyManager(PersonFormMap personFormMap);

    public List<PersonFormMap> findFreePerson(PersonFormMap personFormMap);

    public PersonFormMap findById(PersonFormMap personFormMap);
}
