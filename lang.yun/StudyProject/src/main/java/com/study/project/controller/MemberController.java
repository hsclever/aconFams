package com.study.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@RequestMapping("/joinPage")
	public String joinPage() {
		return "join";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "join";
	}
}
