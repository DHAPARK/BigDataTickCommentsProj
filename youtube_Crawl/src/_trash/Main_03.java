package _trash;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class Main_03 {

	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver"; //드라이버 ID
	public static final String WEB_DRIVER_PATH = "src/main/webapp/WEB-INF/lib/chromedriver.exe"; //드라이버 경로
	
	
	public static void main(String[] args) {
		//드라이버 설정
				try {
					System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				//크롬 설정을 담은 객체 생성
				ChromeOptions options = new ChromeOptions();
				//브라우저가 눈에 보이지 않고 내부적으로 돈다.
				//설정하지 않을 시 실제 크롬 창이 생성되고, 어떤 순서로 진행되는지 확인할 수 있다.
//				options.addArguments("headless");
//				options.addArguments("--start-maximized");
				options.addArguments("--disable-popup-blocking");
				options.addArguments("--disable-default-apps");
				
				
				//위에서 설정한 옵션은 담은 드라이버 객체 생성
				//옵션을 설정하지 않았을 때에는 생략 가능하다.
				//WebDriver객체가 곧 하나의 브라우저 창이라 생각한다.
				WebDriver driver = new ChromeDriver(options);
				
				//이동을 원하는 url
				String url = "https://news.naver.com/";
				
				//WebDriver을 해당 url로 이동한다.
				driver.get(url);
				
				//브라우저 이동시 생기는 로드시간을 기다린다.
				//HTTP응답속도보다 자바의 컴파일 속도가 더 빠르기 때문에 임의적으로 1초를 대기한다.
				try {Thread.sleep(1000);} catch (InterruptedException e) {}
				
				// WebElement는 html의 태그를 가지는 클래스이다.
				// class가 cjs_t인 태그를 가지고 온다.
				List<WebElement> el1 = driver.findElements(By.className("cjs_t"));
				
				for (int i = 0; i < el1.size(); i++) {
					
					System.out.println( el1.get(i).getText());
				}
				
				
				try {
					//드라이버가 null이 아니라면
					if(driver != null) {
						//드라이버 연결 종료
						driver.close(); //드라이버 연결 해제
						
						//프로세스 종료
						driver.quit();
					}
				} catch (Exception e) {
					throw new RuntimeException(e.getMessage());
				}
		
	}

}
