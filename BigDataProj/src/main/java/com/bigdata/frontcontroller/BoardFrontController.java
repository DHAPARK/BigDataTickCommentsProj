package com.bigdata.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata.action.ActionForward;
import com.bigdata.board.controller.BoardEditAction;
import com.bigdata.board.controller.BoardEditOkAction;
import com.bigdata.board.controller.BoardListAction;
import com.bigdata.board.controller.BoardViewOkAction;
import com.bigdata.board.controller.BoardWriteOkAction;
import com.bigdata.board.controller.DeletePostOkAction;
import com.bigdata.board.controller.IMGUploadAction;

public class BoardFrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String requestURI = req.getRequestURI();
		ActionForward forward = null;

		switch(requestURI) {
		case "/board/BoardList.bo":
			try {forward = new BoardListAction().execute(req, resp);} catch(Exception e) {System.out.println(e); System.out.println("/board/BoardList.bo에서 오류");}
	    	break;
		case "/board/BoardWrite.bo":
			forward = new ActionForward(false, "/app/board/boardwrite.jsp");
			break;
		case "/board/BoardWriteOk.bo":
			try {forward = new BoardWriteOkAction().execute(req, resp);} catch (Exception e) {System.out.println(e); System.out.println("/board/BoardWriteOk.bo에서 오류");}		
			break;
		case "/board/BoardViewOk.bo":
			try {forward = new BoardViewOkAction().execute(req, resp);} catch (Exception e) {System.out.println(e); System.out.println("/board/BoardViewOk.bo에서 오류");}		
			break;
		case "/board/BoardEdit.bo":
			try {forward = new BoardEditAction().execute(req, resp);} catch (Exception e) {System.out.println(e); System.out.println("/board/BoardEdit.bo에서 오류");}		
			break;
		case "/board/BoardEditOk.bo":
			try {forward = new BoardEditOkAction().execute(req, resp);} catch (Exception e) {System.out.println(e); System.out.println("/board/BoardEditOk.bo에서 오류");}		
			break;
		case "/board/DeletePostOk.bo":
			try {forward = new DeletePostOkAction().execute(req, resp);} catch (Exception e) {System.out.println(e); System.out.println("/board/DeletePostOk.bo에서 오류");}		
			break;
		case "/board/IMGUpload.bo":
			IMGUploadAction imgUploadAction = new IMGUploadAction();
			imgUploadAction.execute(req, resp);
			break;
		}

//		전송방식
		if (forward != null) {
			if (forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
	}
}
