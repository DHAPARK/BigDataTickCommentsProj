package com.koreait.chart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.koreait.action.ActionForward;

@WebServlet("*.ch")
public class ChartFrontController extends HttpServlet{
	
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
			case "/bubble_chart/bubble.ch": 
				forward = new ChartCntAction().execute(req, resp);
				break;
				
			case "/bubble_chart/bubble1.ch":
				ChartListAction chartlistaction = new ChartListAction();
				chartlistaction.execute(req, resp);
				break;
				
			case "/bubble_chart/bubble_test.ch":
				forward = new GetTestAction().execute(req, resp);
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














