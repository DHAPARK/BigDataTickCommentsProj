package fmkoreaCrawl.vo;

public class Config {

	public static Config cf = new Config() ;
	
	public final String id = "webdriver.chrome.driver" ;
	
	public final String path = "chromedriver" ;
	/*
	 * https://search.fmkorea.com/post/sort/latest/q/10.EB.8C.80
	 * var items = document.getElementsByClassName("sch_result_list");
	 * console.log(items[0].children[0].children[0].href);
	 * 이게 10대 20대 30대 검색했을때에 디시인사이드 갤러리 게시글로 들어가는 링크를 제공해준다
	 * 정확히는 items[0] 얘의 자식들의 자식들중 0번째의 a태그인데 그 자식의 href을 가져오면 해당 게시글 제목과 연결된 게시글 링크로 들어가게됨
	 * 
	 * EURLTClassName = Each URL Tag Class Name
	 */

	//public final String EURLClassName = "sch_result_list" ;
	
//	public final String EURLSelctor = "#container > div > section.center_content > div.inner > div.integrate_cont.sch_result.result_all > ul > li" ;
	public final String EURLSelctor = "#content > div > ul.searchResult.comment > li:nth-child(" ;
	public final String EURLSelctor2 = ") > dl > dt" ;

	public final String EURLClassName = "searchResult comment";
	
	/*
	 * 디시인사이드 댓글 클래스명
	 * 	var divs = document.getElementsByClassName("usertxt");
	 * 	console.log(divs);
	 * 	console.log(divs.length);
	 * 	console.log(divs[0].innerText);
	 *
	 *	ECTClassName = Each Comments Tag Class Name 
	 */
	
	public final String ECTClassName = "xe_content" ;	
	
	
	/*
	 * 디시인사이드 더보기 버튼 클래스명
	 * 	var items = document.getElementsByClassName("integrate_cont sch_result");
	 * 	console.log(items[0].children[2]);
	 */
	
	//public final String seeMoreBtnXpath = "//*[@id=\"container\"]/div/section[2]/div[1]/div[6]/a" ;
	
	
	/*
	 * 디시인사이드 페이징 div 클래스명 
	 * var page = document.getElementsByClassName("bottom_paging_box");
	 * console.log(page[0].children[1].href);
	 * 
	 */
	public final String paginationDiv = "pagination a1";
	
	public final String pagingBtnSelector = "#content > div > div:nth-child(17) > a:nth-child";
	
	public final String pagingBtnSelector2 = "#cmtPosition > div.bd_pg.clear > a:nth-child";

	//mainPage
	public final String mainPage = "https://www.fmkorea.com/";
	
	//public final String mainPageInputTag = "iText" ;
	
	//public final String mainPageInputTag = "IS_SEARCH" ;
	
	public final String mainPageInputTag = "inputText" ;
	
	public final String commentsTagClassName = "xe_content" ;	
		
	
	
	//50
	public final String fmkorea_Age_50_URL = "https://www.fmkorea.com/search.php?act=IS&is_keyword=50%EB%8C%80";
	//40
	public final String fmkorea_Age_40_URL = "https://www.fmkorea.com/search.php?act=IS&is_keyword=40%EB%8C%80";
	//30
	public final String fmkorea_Age_30_URL = "https://www.fmkorea.com/search.php?act=IS&is_keyword=30%EB%8C%80";
	
	//20
	public final String fmkorea_Age_20_URL = "https://www.fmkorea.com/search.php?act=IS&is_keyword=20%EB%8C%80";
	//10
	public final String fmkorea_Age_10_URL = "https://www.fmkorea.com/search.php?act=IS&is_keyword=10%EB%8C%80";
	
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
	
}
