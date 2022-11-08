package com.bigdata.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bigdata.mybatis.config.SqlMapConfig;
import com.bigdata.vo.ReplyVO;


public class ReplyDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public ReplyDAO() {
		sqlSession = factory.openSession(true);
		
	}
	
	public List<ReplyVO> getReply(int board_no) {
		return sqlSession.selectList("Reply.reply", board_no);
	}

	public int insertReply(ReplyVO rvo) {
		return sqlSession.insert("Reply.setReply", rvo);
	}

	public int deletReply(int reply_no) {
		return sqlSession.delete("Reply.delete", reply_no);
	}
	public int updateReply(ReplyVO rvo) {
		return sqlSession.update("Reply.update", rvo);
	}
}
