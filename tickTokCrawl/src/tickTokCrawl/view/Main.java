package tickTokCrawl.view;

import tickTokCrawl.VO.Config;
import tickTokCrawl.controller.Controller;

public class Main {

	public static void main(String[] args) throws InterruptedException {

		Controller ct = new Controller();
		
		ct.get10SC( Config.cf.mainPage ) ;
		
	}

}
