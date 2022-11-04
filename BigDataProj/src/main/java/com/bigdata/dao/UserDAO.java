package com.bigdata.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bigdata.mybatis.SqlMapConfig;
import com.bigdata.vo.UserVO;


public class UserDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public UserDAO() {
		sqlSession = factory.openSession(true);
		
	}
//	회원가입
	public boolean join(UserVO uvo) {
		 System.out.println("다오들어옴");
		boolean result = false;
		if(sqlSession.insert("User.join",uvo) != 0) {
			result = true;
		}
		return result;
	}
//	로그인
	public UserVO login(String userid, String userpw) {
		UserVO uvo = sqlSession.selectOne("User.login", userid);
		return uvo;
	}
}
