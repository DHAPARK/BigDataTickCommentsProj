package com.bigdata.user.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.UserDAO;
import com.bigdata.vo.UserVO;

public class KakaoLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		UserVO user = new UserVO();
		HttpSession session = req.getSession();
		
		String age_range = req.getParameter("age_range");
		String email = req.getParameter("email");
		String id = req.getParameter("kakao_id");
		
		System.out.println("연령대 " + age_range);
		System.out.println("이메일ㄹㄹㄹㄹㄹㄹㄹ " + email);
		String kakao_id = email.split("@")[0];
		
		System.out.println("유저네임 " + kakao_id);
		
		int age = Integer.parseInt(age_range.split("~")[0]);
		
		System.out.println("age 뭐가 들어오길래 ???? " + age);
		System.out.println("id 뭐들어옴????? " + id);
		
		
		if (udao.checkKakaoId(id) == false) {
			
			System.out.println("회원가입 들어옴 ㅇㅇㅇㅇㅇㅇ");
			
			user.setUser_name(kakao_id);
			user.setUser_pw("1234"); 
			user.setBirth_year("");
			user.setAge_range(age);
			user.setUser_email(email);
			user.setUser_status(1);
			user.setKakao_id(id);
			
			session.invalidate();
			
			if(udao.join(user)) {
				forward.setRedirect(true);
				forward.setPath(req.getContextPath() + "/index.jsp");
			}else {
				
				forward.setPath("/index.jsp?login=false");
				
				PrintWriter out = resp.getWriter();
				resp.setContentType("text/html;charset=UTF-8");
				out.println("<script>");
				out.println("alert('회원가입 실패. 잠시 후 다시 시도해주세요.');");
				out.println("</script>");
				out.close();
				
			}			
			
		} else if (udao.checkKakaoId(id) == true) {
			
//			if (udao.kakaoLogin(id, email)) {
				
				user = udao.kakaoInfo(id);
				
				System.out.println("로그인 성공");
				session.setAttribute( "kakaoInfo" , user );
				
				forward.setPath(req.getContextPath() + "/index.jsp");
				

//			} 
			
		}
		
		forward.setRedirect(false);
		return forward;
	}
}
