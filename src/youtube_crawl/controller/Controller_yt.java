package youtube_crawl.controller;

import youtube_crawl.eachAgeCrawlThread.Get10_yt;
import youtube_crawl.eachAgeCrawlThread.Get20_yt;
import youtube_crawl.eachAgeCrawlThread.Get30_yt;
import youtube_crawl.eachAgeCrawlThread.Get40_yt;
import youtube_crawl.eachAgeCrawlThread.Get50_yt;
import youtube_crawl.eachAgeCrawlThread.Get_test;

public class Controller_yt {
	
	public void activate() throws InterruptedException {
		
		new Thread( new Get10_yt()).start();
		Thread.sleep(10000);
		
		new Thread( new Get20_yt()).start();
		Thread.sleep(10000);
		
		new Thread( new Get30_yt()).start();
		Thread.sleep(10000);
		
		new Thread( new Get40_yt()).start();
		Thread.sleep(10000);
		
		new Thread( new Get50_yt()).start();
		Thread.sleep(10000);
		
	}
}
