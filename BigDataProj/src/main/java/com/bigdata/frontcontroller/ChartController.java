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

		ChartDAO cdao = new ChartDAO() ;
		
		String requestURI = req.getRequestURI();

		PrintWriter out = res.getWriter() ;
		
		switch (requestURI) {
		case "/chart/get10SC/BoardList.ch":
			
			JSONObject get10sc = new JSONObject() ;
			
			ArrayList<BubbleChartVO> bcvo = (ArrayList<BubbleChartVO>) cdao.getBoardList() ;
			
			for ( BubbleChartVO item : bcvo ) {
				
				System.out.print( item.getCmc() + " : ");
				System.out.println( item.getCnt() );
				
			}
			
			//out.print( get10sc );
			
			break;
		default:
			break;

		}
	}

}
