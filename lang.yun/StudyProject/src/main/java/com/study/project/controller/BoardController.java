package com.study.project.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.study.project.service.BoardService;
import com.study.project.utils.EncSha256;
import com.study.project.utils.PagingUtils;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping("/board/getBoardList")
	public ModelAndView getBoardList( ModelAndView mv, @RequestParam HashMap<String, Object> map) throws Exception {
		map.put("totalCount", boardService.getBoardTotalCount(map));
		map = PagingUtils.setPaging(map);
		mv.addObject("pagingMap", map);
		List<HashMap> boardList = boardService.getBoardList(map);
		mv.addObject("boardList", boardList);
		mv.setViewName("board/boardList");
		return mv;
	}
	
	/**
	 * 글 작성, 글 수정
	 * @param mv
	 * @param no
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/board/goBoardForm")
	public ModelAndView goBoardForm(ModelAndView mv, @RequestParam(defaultValue = "") String no) throws Exception {
		//no 값이 있을 경우 처리 (수정case)
		if(!"".equals(no)) { //값이 있다면 수정페이지로 판단
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("no", no);
			List<HashMap> boardList = boardService.getBoardList(map);
			if(boardList.size() == 1) {
				mv.addObject("boardMap", boardList.get(0));
			}
		}
		mv.setViewName("board/boardForm");
		return mv;
	}
	
	/**
	 * 글 상세 페이지
	 * @param mv
	 * @param no
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/board/goDetailPage")
	public ModelAndView goDetailPage(ModelAndView mv, @RequestParam String no) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		List<HashMap> boardList = boardService.getBoardList(map);
		if(boardList.size() == 1) {
			mv.addObject("boardMap", boardList.get(0));
		}
		mv.setViewName("board/boardDetail");
		return mv;
	}
	
	/**
	 * 글 등록
	 * @param mv
	 * @param no
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/board/doWrite")
	public int doWrite(ModelAndView mv, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception {
		int rs = boardService.doBoardWrite(map, request);
		return rs;
	}
	
	/**
	 * 글 수정
	 * @param mv
	 * @param no
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/board/doModify")
	public int doModify(ModelAndView mv,@RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object>	validMap = new HashMap<String, Object>();
		validMap.put("no", map.get("no"));
		validMap.put("pw", EncSha256.encrypt(map.get("pw").toString()));
		List<HashMap> boardList = boardService.getBoardList(validMap);
		if(boardList.size() == 0) {
			return -99;
		}else {
			map.remove("pw");	//mybatis 타지 않도록 수정
			return boardService.doBoardModify(map);
		}
	}
	
	/**
	 * 글 삭제
	 * @param mv
	 * @param no
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/board/doDelete")
	public int doDelete(ModelAndView mv,@RequestParam HashMap<String, Object> map) throws Exception {
		map.put("pw", EncSha256.encrypt(map.get("pw").toString()));
		return boardService.doBoardDelete(map);
	}
	
	/**
	 * 댓글 등록
	 * @param mv
	 * @param no
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/board/doWriteReply")
	public int doWriteReply(ModelAndView mv, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception {
		int rs = boardService.doBoardWrite(map, request);
		return rs;
	}
}
