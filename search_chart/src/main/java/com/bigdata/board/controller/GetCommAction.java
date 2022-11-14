package com.bigdata.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.bigdata.dao.DrillChartDAO;
import com.bigdata.vo.DrillChartDTO;

public class GetCommAction {

	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		DrillChartDAO cdao = new DrillChartDAO();
		List<DrillChartDTO> count = cdao.select(req.getParameter("cmc")); // 이곳이 db와 프론트가 만나는 곳 
		// System.out.println(count);
		System.out.println(count);
		PrintWriter out = resp.getWriter();
		
		JSONObject jsondata = new JSONObject();
		JSONArray jsonarray = new JSONArray();
		
		for (int i = 0; i < 5; i++) {
			JSONObject jsonobject = new JSONObject();
			jsonobject.put("cnt", count.get(i).getCnt());
			jsonobject.put("age_range", count.get(i).getAge_range());
			
			jsonarray.add(jsonobject);
			jsondata.put("search_word3", jsonarray);
		};
		out.println(jsondata);
		System.out.println(jsondata);
		}
		
		
		 
		
		

	}

