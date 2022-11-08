package tickTokCrawl.VO;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.WebDriverWait;

public class Config_win {
	

	public static Config_win cf = new Config_win() ;
	
	public final String id = "webdriver.chrome.driver" ;
	
	public final String path = "chromedriver.exe" ;
	
	
	public final String EVURLClassName = "tiktok-yz6ijl-DivWrapper" ;

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
	
	public final String Youtubehref = "yt-simple-endpoint inline-block style-scope ytd-thumbnail";
	public final String Youtubehref_id = "video-title";
	
	public String url_ = "20대";
	
	public String getUrl_() {
		return url_;
	}

	public void setUrl_(String url_) {
		this.url_ = url_;
	}
	
	
	// test 
	public String href_url ; 
	
	
	public String getHref_url() {
		return href_url;
	}

	public void setHref_url(String href_url) {
		this.href_url = href_url;
	}



	
	
}
