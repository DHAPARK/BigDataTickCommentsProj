package youtube_crawl.eachAgeCrawlThread;

import java.util.ArrayList;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import splitKeyWord.SplitKeyWord_Comments;
import youtube_crawl.dao.CrawlHref_2;
//import splitKeyWordInComment.SplitKeyWordInComment;
import youtube_crawl.vo.ChromeOpt;
import youtube_crawl.vo.Config_win;

public abstract class CrawlThread implements Runnable {

	
	/*
	 *  CrawlHref2 - Crawl_Href 에 담긴 
	 *  href_url 을 가져와 해당 url 에 접속 
	 *  
	 *  접속한 url 댓글 가져오고 
	 *  단어별로 parsing = how?
	 *  
	 *  parsing 된 데이터 = cmc 
	 *  cmc 의 cnt 값 
	 *  
	 *  최종 1 { comment : cnt } 
	 * 
	 */
	
	
	
	// 
	ArrayList<WebElement> urlListInPage = null;
	
	ArrayList<String> allhref_list = null;
	
	
	public WebDriver driver = null ;

	JavascriptExecutor js = null;
	
	ArrayList<String> href_url = new ArrayList<String>();
	
	Config_win config = new Config_win() ;

	ChromeOpt copt = null ;
	
	SplitKeyWord_Comments splitKeyword_class = new SplitKeyWord_Comments();
	

	// href 생성자 
	
	CrawlHref_2 crawl_href = new CrawlHref_2();
	
	//SplitKeyWordInComment splitKWIC = new SplitKeyWordInComment();
	
	public void getTermBtnECO( int termSize ) {
		
		/*
		 * 크롬드라이버가 서로 켜지는데 텀을 두기위한 코드 ( 병렬 스레드로 여러개가 동시에 켜지면 제어권을 두고 문제가 생기는듯... )
		 */
		try { Thread.sleep( termSize ); } catch (InterruptedException e1) { e1.printStackTrace(); }
		
	}
	
	
	
	
	
}


