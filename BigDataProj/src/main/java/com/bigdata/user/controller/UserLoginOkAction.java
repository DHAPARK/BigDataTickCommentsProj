package com.bigdata.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.UserDAO;
import com.bigdata.vo.UserVO;

public class UserLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		UserVO uvo = new UserVO();
		String user_name = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPw");
		uvo = udao.login(user_name,loginPw);
		System.out.println("액션 넘어오는지 확인");
		System.out.println("아이디 : " + user_name);
		System.out.println("비밀번호 : " +loginPw);
		
		req.setAttribute("user", uvo);
		forward.setPath("/index.jsp");
		forward.setRedirect(true);
		
		return forward;
	}
}