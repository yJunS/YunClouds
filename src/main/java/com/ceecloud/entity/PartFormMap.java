package com.ceecloud.entity;

import com.ceecloud.annotation.TableSeg;
import com.ceecloud.util.FormMap;

/**
 * Created by SyJun on 2017/7/17.
 */
@TableSeg(tableName = "t_part",id="id")
public class PartFormMap extends FormMap<String,Object> {
    private static final long serialVersionUID = 1L;
}
