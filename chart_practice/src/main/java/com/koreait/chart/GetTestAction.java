package com.koreait.chart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.chart.dao.ChartDAO;
import com.koreait.chart.dao.TestDTO;

public class GetTestAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		ChartDAO cdao = new ChartDAO();
		
		ArrayList<TestDTO> cnt = (ArrayList<TestDTO>) cdao.getTestList();

		req.setAttribute("testList", cnt);
		
		forward.setRedirect(false);
		forward.setPath("/bubble_chart/bubble.jsp" );
		
		return forward;
		
		
		
	}
}