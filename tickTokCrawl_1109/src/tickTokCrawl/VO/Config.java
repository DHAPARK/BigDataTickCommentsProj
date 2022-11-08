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
	
	// 틱톡 href - 링크 담겨있는 태그 class name 
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
	
	// 댓글 값 담겨있는 태그 
	public final String EVCTClassName = "tiktok-q9aj5z-PCommentText" ;
	
	// 더보기 버튼 태그 
	public final String seeMoreBtnName = "tiktok-154bc22-ButtonMore" ;
	
	//mainPage
	public final String mainPage = "https://www.tiktok.com";
	// 검색 태그 
	public final String mainPageInputTag = "tiktok-zx5sa-InputElement" ;
	// 댓글 값 태그 
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
	
	
	
	
	//50
	public final String youtube_Age_50_URL = "https://www.youtube.com/results?search_query=50%EB%8C%80" ;
	//40
	public final String youtube_Age_40_URL = "https://www.youtube.com/results?search_query=40%EB%8C%80" ;
	//30
	public final String youtube_Age_30_URL = "https://www.youtube.com/results?search_query=20%EB%8C%80" ;
	//20
	public final String youtube_Age_20_URL = "https://www.youtube.com/results?search_query=20%EB%8C%80" ;
	//10
	public final String youtube_Age_10_URL = "https://www.youtube.com/results?search_query=10%EB%8C%80" ;
	
	
	public final String mainPageYoutube = "https://www.youtube.com/";
	
	public final String InputYoutube = "gsfi ytd-searchbox"; 
	
	public final String seeMoreYoutube = "style-scope ytd-vertical-list-renderer";
	
//	public final String Youtubehref = "yt-simple-endpoint style-scope ytd-video-renderer";
	public final String Youtubehref = "yt-simple-endpoint inline-block style-scope ytd-thumbnail";
//	public final String Youtubehref = "yt-simple-endpoint inline-block style-scope ytd-thumbnail";
	public final String Youtubehref_id = "video-title";
	
	
	public final String YoutubeComment = "style-scope ytd-comment-renderer";
	// id = content-text
}
