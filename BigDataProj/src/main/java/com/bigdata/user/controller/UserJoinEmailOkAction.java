package com.bigdata.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.UserDAO;

public class UserJoinEmailOkAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		UserDAO duao = new UserDAO();
		String user_email = req.getParameter("user_email");
		
		PrintWriter out = resp.getWriter();
		out.print(duao.emailCheck(user_email));
	}
}

