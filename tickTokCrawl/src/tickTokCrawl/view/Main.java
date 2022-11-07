package tickTokCrawl.view;

import tickTokCrawl.controller.Controller;

public class Main {

	public static void main(String[] args) throws InterruptedException {

		Controller ct = new Controller();

		ct.activate();
		
		// 스레딩 개선전에 사용했던 메서드
		//ct.get10SC( Config.cf.mainPage ) ;
	}
	
}
