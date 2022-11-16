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
		
		uvo.setUser_name(req.getParameter("user_name"));
		uvo.setUser_email(req.getParameter("user_email"));
		uvo.setUser_pw(req.getParameter("user_pw"));
		uvo.setBirth_year(req.getParameter("birth_year"));
		uvo.setAge_range(0);
		uvo.setUser_status(0);
		uvo.setKakao_id("");
		
		if(udao.join(uvo)) {
			forward.setRedirect(true);
			forward.setPath("/index.jsp");
		}else {
			
		}
		
		return forward;
	}
}	