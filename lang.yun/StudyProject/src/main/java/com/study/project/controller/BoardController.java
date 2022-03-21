package com.study.project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.project.service.BoardService;
import com.study.project.utils.PagingUtils;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping("/getBoardList")
	public ModelAndView getBoardList(@RequestParam HashMap<String, Object> map, ModelAndView mv) throws Exception {
		map = PagingUtils.setPaging(map);
		mv.addObject("pagingMap", map);
		List<HashMap> boardList = boardService.getBoardList(map);
		mv.addObject("boardList", boardList);
		mv.setViewName("board/boardList");
		return mv;
	}
}
