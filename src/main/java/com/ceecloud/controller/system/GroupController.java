package com.ceecloud.controller.system;

import com.ceecloud.controller.index.BaseController;
import com.ceecloud.mapper.GroupMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;

/**
 * Created by SyJun on 2016/7/5.
 */
@Controller
@RequestMapping("/group/")
public class GroupController extends BaseController{

    @Inject
    private GroupMapper groupMapper;

    @RequestMapping("selGroup")
    public String seletGroup(Model model){

        return null;
    }

}
