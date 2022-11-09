package com.koreait.chart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.koreait.action.ActionForward;
import com.koreait.chart.dao.ChartDAO;
import com.koreait.chart.dao.TestDTO;

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
		
				
			case "/bubble_chart/bubble1.ch":
				ChartListAction chartlistaction = new ChartListAction();
				chartlistaction.execute(req, resp);
				break;
				
			case "/bubble_chart/bubble_test.ch":
				System.out.println("들어오긴하는건지");
				ChartDAO cdao = new ChartDAO();
				
				System.out.println("들어오긴 하는건지..");
				
				ArrayList<TestDTO> cnt = (ArrayList<TestDTO>) cdao.getTestList();
				
				String result = "";
				
				for ( TestDTO item : cnt ) {
					
					result += item.getCmc() + " : " ;
					result += item.getCnt() + "\n" ;
					
				}
				
				
				PrintWriter out = resp.getWriter() ;
				out.print( result );
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















