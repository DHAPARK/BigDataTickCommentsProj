package com.daunter.app.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.daunter.app.user.vo.UserVO;
import com.daunter.mybatis.config.SqlMapConfig;

public class UserDAO {
	SqlSessionFactory factory = SqlMapConfig.getSqlMapInterface();
	SqlSession sqlsession;
	
	public UserDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public boolean login(String user_name, String user_pw) {
		HashMap<String, String> map = new HashMap<>();
		map.put("user_name", user_name);
		map.put("user_pw", user_pw);
		return (Integer)sqlsession.selectOne("User.login", map) == 1;
	}
	
	public void join(UserVO user) {
		sqlsession.insert("User.join", user);
	}
	
	//아이디 검사
	public boolean checkUsername(String user_name) {
		return (Integer)sqlsession.selectOne("User.checkUsername", user_name) == 1;
	}
}