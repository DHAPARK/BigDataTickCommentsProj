package com.bigdata.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bigdata.mybatis.SqlMapConfig;


public class UserDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public UserDAO() {
		sqlSession = factory.openSession(true);
		
	}
	
	public String name() {
		return sqlSession.selectOne("User.name");
		
	}
}
