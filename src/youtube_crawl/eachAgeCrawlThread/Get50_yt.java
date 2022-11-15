package youtube_crawl.eachAgeCrawlThread;

import java.util.ArrayList;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;

import youtube_crawl.vo.*;

public class Get50_yt extends CrawlThread {

	@Override
	public void run() {

		getTermBtnECO(5000);

		// Crawl_href 파라미터 url 값
		this.copt = new ChromeOpt(Config_win.cf.mainPageYoutube);

		this.driver = this.copt.getWebDriver();

		this.js = (JavascriptExecutor) driver;

		// 페이지 이동 횟수
		int cnt = 0;

		try {
			// Crawl_href2 클래스 사용
			allhref_list = crawl_href.Crwal_Href(Config_win.cf.youtube_Age_50_URL, driver);

			for (String item : allhref_list) {
				// item 은 index 값이 아니라 allhref_list 에 담긴 값 ?

				for (int i = 0; i < 5; i++) {
					this.js.executeScript("window.scroll(0,800000)");
					Thread.sleep(2000);
				}

				driver.navigate().to(item);

				for (int i = 0; i < 10; i++) {
					this.js.executeScript("window.scroll(0,800000)");
					Thread.sleep(2000);
				}

				ArrayList<WebElement> comments = (ArrayList<WebElement>) driver.findElements(By.id("content-text"));
				cnt++;
				System.out.println("페이지 이동 횟수 = " + cnt);

				Thread.sleep(15000);
				for (int i = 0; i < comments.size(); i++) {
					System.out.println(comments.get(i).getText());
				}

				if (cnt == 3) {
					System.out.println("페이지 이동 3회 =  drive 종료");
					driver.quit();
				}

				System.out.println(" 50 대 댓글 = 추출 수 " + comments.size());
				// 다수의 값을 comments 에 넣기
				this.splitKeyword_class.StoreSplitedKeyWord( 50 , this.splitKeyword_class.SplitKeyWord_(comments));
			}


		} catch (InterruptedException e) {
			System.out.println(e);
			e.printStackTrace();

			driver.quit();
			System.out.println("에러 - 드라이브 종료");

		}
	}

}
