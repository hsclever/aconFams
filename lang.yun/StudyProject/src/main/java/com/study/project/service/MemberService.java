package com.study.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.project.mapper.MemberMapper;

@Service
@Transactional
public class MemberService {
	@Autowired
	private MemberMapper memberMapper;
	
	public List<HashMap> getUserList() throws Exception{
		System.out.println("test111");
		return memberMapper.getUserList();
	}
	
}
