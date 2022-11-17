package fmkoreaCrawl.dao;

import java.util.ArrayList;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import fmkoreaCrawl.vo.Config;

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

	public CrawlAllUrlInPage() {;}

	/*
	 * 일단은 void로 URL들만 긁어오나 확인필요
	 * 
	 * CAUIP = CrawlAllUrlInPage WebDriver wd 같은경우는 Main에서 객체화를 시켜서 넘겨야할것같은데 사용할때마다
	 * URL이 바뀌어들어가야하니
	 * wd : 웹 드라이버 
	 * age_range : 연령대
	 */
	public ArrayList<String> CAUIP( WebDriver wd , String age_range ) throws InterruptedException {

		ArrayList<WebElement> urlListInPage = null;

		ArrayList<String> allUrlList = new ArrayList<String>();

		for ( int i = 1 ; i < 10 ; i++ ) {
			
			urlListInPage = (ArrayList<WebElement>) wd.findElements(By.cssSelector(Config.cf.EURLSelctor + i + Config.cf.EURLSelctor2));
			
			for (WebElement item : urlListInPage) {

				allUrlList.add(item.findElement(By.tagName("a")).getAttribute("href"));

			}
			
			try {

				wd.findElements(By.cssSelector(Config.cf.pagingBtnSelector + "("+ ( i + 2 ) + ")")).get(0).click();
				
			}catch (Exception e) {
				
				System.out.println( e );
				
			}
			
		}
		
//		for ( int i = 1 ; i < 10 ; i++ ) {
//			
//			wd.findElements(By.cssSelector(Config.cf.pagingBtnSelector + "("+ i + ")")).get(0).click();
//			
//		}
		

		System.out.println(urlListInPage.size());

		return allUrlList ;
	}

}
