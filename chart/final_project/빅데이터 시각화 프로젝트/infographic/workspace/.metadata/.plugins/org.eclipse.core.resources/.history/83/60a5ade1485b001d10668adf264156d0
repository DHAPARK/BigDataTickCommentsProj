package com.koreait.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.board.dao.BoardDAO;
import com.koreait.board.dao.BoardDTO;

public class BoardWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		String boardtitle = req.getParameter("boardtitle");
		String boardcontents = req.getParameter("boardcontents");
		String username = req.getParameter("username");
		
		BoardDTO board = new BoardDTO();
		board.setBoardtitle(boardtitle);
		board.setBoardcontents(boardcontents);
		board.setUsername(username);
		
		forward.setRedirect(true);
		if(bdao.insertBoard(board)) {
			// 성공시
			int boardnum = bdao.getSeq();
			forward.setPath(req.getContextPath() + "/board/BoardView.bo?boardnum=" + boardnum);
		} else {
			// 실패시
			forward.setPath(req.getContextPath() + "/board/BoardWrite.bo" );
		}
		
		return forward;
	}

}
















