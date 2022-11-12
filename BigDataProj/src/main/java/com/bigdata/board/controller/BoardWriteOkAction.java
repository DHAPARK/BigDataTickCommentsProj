package com.bigdata.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bigdata.action.Action;
import com.bigdata.action.ActionForward;
import com.bigdata.dao.BoardDAO;
import com.bigdata.vo.BoardVO;
import com.bigdata.vo.FileVO;

public class BoardWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		ActionForward forward = new ActionForward();

		BoardDAO bdao = new BoardDAO();
		BoardVO bvo = new BoardVO();
		FileVO fvo = new FileVO();
		
		bvo.setBoard_title(req.getParameter("board_title"));
		bvo.setBoard_content(req.getParameter("board_content"));
		bvo.setUser_name(req.getParameter("user_name"));
		bvo.setAge_range(req.getParameter("age_range"));
		// board_content에서 이미지 태그 배열 가져오기
		String board_content = req.getParameter("board_content");
		
		String[] imgNameArr = req.getParameterValues("이행의데이터를전송시보드넘을박습니다");
		// for문출력
		
		bdao.insertBoard(bvo);
		if (imgNameArr!= null) {
			for (int i = 0; i < imgNameArr.length; i++) {
				// 작성중에 취소된 이미지도 들어간다 차후 대안을 찾아야한다. 현재로써는 모르겠다.
				bdao.updateFile_no(bdao.getSeq(), imgNameArr[i]);
			}
		}
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/board/BoardList.bo?ageRange=" + req.getParameter("age_range"));
		
		return forward;
	}

}
