package fmkoreaCrawl.dao;

import fmkoreaCrawl.EachAgeCrawlThread.Get10SC;
import fmkoreaCrawl.EachAgeCrawlThread.Get20SC;
import fmkoreaCrawl.EachAgeCrawlThread.Get30SC;
import fmkoreaCrawl.EachAgeCrawlThread.Get40SC;
import fmkoreaCrawl.EachAgeCrawlThread.Get50SC;

public class Crawler {
	
	public void activate () {
		
		new Thread( new Get10SC() ).start() ;
		
		new Thread( new Get20SC() ).start() ;
		
		new Thread( new Get30SC() ).start() ;
		
		new Thread( new Get40SC() ).start() ;
		
		new Thread( new Get50SC() ).start() ;
	}
}
