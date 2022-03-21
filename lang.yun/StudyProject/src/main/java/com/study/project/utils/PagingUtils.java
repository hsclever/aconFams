package com.study.project.utils;

import java.util.HashMap;


public class PagingUtils {
	private static int nowPage = 1;	//현재 페이지
	private static int startPage = 1;	//현재 블럭의 시작 페이지
	private static int endPage = 1;	//현재 블럭의 시작 페이지
	private static int listCnt = 10;	//한페이지에 보여줄 게시물수
	private static int pageBlock = 10;	//페이지 블럭
	private static int totalCount = 0;	//전체 게시물수
	private static int totalPage = 0;	//마지막 페이지
	
	public static HashMap<String, Object> setPaging(HashMap<String, Object> map) {
		nowPage =  Integer.parseInt(StringUtils.NVL( map.get("nowPage"), "1"));
		totalCount = Integer.parseInt(StringUtils.NVL( map.get("totalCount"), "0"));
		totalPage = totalCount % listCnt == 0 ? totalCount / listCnt  : totalCount / listCnt + 1; 
		startPage = nowPage % pageBlock == 0 ? ((nowPage / pageBlock) - 1) * pageBlock  + 1 : (nowPage / pageBlock) * pageBlock  + 1; 
		endPage = startPage + (pageBlock-1) > totalPage ? totalPage : startPage + (pageBlock-1); 
		
		map.put("nowPage", nowPage);
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return map;
	}
}


