package com.bigdata.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.dao.UserDAO;

public class UserJoinNameOkAction {

	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		UserDAO duao = new UserDAO();
		String user_name = req.getParameter("user_name");
		
		PrintWriter out = resp.getWriter();
		out.print(duao.emailCheck(user_name));
	}

}
