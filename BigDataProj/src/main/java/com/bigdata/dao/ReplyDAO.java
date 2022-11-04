package com.bigdata.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bigdata.mybatis.SqlMapConfig;


public class ReplyDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public ReplyDAO() {
		sqlSession = factory.openSession(true);
		
	}
}
