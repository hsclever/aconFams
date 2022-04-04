package com.study.project.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.project.mapper.BoardMapper;
import com.study.project.utils.EncSha256;

@Service
@Transactional
public class BoardService {
	@Autowired
	private BoardMapper boardMapper;
	
	public int getBoardTotalCount(HashMap<String, Object> map) throws Exception{
		return boardMapper.getBoardTotalCount(map);
	}
	
	public List<HashMap> getBoardList(HashMap<String, Object> map) throws Exception{
		return boardMapper.getBoardList(map);
	}
	
	//글 등록
	public int doBoardWrite(HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		map.put("rgstId", session.getAttribute("loginId")); //로그인 아이디
		map.put("pw", EncSha256.encrypt(map.get("pw").toString()));
		
		return boardMapper.doBoardWrite(map);
	}
	
	//글 수정
	public int doBoardModify(HashMap<String, Object> map) throws Exception{
		return boardMapper.doBoardModify(map);
	}
	
	//글 삭제
	public int doBoardDelete(HashMap<String, Object> map) throws Exception{
		return boardMapper.doBoardDelete(map);
	}
}
