package com.bigdata.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.BoardDAO;

public class BoardEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward = new ActionForward();
		
		BoardDAO dao = new BoardDAO();
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		
		req.setAttribute("board", dao.getDetail(board_no));
		
		forward.setRedirect(false);
		forward.setPath("/app/board/boardEdit.jsp");
		
		return forward;
	}	
}
