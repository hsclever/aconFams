package com.study.project.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.study.project.service.BoardService;
import com.study.project.utils.PagingUtils;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping("/getBoardList")
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
	@RequestMapping("/goBoardForm")
	public ModelAndView goBoardForm(ModelAndView mv, @RequestParam(defaultValue = "") String no) throws Exception {
		//no 값이 있을 경우 처리 (수정case)
		if(!"".equals(no)) { //값이 있다면 수정페이지로 판단
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("no", no);
			List<HashMap> boardList = boardService.getBoardList(map);
			if(boardList.size() == 1) {
				mv.addObject(boardList.get(0));
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
	@RequestMapping("/goBoardDetail")
	public ModelAndView goBoardDetail(ModelAndView mv, @RequestParam String no) throws Exception {
		//no 값이 있을 경우 처리 (수정case)
		HashMap<String, Object> rsMap = new HashMap<String, Object>();
		mv.addObject(rsMap);
		mv.setViewName("board/boardForm");
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
	@RequestMapping("/doWrite")
	public int doWrite(ModelAndView mv, @RequestParam HashMap<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginId"));
		if(session.getAttribute("loginId") == null) { //세션이 없다면 로그인페이지로... 추후 인터셉터 적용 필요
			return -99;
		}
		//no 값이 있을 경우 처리 (수정case)
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
	@RequestMapping("/doModify")
	public int doModify(ModelAndView mv, @RequestParam String no) throws Exception {
		//no 값이 있을 경우 처리 (수정case)
		int rs = 0;
		return rs;
	}
}
