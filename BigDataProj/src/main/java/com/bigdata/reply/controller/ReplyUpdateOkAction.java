package com.bigdata.reply.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.ReplyDAO;
import com.bigdata.vo.ReplyVO;

public class ReplyUpdateOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		ActionForward forward = new ActionForward();
		ReplyDAO rdao = new ReplyDAO();
		ReplyVO rvo = new ReplyVO();
		
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		int reply_no = Integer.parseInt(req.getParameter("reply_no"));
		rvo.setReply_content(req.getParameter("update_content"+reply_no));
		rvo.setReply_no(Integer.parseInt(req.getParameter("reply_no")));
	
		
		System.out.println("댓글입력" + req.getParameter("update_content"+reply_no));
		
		if(rdao.updateReply(rvo) ==1 ) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/board/BoardViewOk.bo?board_no="+board_no);
		}
		return forward;
	}

}
