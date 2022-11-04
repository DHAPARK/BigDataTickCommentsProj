package com.bigdata.web.servlet.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.xml.crypto.dsig.spec.XPathType.Filter;

@WebFilter("*.us")  //프론트 컨트롤러의 갯수만큼 생성한다.
public class CharacterEncodingFilter2 implements  javax.servlet.Filter{

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		
		arg1.setCharacterEncoding("UTF-8");	
		arg1.setContentType("text/html ; charset = UTF-8");
		arg0.setCharacterEncoding("UTF-8");
		arg2.doFilter(arg0, arg1);

	}

}
