package youtube_crawl.eachAgeCrawlThread;

import java.util.ArrayList;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;

import youtube_crawl.vo.*;

public class Get10_backup extends CrawlThread {

	/*
	 *  this.copt = new ChromeOpt(Config_win.cf.mainPageYoutube); 은 각자 실행 되나,
	 *  
	 *  allhref_list = crawl_href.Crwal_Href(Config_win.cf.youtube_Age_10_URL, driver); 
	 *  부분이 하나의 셀레니움 페이지에서 동시 실행 10대 to 50대 
	 *  
	 *  왜죠? 
	 */
	
	@Override
	public void run() {

		getTermBtnECO(3000);

		// Crawl_href 파라미터 url 값
		this.copt = new ChromeOpt(Config_win.cf.mainPageYoutube);

		this.driver = this.copt.getWebDriver();

		this.js = (JavascriptExecutor) driver;

		try {
			// Crawl_href2 클래스 사용
			allhref_list = crawl_href.Crwal_Href(Config_win.cf.youtube_Age_10_URL, driver);

			for (String item : allhref_list) {
				// item 은 index 값이 아니라 allhref_list 에 담긴 값 ?

//				System.out.println("navigate 실행");
				driver.navigate().to(item);

				for (int i = 0; i < 5; i++) {
					this.js.executeScript("window.scroll(0,800000)");
					Thread.sleep(2000);
				}

				for (int i = 0; i < 10; i++) {
					this.js.executeScript("window.scroll(0,800000)");
					Thread.sleep(2000);
				}

				Thread.sleep(15000);

//				System.out.println("여기도착");
				ArrayList<WebElement> comments = (ArrayList<WebElement>) driver.findElements(By.id("content-text"));
				// 다수의 값을 comments 에 넣기
				System.out.println(" 10 대 = "+comments.size());
				// text 출력하기 
//				for ( int i = 0 ; i < comments.size() ; i ++ ) {
//					System.out.println(comments.get(i).getText());
//				}
			}
		} catch (InterruptedException e) {
			System.out.println(e);
			e.printStackTrace();
			
			driver.quit();
			System.out.println("에러 - 드라이브 종료");
			
		}

	}

}
