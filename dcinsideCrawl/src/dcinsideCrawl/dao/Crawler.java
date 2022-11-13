package dcinsideCrawl.dao;

import dcinsideCrawl.EachAgeCrawlThread.Get10SC;
import dcinsideCrawl.EachAgeCrawlThread.Get20SC;
import dcinsideCrawl.EachAgeCrawlThread.Get30SC;
import dcinsideCrawl.EachAgeCrawlThread.Get40SC;
import dcinsideCrawl.EachAgeCrawlThread.Get50SC;

public class Crawler {
	
	public void activate () {
		
		new Thread( new Get10SC() ).start() ;
		
		new Thread( new Get20SC() ).start() ;
		
		new Thread( new Get30SC() ).start() ;
		
		new Thread( new Get40SC() ).start() ;
		
		new Thread( new Get50SC() ).start() ;
	}
}
