package tickTokCrawl.view;

import java.util.ArrayList;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class crawl_href {

	private String id = "webdriver.chrome.driver" ;
	private String path = "chromedriver.exe" ;
	
	WebDriver driver = new ChromeDriver();
	JavascriptExecutor js = (JavascriptExecutor)driver;
	
	ArrayList<WebElement> urlListInPage = null;
	
	// view 에서 get 할 파라미터
	
}
