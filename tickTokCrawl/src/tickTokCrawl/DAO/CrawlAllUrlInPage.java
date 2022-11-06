package tickTokCrawl.DAO;

import java.util.ArrayList;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import tickTokCrawl.VO.Config;

/*
 * 10 , 20 , 30 , 40 , 50 대의 키워드로 검색했을때 나오는 모든 영상들에 달려있는 URL들을 전부 긁어오는 메서드
 * 비디오들이 나열되어있는 페이지에 들어갔을때에 모든 영상의 URL을 가져와야한다
 * ArrayList ar = (ArrayList) ((RemoteWebElement)(trArr.get(i))).findElements(By.tagName("td")) ;		
 * edmi.setTh(((RemoteWebElement)ar.get(0)).getText());
 * ArrayList trArr = (ArrayList) this.wd.findElements( By.className("box-body") ).get(2).findElements( By.tagName( "table" ) ).get(0).findElement( By.tagName("tbody") ).findElements(By.tagName("tr"));
 * 
 * 
 * for문이 10번 반복하게 되어있으니 대략 120개의 영상 URL을 따올것이다 
 * 한번 더보기를 누를때마다 12개씩 추가된다고 보면된다
 * */
public class CrawlAllUrlInPage {

	public CrawlAllUrlInPage() {
		;
	}

	/*
	 * 일단은 void로 URL들만 긁어오나 확인필요
	 * 
	 * CAUIP = CrawlAllUrlInPage WebDriver wd 같은경우는 Main에서 객체화를 시켜서 넘겨야할것같은데 사용할때마다
	 * URL이 바뀌어들어가야하니
	 */
	public ArrayList<String> CAUIP(WebDriver wd) throws InterruptedException {

		SearchKeyWord sc = new SearchKeyWord();

		// ContentsListInPage clip = new ContentsListInPage();

		ArrayList<WebElement> urlListInPage = null;

		ArrayList<String> allUrlList = new ArrayList<String>();

		sc.searchEachAgeVideo("10대", wd);
		
		Thread.sleep(10000);
		
		for ( int i = 0 ; i < 3 ; i++ ) {
			
			Thread.sleep(5000);
			
			try {
				
				wd.findElements(By.className(Config.cf.seeMoreBtnName)).get( 0 ).click();
				
			}catch (Exception e) {
				
				System.out.println( e );
				
			}
			
			
			
			System.out.println("여기서죽나 ? ");
			
		}
		
		urlListInPage = (ArrayList<WebElement>) wd.findElements(By.className(Config.cf.EVURLClassName));
		System.out.println("여기서 ? ");
		for (WebElement item : urlListInPage) {

			allUrlList.add(item.findElement(By.tagName("a")).getAttribute("href"));

		}

		System.out.println(urlListInPage.size());
		/*
		 * 기본적으로 12개의 데이터 옴 12개의 url 1000개까지 더보기로 모을수있나?
		 */
		return allUrlList ;
	}

}
