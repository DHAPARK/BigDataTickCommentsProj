package tickTokCrawl.VO;

import java.time.Duration;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class ChromeOpt {

	static private WebDriver webDriver;

	public WebDriver getWebDriver() {

		return this.webDriver;

	}

	public ChromeOpt(String url) {

		getInstance(url);

	}

	public static void getInstance(String url) {

		//Config config = new Config();

		System.setProperty( Config.cf.id, Config.cf.path ) ;

		ChromeOptions options = new ChromeOptions();
		
		//options.addArguments("headless");
		
		options.setCapability("ignoreProtectModeSettings", true);

		webDriver = new ChromeDriver(options);
		
		WebDriverWait webDriverWait = new  WebDriverWait(webDriver, Duration.ofMillis(1000000000) ) ;
		
		webDriver.get(url);
		/*
		try {
			webDriverWait.until(
		            ExpectedConditions.visibilityOfElementLocated(By.className( Config.cf.EVURLClassName ) )
		            //cssSelector로 선택한 부분이 존재할때까지 기다려라
				 );	
		}catch(Exception e) {
			
			webDriver.quit();
			
			System.out.println("에러 발생 driver 종료 ");
			
			
		}
		*/
		
	}

}
