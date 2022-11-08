package com.bigdata.frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.bigdata.action.ActionForward;
import com.bigdata.board.controller.BoardListAction;
import com.bigdata.dao.ChartDAO;
import com.bigdata.vo.BubbleChartVO;

/**
 * Servlet implementation class ChartController
 */

public class ChartController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");

		ChartDAO cdao = new ChartDAO();

		String requestURI = req.getRequestURI();

		PrintWriter out = res.getWriter();

		
		
		
		
		switch (requestURI) {

		case "/chart/get10SC/get10SCBubble.ch":

			ArrayList<BubbleChartVO> bcvo10 = (ArrayList<BubbleChartVO>) cdao.get10SCBubble();

			JSONObject obj10 = new JSONObject();

			for ( BubbleChartVO item : bcvo10 ) {
				
				obj10.put( item.getCmc() , item.getCnt() ) ;
				
			}

			out.print( obj10 );

			break;
			
			
		case "/chart/get20SC/get20SCBubble.ch":

			ArrayList<BubbleChartVO> bcvo20 = (ArrayList<BubbleChartVO>) cdao.get20SCBubble();

			JSONObject obj20 = new JSONObject();

			for ( BubbleChartVO item : bcvo20 ) {
				
				obj20.put( item.getCmc() , item.getCnt() ) ;
				
			}

			out.print( obj20 );

			break;

			
		case "/chart/get30SC/get30SCBubble.ch":

			ArrayList<BubbleChartVO> bcvo30 = (ArrayList<BubbleChartVO>) cdao.get30SCBubble();

			JSONObject obj30 = new JSONObject();

			for ( BubbleChartVO item : bcvo30 ) {
				
				obj30.put( item.getCmc() , item.getCnt() ) ;
				
			}

			out.print( obj30 );

			break;

			
		case "/chart/get40SC/get40SCBubble.ch":

			ArrayList<BubbleChartVO> bcvo40 = (ArrayList<BubbleChartVO>) cdao.get40SCBubble();

			JSONObject obj40 = new JSONObject();

			for ( BubbleChartVO item : bcvo40 ) {
				
				obj40.put( item.getCmc() , item.getCnt() ) ;
				
			}

			out.print( obj40 );

			break;

			
		case "/chart/get50SC/get50SCBubble.ch":

			ArrayList<BubbleChartVO> bcvo50 = (ArrayList<BubbleChartVO>) cdao.get50SCBubble();

			JSONObject obj50 = new JSONObject();

			for ( BubbleChartVO item : bcvo50 ) {
				
				obj50.put( item.getCmc() , item.getCnt() ) ;
				
			}

			out.print( obj50 );

			break;

		default:
			
			break;

		}
	}

}
