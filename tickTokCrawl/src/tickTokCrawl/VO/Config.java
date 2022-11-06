package tickTokCrawl.VO;

public class Config {

	public static Config cf = new Config() ;
	
	public final String id = "webdriver.chrome.driver" ;
	
	public final String path = "chromedriver" ;
	/*
	 * https://www.tiktok.com/@hyunheeofficial/video/7091089199994113281
	 * var items = document.getElementsByClassName("tiktok-yz6ijl-DivWrapper");
	 * console.log(items[0].children[0].href
	 * 이게 10대 20대 30대 검색했을때에 틱톡 영상으로 들어가는 링크를 제공해준다
	 * 정확히는 items[0] 즉 얘의 자식들중 0번째놈이 a태그인데 그놈의 href를 가져오면 해당 썸네일과 연결된 링크로 들어가게됨
	 * 
	 * EVURLTClassName = Each Video URL Tag Class Name
	 */
	public final String EVURLClassName = "tiktok-yz6ijl-DivWrapper" ;
	
	
	
	/*
	 * 틱톡의 댓글 클래스명
	 *	var divs = document.getElementsByClassName("tiktok-q9aj5z-PCommentText e1g2efjf6");
	 *	console.log(divs);
	 *	console.log(divs.length);
	 *	console.log(divs[0].innerText);
	 *
	 * 	EVCTClassName = Each Video Comments Tag Class Name
	 */
	public final String EVCTClassName = "tiktok-q9aj5z-PCommentText" ;
	
	public final String seeMoreBtnName = "tiktok-154bc22-ButtonMore" ;
	
	//mainPage
	public final String mainPage = "https://www.tiktok.com";
	
	public final String mainPageInputTag = "tiktok-zx5sa-InputElement" ;
	
	public final String commentsTagClassName = "tiktok-q9aj5z-PCommentText" ;
	
	//50
	public final String tickTok_Age_50_URL = "https://www.tiktok.com/search?q=50대&t=1667203534716" ;
	//40
	public final String tickTok_Age_40_URL = "https://www.tiktok.com/search?q=40대&t=1667203596159" ;
	//30
	public final String tickTok_Age_30_URL = "https://www.tiktok.com/search?q=30대&t=1667203608441" ;
	//20
	public final String tickTok_Age_20_URL = "https://www.tiktok.com/search?q=20대&t=1667203620327" ;
	//10
	public final String tickTok_Age_10_URL = "https://www.tiktok.com/search?q=10대&t=1667203627551" ;
	
}
