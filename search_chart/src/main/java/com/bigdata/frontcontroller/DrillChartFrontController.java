package com.bigdata.frontcontroller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.ActionForward;
import com.bigdata.board.controller.GetCommAction;

@WebServlet("*.ch")
public class DrillChartFrontController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		
		
		switch(requestURI) {
	
			 case "/drilldown_chart/drill.ch":	// 프론트단에서 시작해준다
			// case "index.ch":	// 프론트단에서 시작해준다
				
				GetCommAction getComm = new GetCommAction();
				getComm.execute(req, resp);
				System.out.println("프론트컨트롤러까지");
				break;
				
			
				
				
		}
		
		// 페이지 이동 일괄처리
		if( forward != null ) {
			if( forward.isRedirect() ) {
				// redirect
				resp.sendRedirect(forward.getPath());
			} else {
				// forward
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
		
		
	
		
		
		
		
		
	}
	
}















