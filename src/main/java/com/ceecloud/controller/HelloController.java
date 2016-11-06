package com.ceecloud.controller;

import com.ceecloud.controller.index.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by SyJun on 2016/6/21.
 */
@Controller
@RequestMapping("/welcome")
public class HelloController extends BaseController {
    @RequestMapping(method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {

        model.addAttribute("message", "Spring Security Hello World1");
        return "hello";

    }
}
