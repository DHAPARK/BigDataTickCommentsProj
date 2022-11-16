package com.bigdata.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.ActionForward;
import com.bigdata.user.controller.KakaoLoginOkAction;
import com.bigdata.user.controller.KakaoLoginOkAction;
import com.bigdata.user.controller.KakaoLoginOkAction;
import com.bigdata.user.controller.UserJoinEmailOkAction;
import com.bigdata.user.controller.UserJoinNameOkAction;
import com.bigdata.user.controller.UserJoinOkAction;
import com.bigdata.user.controller.UserLoginIdOkAction;
import com.bigdata.user.controller.UserLoginOkAction;
import com.bigdata.user.controller.UserLoginPwOkAction;
import com.bigdata.user.controller.UserLogoutAction;

@WebServlet("*.us")
public class UserFrontController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doprocess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doprocess(req, resp);
	}
	
	protected void doprocess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		
		switch (requestURI) {
		case "/user/UserJoinOk.us": 
			try {forward = new UserJoinOkAction().execute(req, resp);} catch(Exception e) {System.out.println(e); System.out.println("/user/UserJoinOk.us에서 오류");}
	    	break;
		case "/user/UserJoinEmailOk.us": 
			UserJoinEmailOkAction emailOkAction  = new UserJoinEmailOkAction();
			emailOkAction.execute(req, resp);
			break;
		case "/user/UserJoinNameOk.us": 
			UserJoinNameOkAction joinNameOkAction  = new UserJoinNameOkAction();
			joinNameOkAction.execute(req, resp);
			break;
		case "/user/UserLoginIdOk.us": 
			UserLoginIdOkAction loginIdOkAction= new UserLoginIdOkAction();
			loginIdOkAction.execute(req, resp);
			break;
		case "/user/UserLoginPwOk.us": 
			UserLoginPwOkAction loginPwOkAction  = new UserLoginPwOkAction();
			loginPwOkAction.execute(req, resp);
			break;
		case "/user/UserLogin.us":
			forward = new ActionForward(false, "/index.jsp");
			break;
		case "/user/UserLoginOk.us":
			try {forward = new UserLoginOkAction().execute(req, resp);} catch(Exception e) {System.out.println(e); System.out.println("/user/UserLoginOk.us에서 오류");}
	    	break;
		case "/user/UserLogout.us":
			try {forward = new UserLogoutAction().execute(req, resp);} catch(Exception e) {System.out.println(e); System.out.println("/user/UserLogout.us에서 오류");}
			break;
		case "/user/KakaoJoinOk.us":
			try {forward = new KakaoLoginOkAction().execute(req, resp);} catch(Exception e) {System.out.println(e); System.out.println("/user/KakaoLoginOk.us에서 오류");}
			break;
		case "/user/KakaoLoginOk.us":
			try {forward = new KakaoLoginOkAction().execute(req, resp);} catch(Exception e) {System.out.println(e); System.out.println("/user/KakaoLoginOk.us에서 오류");}
			break;
		}
		
//		전송방식
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req ,resp);
			}
		}
	}

}
