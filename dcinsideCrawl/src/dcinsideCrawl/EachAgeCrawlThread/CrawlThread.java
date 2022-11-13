package dcinsideCrawl.EachAgeCrawlThread;

import java.util.ArrayList;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import dcinsideCrawl.dao.CrawlAllUrlInPage;
import dcinsideCrawl.vo.ChromeOpt;
import dcinsideCrawl.vo.Config;
import splitKeyWordInComment.SplitKeyWordInComment;

public abstract class CrawlThread implements Runnable {

	/*
	 * js코드를 java에서 실행가능케하는 클래스 JavascriptExecutor
	 */
	JavascriptExecutor js = null ;
	
	/*
	 * 싸그리 긁어온 Video URL List
	 */
	ArrayList<String> allUrlList = null ;

	CrawlAllUrlInPage cauip = null ;

	Config config = new Config() ;

	ChromeOpt copt = null ;

	public WebDriver wd = null ;

	SplitKeyWordInComment splitKWIC = new SplitKeyWordInComment();
	
	/*
	 * getTermBetweenEachChromeOpen
	 */
	public void getTermBtnECO( int termSize ) {
		
		/*
		 * 크롬드라이버가 서로 켜지는데 텀을 두기위한 코드 ( 병렬 스레드로 여러개가 동시에 켜지면 제어권을 두고 문제가 생기는듯... )
		 */
		try { Thread.sleep( termSize ); } catch (InterruptedException e1) { e1.printStackTrace(); }
		
	}
	
}
