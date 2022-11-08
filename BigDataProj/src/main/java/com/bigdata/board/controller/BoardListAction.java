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
		
		//int totalCnt = dao.getBoardCnt();
		int totalCnt = dao.getEachAgeBoardCnt( Integer.parseInt( req.getParameter("ageRange") ) / 10 );
		
		int startPage = (page -1) / pageSize * pageSize + 1;
		int endPage = startPage + 9;
		int totalPage = (totalCnt - 1) / pageSize + 1;
		
		endPage = endPage > totalPage? totalPage : endPage;
		
		
		System.out.println("nowPage가 뭐길래 : "+ page );
		
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", page );
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("boardAgeRange", Integer.parseInt( req.getParameter("ageRange") ) / 10 );
		
		req.setAttribute("boardList", dao.getBoardList(startRow, endRow , Integer.parseInt( req.getParameter("ageRange") ) / 10 ));
		
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/app/board/boardList.jsp");
		
		return forward;
	}

}
