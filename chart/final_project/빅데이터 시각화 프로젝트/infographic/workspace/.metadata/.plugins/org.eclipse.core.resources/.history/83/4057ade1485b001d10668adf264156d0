package com.koreait.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.board.dao.BoardDAO;

public class UpdateReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		int replynum = Integer.parseInt( req.getParameter("replynum") );
		String replycontents = req.getParameter( "reply" + replynum );
		String boardnum = req.getParameter("boardnum");
		
		if(bdao.updateReply(replynum, replycontents)) {
			forward.setRedirect(true);
			forward.setPath("/board/BoardView.bo?boardnum=" + boardnum);
		} 
		
		return forward;
	}

}













