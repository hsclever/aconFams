package com.study.project.mapper;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
@Mapper
@Repository
public interface BoardMapper {
	//게시물 목록
	int getBoardTotalCount(HashMap<String, Object> map) throws Exception;
	
	//게시물 목록
	List<HashMap> getBoardList(HashMap<String, Object> map) throws Exception;
	
	//글 등록
	int doBoardWrite(HashMap<String, Object> map) throws Exception;
	
	//글 수정
	int doBoardModify(HashMap<String, Object> map) throws Exception;
}
