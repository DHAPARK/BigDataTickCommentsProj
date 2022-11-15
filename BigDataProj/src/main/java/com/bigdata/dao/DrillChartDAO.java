package com.bigdata.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bigdata.mybatis.config.SqlMapConfig;
import com.bigdata.vo.DrillChartDTO;

public class DrillChartDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public DrillChartDAO() {
		sqlsession = factory.openSession(true);
	}

	public List<DrillChartDTO> select(String cmc) {
		System.out.println("다오들어옴");
		List<DrillChartDTO> pass = new ArrayList<>();
		
		pass = sqlsession.selectList("Chart2.getcomm", cmc);
		System.out.println("xml실행완료");
		System.out.println(pass);
		return pass;
		
	
		
	}

	
	

	
	
	
}

