package com.koreait.chart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.chart.dao.ChartDAO;

public class ChartCntAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		ChartDAO cdao = new ChartDAO();
		
		int cnt = cdao.getChartCnt();

		req.setAttribute("cnt", cnt);
		
		forward.setRedirect(false);
		forward.setPath("/bubble_chart/bubble.jsp" );
		
		return forward;
	}

}












