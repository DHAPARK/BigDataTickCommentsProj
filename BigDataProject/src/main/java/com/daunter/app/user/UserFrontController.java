package com.daunter.app.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daunter.action.ActionForward;

public class UserFrontController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		
		ActionForward forward = null;
		
		switch(requestURI) {
		case "/user/CheckUsernameOk.us": 
			try {forward = new CheckUsernameOk().execute(req, resp);} catch(Exception e) {System.out.println(e); System.out.println("/user/CheckUsernameOk.us에서 오류");}
	    	break;
		case "/user/UserJoinOk.us": 
			try {forward = new UserJoinOk().execute(req, resp);} catch(Exception e) {System.out.println(e); System.out.println("/user/UserJoinOk.us에서 오류");}
	    	break;
		case "/user/UserLogin.us":
	        forward = new ActionForward(false, "/app/user/login.jsp");
	        break;
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
}