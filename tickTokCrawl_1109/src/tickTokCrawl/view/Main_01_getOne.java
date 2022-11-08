package tickTokCrawl.view;


import java.time.Duration;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import tickTokCrawl.VO.ChromeOpt;
import tickTokCrawl.VO.Config;
import tickTokCrawl.controller.Controller;

public class Main_01_getOne {

	public static void main(String[] args) throws InterruptedException {
//		Controller ct = new Controller();
////		ct.get10SC( Config.cf.mainPage ) ;
//		ct.get20SC( Config.cf.youtube_Age_20_URL);
		
		String id = "webdriver.chrome.driver" ;
		
		String path = "chromedriver.exe" ;
		
		System.setProperty(id, path);
		
		WebDriver driver = new ChromeDriver();
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		
		JavascriptExecutor js = (JavascriptExecutor)driver;
		
		driver.get(Config.cf.mainPageYoutube);
//		driver.get(Config.cf.youtube_Age_20_URL);

		// 검색에 20대 입력하고 클릭이 왜 안될까 
//		wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input[id='search']"))).sendKeys("20대" + Keys.RETURN);
//		driver.findElement(By.name("search_query")).sendKeys("20대");
//		driver.findElement(By.name("search_query")).sendKeys(Keys.RETURN);
//		driver.findElement(By.name("search_query")).sendKeys(Keys.ENTER);
//		driver.findElement(By.id("search-icon-legacy")).sendKeys(Keys.ENTER);
			
		//get(몇번째 id 인지 )
		driver.findElements(By.id("video-title")).get(0).click();
            
			while(true) {
				// 3초 구간 설정 
				Thread.sleep(3000);
			
				try {
					js.executeScript("window.scroll(0,800000)");
					
					WebElement data = wait.until(ExpectedConditions.presenceOfElementLocated(By.id("content-text")));
					System.out.println(data.getAttribute("textContent"));
			
				} catch(Exception e) {
				System.out.println("왜 않되?");
			}
			
			// 스크롤 내리기 
			
			// 댓글 조회 후 data 담기  - 고작 1개.. 
			
			// 비디오 제목 가져오기 + 출력 
//            WebElement firstResult = wait.until(ExpectedConditions.presenceOfElementLocated(By.id("video-title")));
//            JOptionPane.showMessageDialog(null, "the first search is: " + firstResult.getAttribute("textContent"));
//            System.out.println(firstResult.getAttribute("textContent"));
            
			// 담겨진 데이터 출력 
			// 이것을 반복문으로 하면 되는가 ? 
			}
		}
}			

