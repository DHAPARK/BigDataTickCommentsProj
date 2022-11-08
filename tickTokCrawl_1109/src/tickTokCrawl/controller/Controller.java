package tickTokCrawl.controller;

import java.util.ArrayList;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;

import tickTokCrawl.DAO.CrawlAllUrlInPage;
import tickTokCrawl.VO.ChromeOpt;
import tickTokCrawl.VO.CommentInfo;
import tickTokCrawl.VO.Config;

/*
 * 	RemoteWebElement는 html태그객체를 말하는듯..Java에서 처리를못하니 처리가능하게 셀레니움에서 제공하는듯
 * 	아래는사용예시
 * 	ArrayList ar = (ArrayList) ((RemoteWebElement)(trArr.get(i))).findElements(By.tagName("td")) ;		
 *	edmi.setTh(((RemoteWebElement)ar.get(0)).getText());
 *	ArrayList trArr = (ArrayList) this.wd.findElements( By.className("box-body") ).get(2).findElements( By.tagName( "table" ) ).get(0).findElement( By.tagName("tbody") ).findElements(By.tagName("tr"));
 */

/*
 * 틱톡의 댓글 클래스명
 *	var divs = document.getElementsByClassName("tiktok-q9aj5z-PCommentText e1g2efjf6");
 *	console.log(divs);
 *	console.log(divs.length);
 *	console.log(divs[0].innerText);
 */

public class Controller {

	/*
	 * js코드를 java에서 실행가능케하는 클래스 JavascriptExecutor
	 */
	JavascriptExecutor js ;
	
	/*
	 * 싸그리 긁어온 Video URL List
	 */
	ArrayList<String> allUrlList;

	ArrayList<String> allCommentsList;

	CrawlAllUrlInPage cauip;

	Config config;

	ChromeOpt copt;

	public WebDriver wd;

	public Controller() {

		this.config = new Config();

	}

	/*
	 * get10SC = get10SComments 10대의 댓글을 긁어오는 메서드
	 */
	public ArrayList<CommentInfo> get10SC(String url) {

		System.out.println("여기까지오1");

		this.copt = new ChromeOpt(url);
		// 여기서 웹이 켜진상태인듯한데...
		this.wd = this.copt.getWebDriver();

		this.js = (JavascriptExecutor)wd ;
		
		cauip = new CrawlAllUrlInPage();

		try {
			/*
			 * CAUIP = CrawlAllUrlInPage 페이지내의 URL을 100개든 300개든 정해놓은대로 받아온 상태
			 */
			allUrlList = cauip.CAUIP(wd);

			/*
			 * 한 페이지씩 이동하며 모든 댓글을 긁어와야한다
			 */
			for (String item : allUrlList) {

				wd.navigate().to( item );
				/*
				 * var item = document.getElementsByClassName("tiktok-q9aj5z-PCommentText") ;
				 * console.log( item[ 2 ].innerText ) ;
				 */
				//Thread.sleep(1000000);

				while (true) {
					
					Thread.sleep(3000) ;
					try {

						//this.js.executeScript( "arguments[0].scrollBy(0,2000)" , wd.findElements(By.className("tiktok-1ko6l9n-DivCommentListContainer")).get( 0 ) );
						this.js.executeScript( "window.scroll(0,800000)");
						
						System.out.println("돌아가는건가..?");
						
						
						System.out.println( wd.findElements( By.className(Config.cf.commentsTagClassName) ).size() );
					}catch (Exception e) {
						
						System.out.println( e );
						
					}
					
					
					
				}
				/*
				 * 댓글을 긁어오기전에 스크롤을 최대한 내리고 싶은데 ..
				 */
				//wd.findElements(By.className(Config.cf.commentsTagClassName));

			}

		} catch (Exception e) {
			System.out.println(e);
			wd.quit();
			System.out.println("에러 발생 -> driver 종료 ");

			e.printStackTrace();

		}

		return null;
	}

	// 효빈 
	
	public ArrayList<CommentInfo> get20SC(String url) {

		System.out.println("여기까지오1");

		this.copt = new ChromeOpt(url);
		// 여기서 웹이 켜진상태인듯한데...
		this.wd = this.copt.getWebDriver();

		this.js = (JavascriptExecutor)wd ;
		
		cauip = new CrawlAllUrlInPage();

		try {
			/*
			 * CAUIP = CrawlAllUrlInPage 페이지내의 URL을 100개든 300개든 정해놓은대로 받아온 상태
			 */
			allUrlList = cauip.CAUIP20(wd);

			/*
			 * 한 페이지씩 이동하며 모든 댓글을 긁어와야한다
			 */
			for (String item : allUrlList) {

				wd.navigate().to( item );
				/*
				 * var item = document.getElementsByClassName("tiktok-q9aj5z-PCommentText") ;
				 * console.log( item[ 2 ].innerText ) ;
				 */
				//Thread.sleep(1000000);

				while (true) {
					
					Thread.sleep(3000) ;
					try {

						//this.js.executeScript( "arguments[0].scrollBy(0,2000)" , wd.findElements(By.className("tiktok-1ko6l9n-DivCommentListContainer")).get( 0 ) );
						this.js.executeScript( "window.scroll(0,800000)");
						
						System.out.println("돌아가는건가..?");
						
						System.out.println( wd.findElements( By.className(Config.cf.YoutubeComment) ).size() );
					}catch (Exception e) {
						
						System.out.println( e );
						
					}
					
					
					
				}
				/*
				 * 댓글을 긁어오기전에 스크롤을 최대한 내리고 싶은데 ..
				 */
				//wd.findElements(By.className(Config.cf.commentsTagClassName));

			}

		} catch (Exception e) {
			System.out.println(e);
			wd.quit();
			System.out.println("에러 발생 -> driver 종료 ");

			e.printStackTrace();

		}

		return null;
	}

	/*
	 * get30SC = get30SComments 30대의 댓글을 긁어오는 메서드
	 */
	public ArrayList<CommentInfo> get30SC(String url) {

		this.copt = new ChromeOpt(url);

		this.wd = this.copt.getWebDriver();

		return null;

	}

	/*
	 * get40SC = get40SComments 10대의 댓글을 긁어오는 메서드
	 */
	public ArrayList<CommentInfo> get40SC(String url) {

		this.copt = new ChromeOpt(url);

		this.wd = this.copt.getWebDriver();

		return null;
	}

	/*
	 * get50SC = get50SComments 10대의 댓글을 긁어오는 메서드
	 */
	public ArrayList<CommentInfo> get50SC(String url) {

		this.copt = new ChromeOpt(url);

		this.wd = this.copt.getWebDriver();

		return null;
	}

	/*
	 * 반복되는 검색에서 반복적으로 나오는 기능들을 분리한 메서드 RMsgFM = Repeat_Msg_From_Main.java
	 */
	public void RMsgFM() {

		System.out.println(" 더 검색하시겠습니까?\n1 : 더 검색 , 2 : 종료 , 3 : 뒤로가기");

	}

	/*
	 * SD = StoreData 긁어온 DB를 데이터를 저장하는 메서드
	 */
	public void SD() {

	}

}
