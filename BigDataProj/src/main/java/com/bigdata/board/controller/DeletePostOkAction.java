package com.bigdata.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.BoardDAO;
import com.bigdata.vo.FileVO;

public class DeletePostOkAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		
		bdao.deletePost(board_no);
		
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/board/BoardList.bo?ageRange=" + req.getParameter("age_range"));
		
		return forward;
	}
}
