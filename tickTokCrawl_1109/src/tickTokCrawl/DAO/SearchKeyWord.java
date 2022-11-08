package tickTokCrawl.DAO;

import java.util.ArrayList;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import tickTokCrawl.VO.Config;

public class SearchKeyWord {

	void searchEachAgeVideo(String age, WebDriver wd) {
		
		ArrayList<WebElement> inputTag = (ArrayList<WebElement>) wd.findElements(By.className(Config.cf.mainPageYoutube));
		
		inputTag.get(0).sendKeys(age);

		inputTag.get(0).sendKeys(Keys.RETURN);


		
		
	}
	
}
