package tickTokCrawl.controller;

import tickTokCrawl.EachAgeCrawlThread.Get10_yt;

public class Controller_yt {
	
	public void activate() {
		
		new Thread( new Get10_yt()).start();
	}
}
