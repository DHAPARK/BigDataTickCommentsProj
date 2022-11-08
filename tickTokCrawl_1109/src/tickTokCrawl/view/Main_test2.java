package tickTokCrawl.view;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import tickTokCrawl.DAO.CrawlHref_2;
import tickTokCrawl.VO.Config_win;
import tickTokCrawl.controller.Controller_yt;

public class Main_test2 {
	public static void main(String[] args) throws InterruptedException {
		
		Controller_yt ct = new Controller_yt();
		
		ct.activate();
	}
}
