package com.bigdata.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.UserDAO;

public class BoardListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		req.setAttribute("name",udao.name());
		forward.setPath("/bigdata/boardlist.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
