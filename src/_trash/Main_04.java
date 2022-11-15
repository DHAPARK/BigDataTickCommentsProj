package _trash;

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

import youtube_crawl.vo.Config_win;


public class Main_04 {

	/*
	 *  하나의 페이지에서 가지고 있는 댓글 = By.id("content-text") 
	 *  무한 스크롤로 값을 전부 출력하기 
	 * 
	 *  주의 - 영상 소개 text 와 댓글 text 값이 똑같아서 둘다 나온다 ( 영상 소개글 까지 )
	 */
	
	public static void main(String[] args) throws InterruptedException {
		
		String id = "webdriver.chrome.driver" ;
		
		String path = "chromedriver.exe" ;
		
		System.setProperty(id, path);
		
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectModeSettings", true);
		options.addArguments("--disable-popup-blocking");
		options.addArguments("--disable-default-apps");
		
		WebDriver driver = new ChromeDriver(options);
		
//		options.addArguments("--start-maximized");
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		
		JavascriptExecutor js = (JavascriptExecutor)driver;
		
		
		//get(몇번째 id 인지 )
		driver.get(Config_win.cf.youtube_Age_20_URL);
//		Thread.sleep(3000);
		driver.findElements(By.id("video-title")).get(0).click();
//		Thread.sleep(3000);
		
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
