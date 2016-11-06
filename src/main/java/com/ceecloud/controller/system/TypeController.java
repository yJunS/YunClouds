package com.ceecloud.controller.system;

import com.ceecloud.controller.index.BaseController;
import com.ceecloud.entity.CompanyFormMap;
import com.ceecloud.entity.TypeFormMap;
import com.ceecloud.mapper.CompanyMapper;
import com.ceecloud.mapper.TypeMapper;
import com.ceecloud.util.Common;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by SyJun on 2016/6/29.
 */
@Controller
@RequestMapping("/type/")
public class TypeController extends BaseController {
    @Inject
    private TypeMapper typeMapper;

    @Inject
    private CompanyMapper companyMapper;

    @RequestMapping("/selType")
    public String selectType(Model model) throws Exception{
        TypeFormMap typeFormMap = getFormMap(TypeFormMap.class);
        Object companyId = typeFormMap.get("companyId");
        if(null != companyId){
            CompanyFormMap companyFormMap = companyMapper.findbyFrist("id",companyId.toString(),CompanyFormMap.class);
            List<TypeFormMap> list = typeMapper.findByAttribute("id",companyFormMap.get("type").toString(),TypeFormMap.class);
            String ugid = "";
            for (TypeFormMap ml : list) {
                ugid += ml.get("id")+",";
            }
            ugid = Common.trimComma(ugid);
            model.addAttribute("txtTypeSelect", ugid);
            model.addAttribute("userType", list);
            if(StringUtils.isNotBlank(ugid)){
                typeFormMap.put("where", " where id not in ("+ugid+")");
            }else{
                typeFormMap.put("where"," ");
            }
        }
        List<TypeFormMap> types = typeMapper.findByWhere(typeFormMap);
        model.addAttribute("type", types);
        return Common.BACKGROUND_PATH + "/system/company/typeSelect";
    }
}
