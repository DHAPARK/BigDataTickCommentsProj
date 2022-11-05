package com.bigdata.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.dao.UserDAO;
import com.bigdata.vo.UserVO;


public class UserLoginPwOkAction {

	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		UserDAO udao = new UserDAO();
		UserVO uvo = new UserVO();
		
		String user_name = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPw");
		int check = 0;
		if(udao.login(user_name,loginPw)!= null) {
			uvo = udao.login(user_name,loginPw);
			if(uvo.getUser_pw().equals(loginPw)) {
				check = 1;
			}else {
				check = 0;
			}
		}
		PrintWriter out = resp.getWriter();
		out.print(check);
	}
}
