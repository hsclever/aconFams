package com.joo.study.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.joo.study.service.TestTableService;

@Controller
public class MainController {
	
	@RequestMapping("/test.joo")
	public String getTest() {
		return "test";
	}

	@Autowired
    private TestTableService testtableService;
    
    @RequestMapping(value="list.joo")
    public ModelAndView AllListView(Map<String, Object> map) throws Exception{
        ModelAndView mav = new ModelAndView();
        
        List<Map<String, Object>> AllList = testtableService.SelectAllList();
        
        mav.addObject("Alllist", AllList);
        mav.setViewName("list");
        return mav;
    }
}
