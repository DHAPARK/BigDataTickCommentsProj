package com.bigdata.reply.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.ReplyDAO;
import com.bigdata.vo.ReplyVO;

public class ReplyInsertOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward = new ActionForward();
		ReplyDAO rdao = new ReplyDAO();
		ReplyVO rvo = new ReplyVO();
		
		System.out.println("액션 넘어옴");
		
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		
		rvo.setUser_no(Integer.parseInt(req.getParameter("user_no")));
		rvo.setBoard_no(Integer.parseInt(req.getParameter("board_no")));
		rvo.setReply_content(req.getParameter("reply_content"));
		
		System.out.println(req.getParameter("reply_content"));
		
		
		if(rdao.insertReply(rvo) == 1) {
			forward.setPath(req.getContextPath()+"/board/BoardViewOk.bo?board_no="+board_no);
			forward.setRedirect(true);
		}
		return forward;
	}
}
