package com.bigdata.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bigdata.mybatis.config.SqlMapConfig;
import com.bigdata.vo.BubbleChartVO;
import com.bigdata.vo.CloudChartVO;
import com.bigdata.vo.HardChartVO;

public class ChartDAO {

	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;

	public ChartDAO() {
		sqlsession = factory.openSession(true);
	}

	// 버블차트
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

	// 버블차트

	// 하드차트
	public List<HardChartVO> get10SCHard() {

		List<HardChartVO> commentsInfoList = sqlsession.selectList("Chart.get10SCHard");

		return commentsInfoList;

	}

	public List<HardChartVO> get20SCHard() {

		List<HardChartVO> commentsInfoList = sqlsession.selectList("Chart.get20SCHard");

		return commentsInfoList;

	}

	public List<HardChartVO> get30SCHard() {

		List<HardChartVO> commentsInfoList = sqlsession.selectList("Chart.get30SCHard");

		return commentsInfoList;

	}

	public List<HardChartVO> get40SCHard() {

		List<HardChartVO> commentsInfoList = sqlsession.selectList("Chart.get40SCHard");

		return commentsInfoList;

	}

	public List<HardChartVO> get50SCHard() {

		List<HardChartVO> commentsInfoList = sqlsession.selectList("Chart.get50SCHard");

		return commentsInfoList;

	}

	// 하드차트
	
	
	// 클라우드 차트
	
	public List<CloudChartVO> getTop40() {
		return sqlsession.selectList("Chart.getTop40");
	}
	
	public List<CloudChartVO> getTop10() {
		return sqlsession.selectList("Chart.getTop10");
	}
	
	public List<CloudChartVO> getTop10Cnt() {
		return sqlsession.selectList("Chart.getTop10Cnt");
	}
	
	// 클라우드 차트
}
