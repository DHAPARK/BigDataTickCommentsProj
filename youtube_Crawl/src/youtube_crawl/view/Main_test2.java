package youtube_crawl.view;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import youtube_crawl.controller.Controller_yt;
import youtube_crawl.dao.*;
import youtube_crawl.vo.*;

public class Main_test2 {
	public static void main(String[] args) throws InterruptedException {
		
		Controller_yt ct = new Controller_yt();
		
		ct.activate();
		
		
	}
}
