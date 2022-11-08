package tickTokCrawl.DAO;


/*
 * 해당 영상의 페이지에 들어가 댓글목록에 있는 댓글들을 모두 긁어오는 메서드
 * 
 *
 * 	RemoteWebElement는 html태그객체를 말하는듯..Java에서 처리를못하니 처리가능하게 셀레니움에서 제공하는듯
 * 	아래는사용예시
 * 	ArrayList ar = (ArrayList) ((RemoteWebElement)(trArr.get(i))).findElements(By.tagName("td")) ;		
 *	edmi.setTh(((RemoteWebElement)ar.get(0)).getText());
 *	ArrayList trArr = (ArrayList) this.wd.findElements( By.className("box-body") ).get(2).findElements( By.tagName( "table" ) ).get(0).findElement( By.tagName("tbody") ).findElements(By.tagName("tr"));
 * 
 * 
 * */
public class CrawlAllCommentsInEachVideoPage {

	/*
	 * CACIEVP = CrawlAllCommentsInEachVideoPage
	 * 
	 */
	void CACIEVP () {
		
		
		
	}
	
}
