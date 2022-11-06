package tickTokCrawl.controller;

import java.util.ArrayList;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import splitKeyWordInComment.SplitKeyWordInComment;
import tickTokCrawl.DAO.CrawlAllUrlInPage;
import tickTokCrawl.VO.ChromeOpt;
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

//스레딩 개선 전까지 사용했던 컨트롤러 

public class Controller_Before {

	/*
	 * js코드를 java에서 실행가능케하는 클래스 JavascriptExecutor
	 */
	JavascriptExecutor js ;
	
	/*
	 * 싸그리 긁어온 Video URL List
	 */
	ArrayList<String> allUrlList;

	CrawlAllUrlInPage cauip;

	Config config;

	ChromeOpt copt;

	public WebDriver wd;

	SplitKeyWordInComment splitKWIC ;
	
	public Controller_Before() {

		this.config = new Config();
		
		this.splitKWIC = new SplitKeyWordInComment() ;
		
	}

	/*
	 * get10SC = get10SComments 10대의 댓글을 긁어오는 메서드
	 */
	public void get10SC(String url) {

		this.copt = new ChromeOpt(url);
		// 여기서 웹이 켜진상태인듯한데...
		this.wd = this.copt.getWebDriver();

		this.js = (JavascriptExecutor)wd ;
		
		cauip = new CrawlAllUrlInPage();

		try {
			/*
			 * CAUIP = CrawlAllUrlInPage 페이지내의 URL을 100개든 300개든 정해놓은대로 받아온 상태
			 */
			allUrlList = cauip.CAUIP(wd , "n");

			/*
			 * 한 페이지씩 이동하며 모든 댓글을 긁어와야한다
			 */
			for (String item : allUrlList) {

				wd.navigate().to( item );
				/*
				 * var item = document.getElementsByClassName("tiktok-q9aj5z-PCommentText") ;
				 * console.log( item[ 2 ].innerText ) ;
				 */

				for ( int i = 0 ; i < 10 ; i++ ) {
					
					Thread.sleep(3000) ;
					
					try {

						//this.js.executeScript( "arguments[0].scrollBy(0,2000)" , wd.findElements(By.className("tiktok-1ko6l9n-DivCommentListContainer")).get( 0 ) );
						this.js.executeScript( "window.scroll(0,800000)");
						
						System.out.println("돌아가는건가..?");
						
					}catch (Exception e) {
						
						System.out.println( e );
						
					}
					
				}
				/*
				 * 댓글을 긁어오기전에 스크롤을 최대한 내리고 싶은데 ..
				 * 무튼 allUrlList가 하나의 URL을 돌때마다 댓글 ArrayList는 초기화될것이다
				 *  wd.findElements( By.className(Config.cf.commentsTagClassName) ) ;
				 *  최대한 댓글을 많이 긁어모아서 한번에 긁는다
				 *  이후 commentsList에 한 페이지에서 담은 모든 댓글을집어넣는다
				 */
				ArrayList<WebElement> commentsList = (ArrayList<WebElement>) wd.findElements( By.className(Config.cf.commentsTagClassName) ) ;
				
				System.out.println( String.format("URL : %s 에서 뽑아온 댓글의 갯수 : %d" , item , commentsList.size() ) );
				
				/*
				 * 댓글들을 다 긁어와서 commentsList에 집어넣은 다음 댓글 하나하나씩 DB에 집어넣어야 한다 
				 * 댓글을 집어넣는 방법은 10대를 긁고있으면 10대 테이블에 단어를 하나씩 집어넣는데 , 
				 * 들어가있는단어면 +1 을 , 원래 없던 단어라면 0 으로 초기값을 세팅해줘야한다 : storeKeywordInDB( int age_range , String cc ) 메서드로 해결
				 * 결론적으로 age_range 와 cc만 하나씩 넣어주면 된다
				 * 				########### 방향 ###########
				 * 일단 ArrayList<WebElement>를 그대로 SKWIC : SplitKeyWordInComment로 들고가서 죄다 String값으로 바꿔 추출해온다음
				 * 현재 위치한 Controller의 ArrayList<String> allCommentsList 에 집어넣는다 이후 allCommentsList를
				 * StoreSplitedKWIC : StoreSplitedKeyWordInComment(int age_range, String cc)  돌려버리면 DB에 저장까지 될듯한데..
				 */
				//allCommentsList = this.splitKWIC.SplitKWIC( commentsList ) ;
				//allCommentsList에 집어넣지 않고 돌리는게 리소스 분배가 더 효율적일듯 한데...
				
				this.splitKWIC.StoreSplitedKWIC( 10 , this.splitKWIC.SplitKWIC( commentsList ) ) ; 
				
			}

		} catch (Exception e) {
			
			System.out.println(e);

			e.printStackTrace();
			
			wd.quit();
			
			System.out.println("에러 발생 -> driver 종료 ");

		}

	}

	/*
	 * get20SC = get20SComments 10대의 댓글을 긁어오는 메서드
	 */
	public void get20SC(String url) {

		this.copt = new ChromeOpt(url);

		this.wd = this.copt.getWebDriver();

	}

	/*
	 * get30SC = get30SComments 30대의 댓글을 긁어오는 메서드
	 */
	public void get30SC(String url) {

		this.copt = new ChromeOpt(url);

		this.wd = this.copt.getWebDriver();


	}

	/*
	 * get40SC = get40SComments 10대의 댓글을 긁어오는 메서드
	 */
	public void get40SC(String url) {

		this.copt = new ChromeOpt(url);

		this.wd = this.copt.getWebDriver();

	}

	/*
	 * get50SC = get50SComments 10대의 댓글을 긁어오는 메서드
	 */
	public void get50SC(String url) {

		this.copt = new ChromeOpt(url);

		this.wd = this.copt.getWebDriver();

	}

}
