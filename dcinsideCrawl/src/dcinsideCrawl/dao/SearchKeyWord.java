package dcinsideCrawl.dao;

import java.util.ArrayList;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import dcinsideCrawl.vo.Config;

public class SearchKeyWord {

	void searchEachAge(String age, WebDriver wd) {
		
		ArrayList<WebElement> inputTag = (ArrayList<WebElement>) wd.findElements(By.className(Config.cf.mainPageInputTag));
		
		inputTag.get(0).sendKeys(age);

		inputTag.get(0).sendKeys(Keys.RETURN);

	}
	
}
