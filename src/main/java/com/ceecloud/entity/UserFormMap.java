package com.ceecloud.entity;


import com.ceecloud.annotation.TableSeg;
import com.ceecloud.util.FormMap;

/**
 * Created by SyJun on 2016/5/24.
 */
@TableSeg(tableName = "t_user", id="id")
public class UserFormMap extends FormMap<String,Object> {

    private static final long serialVersionUID = 1L;

}
