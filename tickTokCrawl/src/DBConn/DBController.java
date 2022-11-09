package DBConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBController {
	
	Connection conn = null ;
	
	public DBController() {

		conn = new DBConnection().conn() ;
	
	}
	
	/*
	 * 총괄설명 : updateCommentCnt메서드로 해당 연령대(age_range)에 , 해당 단어(cc)가 존재하는지를 체크해야하니
	 * updateCommentCnt를 먼저 돌리고 , 업데이트가 되었으면 ( 해당 컬럼이 이미 존재해서 +1이 되어서 결론적으로 query의  return값이
	 * 1로 왔다면 ) 거기서 다음단어를 처리하러 떠나고 , 반대로 해당 연령대에 해당 단어가 존재하지않아서 0이 return되었다면 
	 * 해당 연령대에 해당 단어가 DB에 없다는 의미이니 , insertCommentCnt를 실행하여 해당 연령대에 해당 단어를 insert시켜주는 작업을
	 * 실시하는 알고리즘
	 */
	
	
	/*
	 * updateCommentCnt와 insertCommentCnt를 가지고 결론적으로 단어를 저장하는 메서드 storeKeywordInDB( int age_range , String cc )
	 * age_range : 나잇대 ex 20 , 30 , 10
	 * cc : 단어 ex 안녕 , 방가 , 키워드 , 할머니 , 그래..? , 바이!!
	 * 
	 * 결론적으로 storeKeywordInDB는 업데이트가 되었으면 새로 단어가 추가된것이 아니니 0을 리턴하고 , 
	 * 새로 단어가 추가되었으면 1을 리턴하게 되어 , 프론트단에 오늘 새로 마이닝된 단어로 실시간으로 수치로 보여지게된다 
	 */
	public int storeKeywordInDB( int age_range , String cc ) {
		
		return updateCommentCnt( age_range , cc ) ? 0 : insertCommentCnt( age_range, cc ) ; 
		
	}
	
	
	
	/*
	 * update를 성공 , 실패하게되면 어떤값이 return값으로 오는지 궁금한데
	 * cc = commentcontent ( split한 댓글의 내용일부분 ex 안녕 ex 방가 )
	 * 결론 : 해보니 성공하면 update된 컬럼의 숫자 , 실패 (업데이트할 컬럼이 없으니..) 하면 0이 온다
	 * 에러는 안뜬다
	 */								
	public boolean updateCommentCnt( int age_range , String cc ) {
		
		String sql = "update comments set cnt = cnt + 1 where age_range = ? and cmc = ?" ;

		int flag = 0 ;
		
		PreparedStatement pstm = null;
		
		try {
			
			pstm = conn.prepareStatement( sql );
			
			pstm.setInt( 1 , age_range );
			
			pstm.setString( 2 , cc );
			
			flag = pstm.executeUpdate() ;
			
		} catch (SQLException e) { e.printStackTrace(); }
		finally {
			try {
				pstm.close() ;
				} catch (SQLException e) { e.printStackTrace(); }
		}
		
		return flag == 1 ? true : false ;
		
	}
	
	
	/*
	 * insert를 성공 , 실패하게되면 어떤값이 return값으로 오는지 궁금한데
	 * values (seq_comment.nextval , 20 ,'방가' , 0 )
	 * 시퀀스는 기본으로 들어가게 되고 , 현재 긁고있는 연령대 , split한 댓글내용의 일부 , 댓글의 출현빈도수가 들어가게 된다
	 * 댓글의 빈도수는 DB에 존재하지 않는 단어라면 cnt가 default값으로 0 으로 들어가지만 , 팀원의 가독성을 위해 0을 그냥 넣어주었다
	 * 아..한번 언급되었으니 1로 들어가야하는데 ,, DB 설계잘못했네.. 그냥 여기서 1로 주도록 하자..
	 */
	public int insertCommentCnt( int age_range , String cc ) {
		
		String sql = "insert into comments ( cIdx , age_range , cmc , cnt ) values (seq_comment.nextval , ? , ? , 1 )";
		
		int flag = 0 ;
		
		PreparedStatement pstm = null ;
		
		try {
			
			pstm = conn.prepareStatement( sql ) ;
			
			pstm.setInt( 1 , age_range ) ;
			
			pstm.setString( 2 , cc ) ;
			
			flag = pstm.executeUpdate() ;
			
			System.out.println("insert의 return값이 무엇으로 오는지 : " + flag );
			
		} catch (SQLException e) { e.printStackTrace(); }
		finally {
			try {
				pstm.close() ;
				} catch (SQLException e) { e.printStackTrace(); }
		}
		
		return flag ;
		
	}
	
}
