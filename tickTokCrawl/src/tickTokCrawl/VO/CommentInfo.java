package tickTokCrawl.VO;

import java.util.ArrayList;

//댓글과 관련된 정보들 VO객체
public class CommentInfo {
	//쓸일이 있을까 하는데 ... 댓글 리스트를 저장할 ArrayList 
	private ArrayList<String> CommentInfoList = null ;
	
	//댓글 작성자의 ID
	private String ID ;
	//댓글 작성자의 댓글 내용
	private String Comment ;
	//해당 댓글이 받은 좋아요 수
	private String FavCnt ;
	
	public String getID() {
		
		return this.ID ;
		
	}
	
	public String getComment() {
		
		return this.Comment ;
		
	}
	
	public String getFavCnt() {
		
		return this.FavCnt ;
		
	}
	
	public void setID( String ID ) {
		
		this.ID = ID ;
		
	}
	
	public void setDay( String Comment ) {
		
		this.Comment = Comment ;
		
	}
	
	public void setFavCnt( String FavCnt ) {
		
		this.FavCnt = FavCnt ;
		
	}
	
}
