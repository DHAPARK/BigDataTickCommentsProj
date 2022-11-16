package com.bigdata.frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.bigdata.action.ActionForward;
import com.bigdata.chart.controller.GetCommAction;
import com.bigdata.dao.ChartDAO;
import com.bigdata.vo.BubbleChartVO;
import com.bigdata.vo.CloudChartVO;
import com.bigdata.vo.HardChartVO;

/**
 * Servlet implementation class ChartController
 */

public class ChartController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");

		ChartDAO cdao = new ChartDAO();

		String requestURI = req.getRequestURI();

		PrintWriter out = res.getWriter();
		
		ActionForward forward = null;

		switch (requestURI) {
		// 버블차트
		case "/chart/get10SC/get10SCBubble.ch":

			ArrayList<BubbleChartVO> bcvo10 = (ArrayList<BubbleChartVO>) cdao.get10SCBubble();
			JSONObject bobj10 = new JSONObject();

			for (BubbleChartVO item : bcvo10) {

				bobj10.put(item.getCmc(), item.getCnt());

			}

			out.print( bobj10 );

			break;

		case "/chart/get20SC/get20SCBubble.ch":

			ArrayList<BubbleChartVO> bcvo20 = (ArrayList<BubbleChartVO>) cdao.get20SCBubble();

			JSONObject bobj20 = new JSONObject();
			for (BubbleChartVO item : bcvo20) {

				bobj20.put(item.getCmc(), item.getCnt());

			}

			out.print( bobj20 );

			break;

		case "/chart/get30SC/get30SCBubble.ch":

			ArrayList<BubbleChartVO> bcvo30 = (ArrayList<BubbleChartVO>) cdao.get30SCBubble();
			JSONObject bobj30 = new JSONObject();

			for (BubbleChartVO item : bcvo30) {

				bobj30.put(item.getCmc(), item.getCnt());

			}

			out.print(bobj30);

			break;

		case "/chart/get40SC/get40SCBubble.ch":

			ArrayList<BubbleChartVO> bcvo40 = (ArrayList<BubbleChartVO>) cdao.get40SCBubble();
			JSONObject bobj40 = new JSONObject();

			for (BubbleChartVO item : bcvo40) {

				bobj40.put(item.getCmc(), item.getCnt());

			}

			out.print(bobj40);

			break;

		case "/chart/get50SC/get50SCBubble.ch":

			ArrayList<BubbleChartVO> bcvo50 = (ArrayList<BubbleChartVO>) cdao.get50SCBubble();
			JSONObject bobj50 = new JSONObject();

			for (BubbleChartVO item : bcvo50) {

				bobj50.put(item.getCmc(), item.getCnt());

			}

			out.print(bobj50);

			break;

		// 버블차트

		// 하드차트
		case "/chart/get10SC/get10SCHard.ch":

			ArrayList<HardChartVO> hdvo10 = (ArrayList<HardChartVO>) cdao.get10SCHard();

			JSONObject hobj10 = new JSONObject();

			for (HardChartVO item : hdvo10) {

				hobj10.put(item.getCmc(), item.getCnt());

			}

			out.print(hobj10);

			break;

		case "/chart/get20SC/get20SCHard.ch":

			ArrayList<HardChartVO> hdvo20 = (ArrayList<HardChartVO>) cdao.get20SCHard();

			JSONObject hobj20 = new JSONObject();

			for (HardChartVO item : hdvo20) {

				hobj20.put(item.getCmc(), item.getCnt());

			}

			out.print(hobj20);

			break;

		case "/chart/get30SC/get30SCHard.ch":

			ArrayList<HardChartVO> hdvo30 = (ArrayList<HardChartVO>) cdao.get30SCHard();

			JSONObject hobj30 = new JSONObject();

			for (HardChartVO item : hdvo30) {

				hobj30.put(item.getCmc(), item.getCnt());

			}

			out.print(hobj30);

			break;

		case "/chart/get40SC/get40SCHard.ch":

			ArrayList<HardChartVO> hdvo40 = (ArrayList<HardChartVO>) cdao.get40SCHard();

			JSONObject hobj40 = new JSONObject();

			for (HardChartVO item : hdvo40) {

				hobj40.put(item.getCmc(), item.getCnt());

			}

			out.print(hobj40);

			break;

		case "/chart/get50SC/get50SCHard.ch":

			ArrayList<HardChartVO> hdvo50 = (ArrayList<HardChartVO>) cdao.get50SCHard();

			JSONObject hobj50 = new JSONObject();

			for (HardChartVO item : hdvo50) {

				hobj50.put(item.getCmc(), item.getCnt());

			}

			out.print(hobj50);

			break;
			
		// 하드차트
			
		// 클라우드 차트
		
		case "/chart/Top40.ch":
			
			List<CloudChartVO> cnt = cdao.getTop40();
			
			List<CloudChartVO> top40 = new ArrayList<>(cnt.subList(0, 40));
		
			String result = "";
			
			for(int i = 0; i < 40; i++) {
				
				result += top40.get(i).getCmc()+",";
			
			}
			
			out.print( result );
			
			break;
			
		case "/chart/Top10.ch":
			
			List<CloudChartVO> rank = cdao.getTop10();
			
			List<CloudChartVO> top10 = new ArrayList<>(rank.subList(0, 10));
		
			String str = "";
			
			for(int i = 0; i < 10; i++) {
				
				str += top10.get(i).getCmc()+",";
			
			}
			
			out.print( str );
			
			break;
			
		case "/chart/Top10Cnt.ch":
			
			List<CloudChartVO> cnt10 = cdao.getTop10Cnt();
			
			List<CloudChartVO> top10cnt = new ArrayList<>(cnt10.subList(0, 10));
		
			String tt = "";
			
			for(int i = 0; i < 10; i++) {
				
				tt += top10cnt.get(i).getCnt() +",";
			
			}
			
			out.print( tt );
			
			break;
			
		 case "/drilldown_chart/drill.ch":	// 프론트단에서 시작해준다
				// case "index.ch":	// 프론트단에서 시작해준다
					
					System.out.println("프론트컨트롤러까지");
					GetCommAction getComm = new GetCommAction();
					getComm.execute(req, res);
					break;	
			
			
			
			
		// 클라우드 차트

		default:

			break;

		}
	}
}
