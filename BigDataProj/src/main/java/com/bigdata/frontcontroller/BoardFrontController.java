package com.bigdata.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.ActionForward;
import com.bigdata.board.controller.BoardListAction;
import com.bigdata.board.controller.BoardWriteOkAction;
import com.bigdata.user.controller.CheckUsernameOk;
import com.bigdata.user.controller.UserJoinOkAction;
import com.bigdata.user.controller.UserLoginOkAction;
import com.bigdata.user.controller.UserLogoutAction;

public class BoardFrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doprocess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doprocess(req, resp);
	}

	protected void doprocess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;

		switch(requestURI) {
		case "/board/BoardList.bo": 
			try {forward = new BoardListAction().execute(req, resp);} catch(Exception e) {System.out.println(e); System.out.println("/board/BoardList.bo에서 오류");}
	    	break;
		case "/board/BoardWrite.bo":
			forward = new ActionForward(false, "/app/board/boardwrite.jsp");
			break;
		case "/board/BoardWriteOk.bo":
			try {forward = new BoardWriteOkAction().execute(req, resp);} catch (Exception e) {System.out.println(e); System.out.println("/board/BoardWriteOk.bo에서 오류");}		
			break;
		}

//		전송방식
		if (forward != null) {
			if (forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
	}
}
