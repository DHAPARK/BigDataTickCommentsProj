package com.bigdata.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.BoardDAO;
import com.bigdata.vo.BoardVO;

public class BoardEditOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		BoardVO bvo = new BoardVO();
		
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		
		bvo.setBoard_no(board_no);

		bvo.setBoard_title(req.getParameter("board_title"));
		bvo.setBoard_content(req.getParameter("board_content"));
		bdao.updateBoard(bvo);
		
		forward.setRedirect(false);
		forward.setPath("/board/BoardViewOk.bo?board_no=" + board_no);
		
		return forward;
	}
	
}
