package com.study.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.project.mapper.BoardMapper;

@Service
@Transactional
public class BoardService {
	@Autowired
	private BoardMapper boardMapper;
	
	public List<HashMap> getBoardList(HashMap<String, Object> map) throws Exception{
		return boardMapper.getBoardList(map);
	}
}
