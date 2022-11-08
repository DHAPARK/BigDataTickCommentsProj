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

	public List<BubbleChartVO> get10SCBubble() {

		List<BubbleChartVO> commentsInfoList = sqlsession.selectList("Chart.get10SCBubble");

		return commentsInfoList;

	}

	public List<BubbleChartVO> get20SCBubble() {

		List<BubbleChartVO> commentsInfoList = sqlsession.selectList("Chart.get20SCBubble");

		return commentsInfoList;

	}

	public List<BubbleChartVO> get30SCBubble() {

		List<BubbleChartVO> commentsInfoList = sqlsession.selectList("Chart.get30SCBubble");

		return commentsInfoList;

	}

	public List<BubbleChartVO> get40SCBubble() {

		List<BubbleChartVO> commentsInfoList = sqlsession.selectList("Chart.get40SCBubble");

		return commentsInfoList;

	}

	public List<BubbleChartVO> get50SCBubble() {

		List<BubbleChartVO> commentsInfoList = sqlsession.selectList("Chart.get50SCBubble");

		return commentsInfoList;

	}
}
