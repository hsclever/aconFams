package com.study.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.project.service.MemberService;

@Controller
public class MainController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/main")
	public String main() throws Exception {
		return "main";
	}
}
