package tickTokCrawl.view;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import tickTokCrawl.VO.ChromeOpt;
import tickTokCrawl.VO.Config;
import tickTokCrawl.VO.Config_win;
import tickTokCrawl.controller.Controller;

public class Main_06_ {

	/*
	 *  Config_win.cf.href_url = 클라이언트가 검색창에 입력한 검색어가 담긴 url 링크 
	 *  
	 *  해당 href_url 담겨진 url 을 예시로 10개 접속하여 10개의 동영상의 댓글들을 가져오기
	 *  
	 *  가져온 댓글을 DTO -> DAO - DB -> 시각화 분야 로 보내야한다.
	 * 
	 */
	
	public static void main(String[] args) throws InterruptedException {
		
		String id = "webdriver.chrome.driver" ;
		
		String path = "chromedriver.exe" ;
		
		System.setProperty(id, path);
		
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectModeSettings", true);
		options.addArguments("--disable-popup-blocking");
		options.addArguments("--disable-default-apps");
//		options.addArguments("--start-maximized");
		
		WebDriver driver = new ChromeDriver(options);
		
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		
		JavascriptExecutor js = (JavascriptExecutor)driver;
		
		
		//get(몇번째 id 인지 )
		driver.get(Config_win.cf.getHref_url());
		
			while(true) {
				Thread.sleep(1000);
				
				
				try {
					List<WebElement> comments = driver.findElements(By.id("content-text"));
					js.executeScript("window.scroll(0,800000)");
					
					// 수정 필요 - 데이터 정형화 
					for(int i = 0 ; i < comments.size(); i++) {
						System.out.println(comments.get(i).getText());
						System.out.println(comments.size());
					}
					
				} catch(Exception e) {
					System.out.println(e);
					System.out.println("왜 않되?");
			}finally {
			}
		}

	
	
	}
}			
