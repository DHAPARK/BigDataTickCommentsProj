package com.bigdata.dao;

import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bigdata.mybatis.config.SqlMapConfig;
import com.bigdata.vo.UserVO;

public class UserDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public UserDAO() {
		sqlSession = factory.openSession(true);
		
	}
//	회원가입
	public boolean join(UserVO uvo) {
		boolean result = false;
		if(sqlSession.insert("User.join",uvo) != 0) {
			result = true;
		}
		return result;
	}

//  이메일 중복확인
	public int emailCheck(String user_email) {
		return sqlSession.selectOne("User.emailCheck",user_email);
	}
// 	이름 중복확인
	public int nameCheck(String user_name) {
		return sqlSession.selectOne("User.nameCheck",user_name);
	}
//	로그인
	public UserVO login(String user_name,String loginPw) {
		UserVO uvo = new UserVO();
		String pattern = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		Pattern p = Pattern.compile(pattern);
		Matcher m = p.matcher(user_name);
		if(m.matches()) {
			String user_email = user_name;
			 uvo = sqlSession.selectOne("User.loginEmail", user_email);
			 sqlSession.update("User.birthYearToAge", uvo);
			 System.out.println("뭐나오려나.. " + uvo.getAge_range());
			 System.out.println("이메일 입력");
		}else {
			 uvo = sqlSession.selectOne("User.loginName", user_name);
			 sqlSession.update("User.birthYearToAge", uvo);
			 System.out.println("뭐나오려나.. " + uvo.getAge_range());
			 System.out.println("이름 입력");
		}
		return uvo;
	}
	
	public UserVO checkKakaoId(String kakao_id) {
		return sqlSession.selectOne("User.checkKakaoId", kakao_id);
	}
	
	public boolean kakaoLogin(String kakao_id, String user_email) {
		HashMap<String, String> map = new HashMap<>();
		map.put("kakao_id", kakao_id);
		map.put("user_email", user_email);
		
		return (Integer)sqlSession.selectOne("User.kakaoLogin", map) == 1;
	}
}



