package com.study.project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.project.service.CommonService;

@Controller
public class CommonController {
	@Autowired
	private CommonService commonService;
	
	@ResponseBody
	@RequestMapping("/getCodeGrp")
	public List<HashMap<String, Object>> getCodeGrp(@RequestParam String groupId) throws Exception {
		return commonService.getCodeGrp(groupId);
	}
}
