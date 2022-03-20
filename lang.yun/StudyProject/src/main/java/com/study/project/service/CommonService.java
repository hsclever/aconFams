package com.study.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.project.mapper.CommonMapper;

@Service
@Transactional
public class CommonService {
	@Autowired
	private CommonMapper commonMapper;
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> getCodeGrp(String groupId) throws Exception{
		return (List<HashMap<String, Object>>) commonMapper.getCodeGrp(groupId);
	}
}
