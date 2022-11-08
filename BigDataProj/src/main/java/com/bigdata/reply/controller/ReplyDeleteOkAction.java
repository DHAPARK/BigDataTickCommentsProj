package com.bigdata.reply.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.ReplyDAO;
import com.bigdata.vo.ReplyVO;

public class ReplyDeleteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward = new  ActionForward();
		ReplyDAO rdao = new ReplyDAO();
		int reply_no = Integer.parseInt(req.getParameter("reply_no"));
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		
		if(rdao.deletReply(reply_no) ==1) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/board/BoardViewOk.bo?board_no="+board_no);
		}
		return forward;
	}
}
