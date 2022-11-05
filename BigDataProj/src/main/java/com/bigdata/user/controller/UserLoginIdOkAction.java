package com.bigdata.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.dao.UserDAO;

public class UserLoginIdOkAction {

	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		UserDAO udao = new UserDAO();
		String user_name = req.getParameter("loginId");
		String pattern = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		Pattern p = Pattern.compile(pattern);
		Matcher m = p.matcher(user_name);
		int check = 0;
		if(m.matches()) {
			String user_email = user_name;
			check = udao.emailCheck(user_name);
			 System.out.println("이메일 입력");
		}else {
			check= udao.nameCheck(user_name);
			 System.out.println("이름 입력");
		}
		
		PrintWriter out = resp.getWriter();
		out.print(check);
	}
}


