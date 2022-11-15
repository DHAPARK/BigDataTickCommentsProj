package youtube_crawl.dao;

import java.sql.Driver;
import java.util.ArrayList;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.devtools.idealized.Javascript;

import youtube_crawl.vo.Config_win;

public class CrawlHref_2 {

	/*
	 * 개요 main_05_href 알고리즘으로 클라이언트가 검색한 키워드를 가져오고
	 * 
	 * 키워드로 검색한 YouTube 영상들의 href 값을 담아 return 해야한다.
	 */
	public static CrawlHref_2 href = new CrawlHref_2();

	public ArrayList<String> href_url = new ArrayList<String>();

	public ArrayList<String> Crwal_Href(String url, WebDriver driver) throws InterruptedException {

		ArrayList<WebElement> urlListInPage = null;

		JavascriptExecutor js = (JavascriptExecutor) driver;

		String allUrlList = null;

		driver.get(url);

		// 스크롤 3번
		for (int i = 0; i < 3; i++) {
			Thread.sleep(3000);
			js.executeScript("window.scroll(0,800000)");
		}
//				driver.findElements(By.id("video-title"));
		urlListInPage = (ArrayList<WebElement>) driver.findElements(By.id("thumbnail"));

		// href 몇번 담을 것인가 
		for (int i = 0; i < 30; i++) {
			allUrlList = driver.findElements(By.id("video-title")).get(i).getAttribute("href");
			this.href_url.add(allUrlList);
		}
		// for문제거 51-54 여기로 옮기기

		return this.href_url;
	}

}
