package com.study.project.utils;

import java.util.ArrayList;

public class Test {
	
	
	public static void main(String[] args) {
		/*
		int nowPage = 1;	//현재 페이지
		int startPage = 1;	//현재 블럭의 시작 페이지
		int endPage = 1;	//현재 블럭의 시작 페이지
		int listCnt = 10;	//한페이지에 보여줄 게시물수
		int pageBlock = 10;	//페이지 블럭
		int totalCount = 0;	//전체 게시물수
		int totalPage = 0;	//마지막 페이지
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("nowPage", 3);
		map.put("totalCount", 23);
		
		nowPage = Integer.parseInt(map.get("nowPage").toString());
		totalCount = Integer.parseInt(map.get("totalCount").toString());
		totalPage = totalCount % listCnt == 0 ? totalCount / listCnt  : totalCount / listCnt + 1; 
		startPage = nowPage % pageBlock == 0 ? ((nowPage / pageBlock) - 1) * pageBlock  + 1 : (nowPage / pageBlock) * pageBlock  + 1; 
		endPage = startPage + (pageBlock-1) > totalPage ? totalPage : startPage + (pageBlock-1); 
		
		System.out.println("nowPage:" + nowPage);
		System.out.println("startPage:" + startPage);
		System.out.println("endPage:" + endPage);
		System.out.println("totalPage:" + totalPage);
		*/
		ArrayList<Integer> huddleList = new ArrayList<Integer>();
		huddleList.add(0);
		int MAX_SL_SAM_TOT = 0;
		float per_graph = ((float)MAX_SL_SAM_TOT / huddleList.get(huddleList.size()-1)) * 100;
		System.out.println(per_graph);
	}

}
