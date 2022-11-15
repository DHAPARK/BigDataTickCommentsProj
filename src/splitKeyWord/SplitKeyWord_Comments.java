package splitKeyWord;

import java.util.ArrayList;

import org.openqa.selenium.WebElement;

import DBConn.DBConnection;
import DBConn.DBController;

public class SplitKeyWord_Comments {

	DBController dbc;

	// db 에 저장되는 횟수
	int cnt_KeywordStored = 0;

	public SplitKeyWord_Comments() {

		dbc = new DBController();

	}

	/*
	 * SplitKeyWord ( <Webelement> 댓글 ) 댓글에 담겨진 갯수 만큼 반복실행 for ( WebElement item :
	 * comments ) 모든 댓글의 빈칸 ' ' 제거 KeyWordlist List 에 담는다
	 * 
	 */

	public ArrayList<String> SplitKeyWord_(ArrayList<WebElement> comments) {

		ArrayList<String> KeyWordList = new ArrayList<String>();

		for (WebElement item : comments) {
			for (String keyword : item.getText().split(" ")) {
				if (keyword.length() < 2) {
					continue;
				} else {
					KeyWordList.add(keyword);

				}

			}
		}

		return KeyWordList;

	}

	/*
	 * 10 ~ 50 연령별 검색 에 따른 comments 값을 구분하여 DB에 전달하기
	 */
	public void StoreSplitedKeyWord(int age_range, ArrayList<String> commentsList) {

		for (String cc : commentsList) {

			this.cnt_KeywordStored += this.dbc.storeKeywordInDB(age_range, cc);
			System.out.println(String.format(" 연령대 : %d , 실시간 저장댓글갯수 : %d ", age_range, this.cnt_KeywordStored));

		}
	}
}
