package dcinsideCrawl.vo;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class ChromeOpt {

	static private WebDriver webDriver;

	public WebDriver getWebDriver() {

		return this.webDriver;

	}

	public ChromeOpt(String url) {

		getInstance(url);

	}

	public static void getInstance(String url) {

		System.setProperty( Config.cf.id, Config.cf.path ) ;

		ChromeOptions options = new ChromeOptions();
		
		options.setCapability("ignoreProtectModeSettings", true);

		webDriver = new ChromeDriver(options);
		
		webDriver.get(url);
		
	}

}
