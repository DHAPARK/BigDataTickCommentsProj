package com.bigdata.user.controller;

import java.net.HttpCookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String autoLogin = req.getParameter("autoLogin");
		
		HttpSession session = req.getSession();
		Cookie[] cookies = req.getCookies();
		
		if(udao.login(user_name,loginPw) != null) {
			
			uvo = udao.login(user_name,loginPw);
			
			if(uvo.getUser_pw().equals(loginPw)) {	
				session.setAttribute( "userInfo" , uvo );
				forward.setPath("/index.jsp");
				forward.setRedirect(false);
				
				if(autoLogin.equals("true")) {
					Cookie cookie = new Cookie("loginCookie", session.getId());
					cookie.setPath("/");
	                cookie.setMaxAge(60*60*24*7); 
	                resp.addCookie(cookie);
				}
				
			}else {
				forward.setPath("/index.jsp");
				forward.setRedirect(true);
			}
		}else if(udao.login(user_name,loginPw) == null){
			forward.setPath("/index.jsp");
			forward.setRedirect(true);
		}
		
		return forward;
	}
}		