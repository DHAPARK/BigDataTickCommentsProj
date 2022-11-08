package tickTokCrawl.view;


import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Point;
import org.openqa.selenium.Rectangle;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import tickTokCrawl.DAO.SearchKeyWord;
import tickTokCrawl.VO.ChromeOpt;
import tickTokCrawl.VO.CommentInfo;
import tickTokCrawl.VO.Config;
import tickTokCrawl.VO.Config_win;
import tickTokCrawl.controller.Controller;

public class Main_05_href2 {

	public static void main(String[] args) throws InterruptedException {
		
		/*
		 *  1. view 검색창의 입력한 데이터 값을 getParameter 로 담아 
		 *  url 링크에 담는다 ( Config_win.cf.url_ ) 
		 *  
		 *  2. 파라미터 값이 담겨진 url 링크로 해당 페이지 접속 
		 *  
		 *  3. 접속한 url 의 동영상 href 리스트를 ArrayList<WebElement> allUrlList 에 담고 comments 출력 페이지로 이동시켜야 한다.
		 * 
		 *  메모 = allUrllist 값의 href 링크를 Config_win.cf.href_url 에 담기 성공 
		 *  
		 */
		
		String id = "webdriver.chrome.driver" ;
		
		String path = "chromedriver.exe" ;
		
		System.setProperty(id, path);
		
		WebDriver driver = new ChromeDriver();
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		
		JavascriptExecutor js = (JavascriptExecutor)driver;
		
		// 댓글 저장 
		ArrayList<WebElement> urlListInPage = null;
		ArrayList<WebElement> allUrlList = new ArrayList<WebElement>();
		
		// Config_win.cf.url_ = 사용자가 입력한 키워드 
		
		driver.get("https://www.youtube.com/results?search_query=" + Config_win.cf.url_ );
		
		while( true) {
			Thread.sleep(3000);
			try {
				urlListInPage = (ArrayList<WebElement>) driver.findElements(By.id("thumbnail"));
					
				for( WebElement item : urlListInPage ) {
							
					System.out.println("여기에 도착");
							
					allUrlList = (ArrayList<WebElement>) (driver.findElements(By.id("video-title")));
					Thread.sleep(5000);
					js.executeScript("window.scroll(0,800000)");
							
							
					// url 갯수 출력 
					System.out.println(urlListInPage.size());
							
					// allUrlList 에서 href 값 가져오기 = 내가 바보인가? 
					System.out.println(allUrlList.size());
					for(int i = 0 ; i < 10 ; i ++ ) {
						System.out.println(allUrlList.get(i).getAttribute("href"));
						Config_win.cf.setHref_url(allUrlList.get(i).getAttribute("href"));
						System.out.println("Config 에 잘 담겨질까? ");
						System.out.println(Config_win.cf.getHref_url());
					}					
				}
					
		} catch(Exception e) {
			System.out.println(e);
			System.out.println("외 않되?");
		}finally {
			}
		}
	
	
	}
}			

