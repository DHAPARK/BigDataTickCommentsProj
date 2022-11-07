package com.bigdata.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.BoardDAO;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		BoardDAO dao = new BoardDAO();
	
		String temp = req.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		int pageSize = 10;
		
		int endRow = page * pageSize;
		int startRow = endRow - 9;
		
		int totalCnt = dao.getBoardCnt();
		
		int startPage = (page -1) / pageSize * pageSize + 1;
		int endPage = startPage + 9;
		int totalPage = (totalCnt - 1) / pageSize + 1;
		
		endPage = endPage > totalPage? totalPage : endPage;
		
		
//		List<BoardVO> boardList = dao.getBoardList(startRow, endRow);
		
//		String age_range = req.getParameter("age_range");
//		
//		if (age_range == null) {
//			req.setAttribute("boardList", boardList);
//		}else {
//			req.setAttribute("boardList", dao.getAge_range(age_range));
//		}
		
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("boardList", dao.getBoardList(startRow, endRow));
		
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/app/board/boardList.jsp");
		
		return forward;
	}

}
