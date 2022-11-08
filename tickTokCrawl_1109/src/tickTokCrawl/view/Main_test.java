package tickTokCrawl.view;

import java.util.ArrayList;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import tickTokCrawl.DAO.CrawlHref;
import tickTokCrawl.DAO.CrawlHref_2;
import tickTokCrawl.VO.CommentInfo;
import tickTokCrawl.VO.Config_win;

public class Main_test {
	public static void main(String[] args) throws InterruptedException {
		
		String id = "webdriver.chrome.driver" ;
		
		String path = "chromedriver.exe" ;
		
		System.setProperty(id, path);
		
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectModeSettings", true);
		options.addArguments("--disable-popup-blocking");
		options.addArguments("--disable-default-apps");
	
		WebDriver driver = new ChromeDriver(options);
		
		
		CrawlHref cr_hr = new CrawlHref();
		CrawlHref_2 c2 = new CrawlHref_2();
		// 검색 = 20대 
		c2.Crwal_Href("https://www.youtube.com/results?search_query=" + Config_win.cf.url_ , driver);
		
		System.out.println("클래스 변수인가? = " +c2.href_url);
//		cr_hr.Crwal_Href("https://www.youtube.com/results?search_query=" + Config_win.cf.url_ , driver);
	
	
	}
}
