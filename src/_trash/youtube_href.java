package _trash;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import youtube_crawl.vo.ChromeOpt;
import youtube_crawl.vo.Config_win;


public class youtube_href  {

	/*
	 *  1. main_href 에서 담겨진 url 링크에 접속한다 
	 *  
	 *  2. 접속한 url 에 List<WebElement> comments 를 통해 댓글들을 담는다 ( 100개만 )  
	 *  
	 *  3. 담겨진 comments 데이터를 DTO 에 담는다 
	 *  
	 *  4. DTO 에 담겨진 comments 를 DAO 로 보내, DB 에 접근 시킨다 
	 */
	
	ChromeOpt copt;
	JavascriptExecutor js;
	Config_win config_w;
	WebDriver wd;
	
	
	ArrayList<String> allUrlList;
		
	
		
		
		
		
}
