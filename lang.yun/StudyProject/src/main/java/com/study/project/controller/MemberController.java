package com.study.project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.project.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/joinPage")
	public String joinPage() {
		return "join";
	}
	
	@ResponseBody
	@RequestMapping("/idCheck")
	public boolean idCheck(@RequestParam HashMap<String, Object> map) throws Exception {
		List<HashMap> userList = memberService.getUserList(map);
		return userList.size() > 0 ? true : false;
	}
	
	@RequestMapping("/join")
	public String join() {
		return "join";
	}
}
