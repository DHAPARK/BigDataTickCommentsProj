package com.bigdata.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.ActionForward;
import com.bigdata.reply.controller.ReplyDeleteOkAction;
import com.bigdata.reply.controller.ReplyInsertIOkAction;
import com.bigdata.reply.controller.ReplyUpdateOkAction;

@WebServlet("*.rp")
public class ReplyFrontController extends HttpServlet{
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
		
		
		switch (requestURI) {
		case "/board/addReply.rp" : 
			try {forward = new ReplyInsertIOkAction().execute(req, resp);} catch(Exception e) {System.out.println(e); System.out.println("board/addReply.rp에서 오류");}
			break;
		case "/board/deleteReply.rp" : 
			try {forward = new ReplyDeleteOkAction().execute(req, resp);} catch(Exception e) {System.out.println(e); System.out.println("/board/deleteReply.rp에서 오류");}
			break;
		case "/board/updateReply.rp" : 
			try {forward = new ReplyUpdateOkAction().execute(req, resp);} catch(Exception e) {System.out.println(e); System.out.println("/board/updateReply.rp에서 오류");}
			System.out.println("수정액션");
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
