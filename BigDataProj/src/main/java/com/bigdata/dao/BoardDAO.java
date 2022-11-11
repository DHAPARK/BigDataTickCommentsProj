package com.bigdata.dao;

import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bigdata.mybatis.config.SqlMapConfig;
import com.bigdata.vo.BoardVO;
import com.bigdata.vo.FileVO;


public class BoardDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public BoardDAO() {
		sqlsession = factory.openSession(true);
	}

	public List<BoardVO> getBoardList(int startRow, int endRow , int ageRange ) {
		HashMap<String, Integer> pageMap = new HashMap<>();
		
		pageMap.put( "ageRange" , ageRange );
		
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		
		List<BoardVO> boardList = sqlsession.selectList("Board.getBoardList", pageMap);
		return boardList;
	}

	public List<BoardVO> getList(int startRow, int endRow , int ageRange ) {
		HashMap<String, Integer> pageMap = new HashMap<>();
		
		pageMap.put( "ageRange" , ageRange );

		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		
		List<BoardVO> boardList = sqlsession.selectList("Board.getList", pageMap);
		return boardList;
	}
	
	public int getBoardCnt() {
		return sqlsession.selectOne("Board.getBoardCnt");
	}
	
	//게시글 추가
	public void insertBoard(BoardVO board) {
		
//		board.setAge_range(  board.getAge_range() == null ? "임시" : board.getAge_range() );	
		System.out.println(board.getAge_range());
		
		sqlsession.insert("Board.insertBoard", board);
	}
	
	public BoardVO getDetail(int board_no) {
		return sqlsession.selectOne("Board.getDetail", board_no);
	}
	
	public void updateBoard(BoardVO board) {
		sqlsession.update("Board.updateBoard", board);
	}
	
	public void deletePost(int board_no) {
		sqlsession.delete("Board.deletePost", board_no);
	}
	
	public int getEachAgeBoardCnt(  int ageRange  ) {
		HashMap<String, Integer> pageMap = new HashMap<>();
		
		pageMap.put( "ageRange" , ageRange );
		
		return sqlsession.selectOne("Board.getEachAgeBoardCnt",pageMap);
		
	}

	public boolean insertFile(FileVO filevo) {
		boolean result = false;

		if (sqlsession.insert("File.insertFile", filevo) == 1) {
			result = true;
		}

		return result;
	}
	
	public void updateFile_no(int board_no, String file_name) {
		FileVO fvo = new FileVO();
		fvo.setBoard_no(board_no);
		fvo.setFile_name(file_name);
		sqlsession.update("File.updateBoardno",fvo);
		System.out.println(board_no);
		System.out.println(file_name);
	}
	
	public int getSeq() {
		return sqlsession.selectOne("Board.getSeq");
	}

}
