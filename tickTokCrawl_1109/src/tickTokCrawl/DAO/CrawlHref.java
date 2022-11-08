package tickTokCrawl.DAO;

import java.sql.Driver;
import java.util.ArrayList;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.devtools.idealized.Javascript;

import tickTokCrawl.VO.Config_win;

public class CrawlHref {
	
	/*  개요 
	 *  main_05_href 알고리즘으로 
	 *  클라이언트가 검색한 키워드를 가져오고
	 *  
	 *  키워드로 검색한 YouTube 영상들의 href 값을 담아 
	 *  return 해야한다. 
	 */
		
	public String Crwal_Href(String url , WebDriver driver) throws InterruptedException{

		ArrayList<WebElement> urlListInPage = null;

		JavascriptExecutor js = (JavascriptExecutor) driver;
		
		ArrayList<String> allUrlList = new ArrayList<String>();
		String href_url = null;
		
//		SearchKeyWord_yt sc = new SearchKeyWord_yt();
//		sc.searchEachAgeVideo("20대", driver);
		
		driver.get(url);
		
		while(true) {
			Thread.sleep(3000);
			try {
//				driver.findElements(By.id("video-title"));
				urlListInPage = (ArrayList<WebElement>) driver.findElements(By.id("thumbnail"));
				
				for( WebElement item : urlListInPage ) {
					
					Thread.sleep(5000);
					
					js.executeScript("window.scroll(0,800000)");
					
					// 여기에 도착을 못함 
					System.out.println("여기에 도착");
					href_url = driver.findElements(By.id("video-title")).get(0).getAttribute("href") + ",";
					
				for( int i = 0 ; i < 1000 ; i ++ ) {
					System.out.println("href_url length = "+href_url.length());
					System.out.println(href_url);
				}
			}
			}catch(Exception e) {
				System.out.println(e);
				System.out.println("에러 발생");
			}

			return href_url;
		}
		
				
	}	
}
