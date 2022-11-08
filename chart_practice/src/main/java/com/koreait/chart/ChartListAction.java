package com.koreait.chart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.koreait.chart.dao.ChartDAO;
import com.koreait.chart.dao.ChartDTO;

public class ChartListAction {

	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		ChartDAO cdao = new ChartDAO();
		
		ArrayList<ChartDTO> count = cdao.getChartList();
		
		System.out.println(count);
		
		PrintWriter out = resp.getWriter() ;
		JSONObject jsonobject = new JSONObject() ;
		JSONObject jsondata = new JSONObject() ;
		
		
		JSONArray jsonarray = new JSONArray();
		
		for (int i = 0; i < 10; i++) { 
			jsonobject.put("comments", count.get(i).getComments());
			jsonobject.put("cnt", count.get(i).getCnt());
			jsonarray.add(jsonobject);
		};
		
		jsondata.put("search_word2", jsonarray);
		
		
		System.out.println(jsonobject);
	
		// jsondata.put("오늘", 130) ;
			
		out.println(jsondata);



	}
	}

