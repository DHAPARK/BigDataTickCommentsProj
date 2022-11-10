package tickTokCrawl.VO;

public class Config {

	public static Config cf = new Config() ;
	
	public final String id = "webdriver.chrome.driver" ;
	
	public final String path = "chromedriver.exe" ;
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
	
	
	public final int Age_10 = 10 ;
	
	public final int Age_20 = 20 ;
	
	public final int Age_30 = 30 ;
	
	public final int Age_40 = 40 ;
	
	public final int Age_50 = 50 ;
	
	//Get10SC , 20SC , 30Sc ... 등에 들어갈 10대 , 20대 , 30대 , 검색 키워드
	public final String Age_10_Keyword = "10대" ;
	
	public final String Age_20_Keyword = "20대" ;
	
	public final String Age_30_Keyword = "30대" ;
	
	public final String Age_40_Keyword = "40대" ;
	
	public final String Age_50_Keyword = "50대" ;
	
	//각 크롬이 켜질때에 겹치지않고 안전하게 켜지게 텀을 두기위한 변수
	//getTermBetweenEachChromeOpen_Time
	public final int getTermBtnECO_Time = 10000 ;
	
	//영상 URL 크롤링시에 스크롤 아래로 계속 내리는 시간간격
	public final int VideoURLScrollTimeTerm = 3000;
	
	//댓글 크롤링시에 스크롤 아래로 계속 내리는 시간간격
	public final int CommentScrollTimeTerm = 3000;
	
	//10대 , 20대 등 키워드 검색후 캡차를 풀기까지 기다려주는 시간
	public final int SearchAfterWaitingSolveCaptha = 10000;
	
}
