package com.ceecloud.entity;

import com.ceecloud.annotation.TableSeg;
import com.ceecloud.util.FormMap;

@TableSeg(tableName = "t_card", id="id")
public class CardFormMap extends FormMap<String,Object> {
    private static final long serialVersionUID = 1L;
}