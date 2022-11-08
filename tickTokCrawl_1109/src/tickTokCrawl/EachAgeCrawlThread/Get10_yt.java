package tickTokCrawl.EachAgeCrawlThread;

import java.util.ArrayList;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;

import tickTokCrawl.DAO.CrawlHref_2;
import tickTokCrawl.VO.ChromeOpt;
import tickTokCrawl.VO.Config_win;

public class Get10_yt extends CrawlThread {

	@Override
	public void run() {

		getTermBtnECO(3000);

		// Crawl_href 파라미터 url 값
		this.copt = new ChromeOpt(Config_win.cf.youtube_Age_10_URL);

		this.driver = this.copt.getWebDriver();

		this.js = (JavascriptExecutor) driver;
		

		try {
			// Crawl_href2 클래스 사용
			allhref_list = crawl_href.Crwal_Href(Config_win.cf.youtube_Age_10_URL, driver);

			this.js.executeScript("window.scroll(0,800000)");
			
			for (String item : allhref_list) {
				// item 은 index 값이 아니라 allhref_list 에 담긴 값 ? 
				
				System.out.println("navigate 실행");
				driver.navigate().to(item);
				
				for ( int i = 0 ; i < 5 ; i ++) {
					this.js.executeScript("window.scroll(0,800000)");
					Thread.sleep(2000);
				}
				
				Thread.sleep(15000);
				
				System.out.println("여기도착");
				this.comments = (ArrayList<WebElement>) driver.findElements(By.id("content-text"));
				// 다수의 값을 comments 에 넣기 
				System.out.println(comments.size());
			
				for ( int i = 0 ; i < 50 ; i ++ ) {
					System.out.println(comments.get(i));
				}
			}
			
		} catch (InterruptedException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
	}

}
