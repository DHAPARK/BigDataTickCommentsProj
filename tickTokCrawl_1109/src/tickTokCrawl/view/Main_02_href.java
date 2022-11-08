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
import tickTokCrawl.controller.Controller;

public class Main_02_href {

	public static void main(String[] args) throws InterruptedException {
		
		String id = "webdriver.chrome.driver" ;
		
		String path = "chromedriver.exe" ;
		
		System.setProperty(id, path);
		
		WebDriver driver = new ChromeDriver();
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		
		JavascriptExecutor js = (JavascriptExecutor)driver;
		
		// 댓글 저장 
		ArrayList<WebElement> urlListInPage = null;
		
		
		
//		driver.get("https://www.youtube.com/");
		driver.get(Config.cf.youtube_Age_20_URL);
			
		// 도현님 방법
//		ArrayList<WebElement> inputTag = (ArrayList<WebElement>) driver.findElements(By.name("search_query"));
//
//		inputTag.get(0).sendKeys("20대");
//		Thread.sleep(3000);
//		inputTag.get(0).sendKeys(Keys.RETURN);
//		Thread.sleep(3000);
		
		// 검색에 20대 입력하고 클릭이 왜 안될까 
//		driver.findElement(By.name("search_query")).sendKeys("20대");
//		driver.findElement(By.id("search-icon-legacy")).sendKeys(Keys.ENTER);
		
		
		// 동영상 태그-id 찾아 클릭 
//			driver.findElements(By.id(Config.cf.Youtubehref_id)).get(0).click();
//		driver.findElements(By.id("video-title")).get(0).click();
            
		ArrayList<WebElement> allUrlList = new ArrayList<WebElement>();
			while(true) {
				Thread.sleep(3000);
				try {
					urlListInPage = (ArrayList<WebElement>) driver.findElements(By.id("thumbnail"));
//					js.executeScript("window.scroll(0,800000)");
					
					for( WebElement item : urlListInPage ) {
						
						// 유튜브는 href 값이 'http://www.youtube.com' 값이 없다.  
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
						}
						
					}
				} catch(Exception e) {
				System.out.println(e);
				System.out.println("외 않되?");
			}finally {
				System.out.println("파이널리 도착");
			}
		}
	}
}			

