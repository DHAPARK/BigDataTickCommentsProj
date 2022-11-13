package dcinsideCrawl.EachAgeCrawlThread;

import java.util.ArrayList;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;

import dcinsideCrawl.dao.CrawlAllUrlInPage;
import dcinsideCrawl.vo.ChromeOpt;
import dcinsideCrawl.vo.Config;

public class Get20SC extends CrawlThread {

	@Override
	public void run() {
		
		getTermBtnECO( Config.cf.getTermBtnECO_Time * 2 );
		
		this.copt = new ChromeOpt( Config.cf.dcinside_Age_20_URL );
		
		this.wd = this.copt.getWebDriver();
		
		this.js = (JavascriptExecutor)wd ;
			
		//wd.findElements(By.className(Config.cf.seeMoreBtnName)).get( 0 ).click();
		wd.findElements(By.xpath(Config.cf.seeMoreBtnXpath)).get(0).click();
		
		cauip = new CrawlAllUrlInPage();

		try {
			/*
			 * CAUIP = CrawlAllUrlInPage 페이지내의 URL을 100개든 300개든 정해놓은대로 받아온 상태
			 */
			allUrlList = cauip.CAUIP( wd , Config.cf.Age_20_Keyword );

			/*
			 * 한 페이지씩 이동하며 모든 댓글을 긁어와야한다
			 */
			for (String item : allUrlList) {

				wd.navigate().to( item );
				/*
				 * var item = document.getElementsByClassName("tiktok-q9aj5z-PCommentText") ;
				 * console.log( item[ 2 ].innerText ) ;
				 */


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
				
				this.splitKWIC.StoreSplitedKWIC( Config.cf.Age_20 , this.splitKWIC.SplitKWIC( commentsList ) ) ; 
				
			}

		} catch (Exception e) {
			
			System.out.println(e);

			e.printStackTrace();
			
			wd.quit();
			
			System.out.println("에러 발생 -> driver 종료 ");

		}
	}
}
