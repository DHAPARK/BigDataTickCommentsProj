package com.bigdata.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.UserDAO;
import com.bigdata.vo.UserVO;

public class UserJoinOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		UserVO uvo = new UserVO();
		System.out.println("액션들어옴");
		
		uvo.setUser_name(req.getParameter("user_name"));
		uvo.setUser_email(req.getParameter("user_email"));
		uvo.setUser_pw(req.getParameter("user_pw"));
		uvo.setBirth_year(req.getParameter("birth_year"));
		
		
		if(udao.join(uvo)) {
			forward.setRedirect(true);
			forward.setPath("/index.jsp");
		}else {
			
		}
		
		return forward;
	}
}	