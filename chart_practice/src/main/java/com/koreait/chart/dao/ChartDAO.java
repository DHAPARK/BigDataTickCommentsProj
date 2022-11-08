package com.koreait.chart.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.chart.mybatis.SqlMapConfig;

public class ChartDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public ChartDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public int getChartCnt() {
		return sqlsession.selectOne("Chart.getChartCnt");	
				
	}

	public List<ChartDTO> getChartList() {
		return sqlsession.selectList("Chart.getChartList");
	}

	public List<TestDTO> getTestList() {
		return sqlsession.selectList("Chart.getTest");
	}
	
	
	
	

}
