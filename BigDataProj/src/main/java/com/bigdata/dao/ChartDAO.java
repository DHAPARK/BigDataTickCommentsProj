package com.bigdata.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bigdata.mybatis.config.SqlMapConfig;
import com.bigdata.vo.BubbleChartVO;

public class ChartDAO {

	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public ChartDAO() {
		sqlsession = factory.openSession(true);
	}

	public List<BubbleChartVO> getBoardList( ) {
		
		List<BubbleChartVO> commentsInfoList = sqlsession.selectList("Chart.get10SC");
	
		return commentsInfoList;

	}
	
}
