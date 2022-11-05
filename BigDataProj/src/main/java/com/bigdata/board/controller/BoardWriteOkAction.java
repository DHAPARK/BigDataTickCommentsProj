package com.bigdata.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.BoardDAO;
import com.bigdata.vo.BoardVO;

public class BoardWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		BoardDAO bdao = new BoardDAO();
		BoardVO bvo = new BoardVO();
		
		bvo.setBoard_title(req.getParameter("board_title"));
		bvo.setBoard_content(req.getParameter("board_content"));
		bvo.setUser_name(req.getParameter("user_name"));
		
		bdao.insertBoard(bvo);
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/board/BoardList.bo");
		
		return forward;
	}

}
