package com.koreait.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.board.dao.BoardDAO;
import com.koreait.board.dao.ReplyDTO;

public class AddReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		
		BoardDAO bdao = new BoardDAO();
		ReplyDTO reply = new ReplyDTO();
		
		int boardnum = Integer.parseInt( req.getParameter("boardnum") );
		
		reply.setBoardnum( boardnum );
		reply.setUsername( req.getParameter("username") );
		reply.setPassword( req.getParameter("password") );
		reply.setReplycontents( req.getParameter("replycontents") );
		
		if(bdao.addReply( reply )) {
			forward.setRedirect(true);
			forward.setPath( req.getContextPath() + "/board/BoardView.bo?boardnum=" + boardnum );
		}
		
		return forward;
	}
	
}

















