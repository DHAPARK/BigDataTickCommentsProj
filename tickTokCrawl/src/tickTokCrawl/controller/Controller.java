package tickTokCrawl.controller;

import tickTokCrawl.EachAgeCrawlThread.Get10SC;
import tickTokCrawl.EachAgeCrawlThread.Get20SC;
import tickTokCrawl.EachAgeCrawlThread.Get30SC;
import tickTokCrawl.EachAgeCrawlThread.Get40SC;
import tickTokCrawl.EachAgeCrawlThread.Get50SC;

public class Controller {

	
	/*
	 * 10 ~ 50 대의 모든 크롤링 스레드를 한번에 돌리는 메서드
	 */
	public void activate () {
		
		new Thread( new Get10SC() ).start() ;
		
		new Thread( new Get20SC() ).start() ;
		
		new Thread( new Get30SC() ).start() ;
		
		new Thread( new Get40SC() ).start() ;
		
		new Thread( new Get50SC() ).start() ;
		
	}
	
}
