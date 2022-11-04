package com.bigdata.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.dao.UserDAO;

public class UserLoginIdOkAction {

	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		UserDAO udao = new UserDAO();
		String user_name = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPw");
		int check = 0;
		if(udao.login(user_name,loginPw) != null) {
			check = 1;
			System.out.println("아이디확인");
		}
		
		PrintWriter out = resp.getWriter();
		out.print(check);
	}
}


