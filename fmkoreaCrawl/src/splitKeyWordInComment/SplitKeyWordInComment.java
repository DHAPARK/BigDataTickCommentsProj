package splitKeyWordInComment;

import java.util.ArrayList;

import org.openqa.selenium.WebElement;

import DBConn.DBController;

/*
 * 들어오는 하나하나의 단어들을 짤라서 DB에 저장하는 메서드를 만들기 위한 Class
 * 얼마만큼의 Keyword가 저장이 되었는지 실시간 파악을 위한 변수 howManyKeyWordStored
 * age_range : 연령대 , cc : 댓글에서 잘라온 키워드
 */

public class SplitKeyWordInComment {

	DBController dbc = null;

	int howManyKeyWordStored = 0;

	public SplitKeyWordInComment() {

		dbc = new DBController();

	}

	/*
	 * SKWIC : SplitKeyWordInComment
	 * 한 사이클 ( 한 페이지에서 댓글을 읽어올때마다 저장을 해야함으로 "댓글을 Keyword로 잘라야한다" )
	 * 댓글을 split하여 각각의 짧은 하나의 단어들로 ArrayList에 죄다 저장하는 메서드이다
	 */
	public ArrayList<String> SplitKWIC( ArrayList<WebElement> commentsList ) {

		ArrayList<String> keyWordList = new ArrayList<String>() ;
		
		for ( WebElement item : commentsList ) {
			
			for ( String keyword : item.getText().split(" ") ) {
				
				keyWordList.add( keyword ) ;
				
			}
			
		}
		
		return keyWordList ;
		
	}

	/*
	 * StoreSplitedKWIC : StoreSplitedKeyWordInComment
	 * commentsList : Controller에서 모아서 SplitKWIC( ArrayList<WebElement> commentsList )
	 * 에서 분류하고 가공한 단어들을 ArrayList에 전부 담아온 변수이다. 
	 * ex) [ "안녕.." , "잘가..!" , "임영" , "웅" , "바이!!" ... ] 
	 * 그걸가지고 DB에 저장을 하는 메서드인 dbc.storeKeywordInDB(age_range, cc)를 돌려 저장하며 ,
	 * 실시간으로 저장한 데이터를 집계한다
	 */
	public void StoreSplitedKWIC(int age_range, ArrayList<String> commentsList ) {

		for ( String cc : commentsList ) {
			
			this.howManyKeyWordStored += this.dbc.storeKeywordInDB(age_range, cc);
		
			System.out.println(String.format(" 연령대 : %d , 실시간 저장댓글갯수 : %d ", age_range, this.howManyKeyWordStored));
			
		}
		
	}

}
