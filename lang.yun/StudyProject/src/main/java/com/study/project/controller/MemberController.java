package com.study.project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.project.service.MemberService;
import com.study.project.utils.EncSha256;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	/**
	 * 회원가입 페이지
	 * @return
	 */
	@RequestMapping("/joinPage")
	public String joinPage() {
		return "join";
	}
	
	/**
	 * 아이디 중복체크
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/idCheck")
	public boolean idCheck(@RequestParam HashMap<String, Object> map) throws Exception {
		List<HashMap> userList = memberService.getUserList(map);
		return userList.size() > 0 ? true : false;
	}
	
	/**
	 * 회원가입
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/doJoin")
	public HashMap<String, Object> chkPwValid(@RequestParam HashMap<String, Object> map) throws Exception {
		String userPw = (String)map.get("userPw");
		String userPw_confirm = (String)map.get("userPw_confirm");
		
		HashMap<String, Object> rsMap = new HashMap<String, Object>();
		
		if(!userPw.equals(userPw_confirm)) {
			rsMap.put("RESULT", "ERROR");
			rsMap.put("RESULT_MSG", "비밀번호 검증에 실패했습니다.\n 비밀번호를 확인해주세요.");
			return rsMap;
		}
		
		map.put("userPw", EncSha256.encrypt(map.get("userPw").toString()));
		
		int rs = memberService.addUserInfo(map);
		if(rs > 0) {
			rsMap.put("RESULT", "SUCCESS");
		}else {
			rsMap.put("RESULT", "ERROR");
			rsMap.put("RESULT_MSG", "회원가입에 실패했습니다.");
		}
		return rsMap;
	}
	
	/**
	 * 로그인
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/doLogin")
	public boolean doLogin(@RequestParam HashMap<String, Object> map) throws Exception {
		map.put("userPw", EncSha256.encrypt(map.get("userPw").toString()));
		List<HashMap> userList = memberService.getUserList(map);
		return userList.size() == 1 ? true : false;
	}
}
