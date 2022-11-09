//package tickTokTrash.trash;
//
//import java.awt.Image;
//import java.awt.image.BufferedImage;
//import java.awt.image.PixelGrabber;
//import java.io.File;
//import java.io.IOException;
//import java.net.URL;
//import java.util.ArrayList;
//
//import javax.imageio.ImageIO;
//import javax.swing.ImageIcon;
//
//import org.openqa.selenium.By;
//import org.openqa.selenium.Keys;
//import org.openqa.selenium.WebDriver;
//import org.openqa.selenium.WebElement;
//
//import tickTokCrawl.VO.Config;
//
///*
// * 폐기 ( 캡챠를 selenium으로 푸는건 불가능할듯.. )
// * 
// */
///*
//public class SolveCaptha {
//	// 퍼즐의 해결 좌표를 알아내는 과정 x축임
//	public int[] getPuzzleTmxY() {
//
//		
//		 * 억지로 위에선 높이 등 구함
//		 
//		int tmXY[] = new int[2];
//		
//		String bitMap[][] = null;
//		
//		int flagCnt = 0;
//
//		Image image = new ImageIcon("./capthaImg.png").getImage();
//
//		int width = image.getWidth(null);
//
//		int height = image.getHeight(null);
//
//		//현재색
//		int red = 0 ;
//		
//		int green = 0 ;
//
//		int blue = 0 ;
//		//현재색 
//		
//		String result = "";
//		
//		int[] pixels = new int[width * height];
//
//		Image scaleImage = image.getScaledInstance(width, height, Image.SCALE_DEFAULT);
//
//		System.out.println("너비 " + width);
//		System.out.println("세로 " + height);
//
//		
//		
//		PixelGrabber pg = new PixelGrabber(scaleImage, 0, 0, width, height, pixels, 0, width);
//
//		bitMap = new String[ width ][ height ] ;
//		
//		
//		
//		try {
//			pg.grabPixels();
//
//			System.out.println("분석을 한번 해보면...");
//
//		} catch (InterruptedException e) {
//
//			e.printStackTrace();
//
//		}
//
//		System.out.println("분석을 한번 해보면..");
//
//		boolean flag = false ;
//		
//		for (int i = 0; i < width; i++) {
//
//			if ( flag ) break ;
//			
//			for (int j = 0; j < height; j++) {
//
//				int onePixel = pixels[i * j];
//
//				red = (onePixel >> 16) & 0xff;
//				
//				green = (onePixel >> 8) & 0xff;
//
//				blue = onePixel & 0xff;
//				
//				
//				
//				/*
//				 * red : 240이상 green은 230이상 blue는 210이상 찍히네 도합 680쯤이면 테두리란 얘기
//				 */
//				
//				if ( (i > (int) (width / 4)) && ( red < 40 && green < 40 && blue < 40 ) ) {
//					
//					System.out.printf("포착 : red : %d , green : %d , blue : %d" , red  , green  , blue );
//					
//					boolean littleFlag = false ;   
//					
//					for ( int n = 0 ; n < 10 ; n++ ) {
//						
//						int litterPixel = pixels[ i * j+n ] ;
//						
//						int littedRed = ( litterPixel >> 16 ) & 0xff ;
//						int littedGreen = ( litterPixel >> 8 ) & 0xff ;
//						int littedBlue = ( litterPixel ) & 0xff ;
//						
//						if ( littedRed < 40 && littedGreen < 40 && littedBlue < 40 ) littleFlag = true ;
//						
//					}
//					
//					if ( littleFlag ) {
//						
//						tmXY[ 0 ] = i ;
//						tmXY[ 1 ] = j ;
//						
//						flag = true ;
//						
//						break ;
//						
//					}
//					
//					
//					
//				}
//
//			}
//
//		}
//		
//		return tmXY;
//		
//	}
//
//	/*
//	 * 웹에서 캡차 이미지 주소를 불러와 로컬폴더에 저장하는 메서드
//	 */
//
//	public void downLoadImg(WebDriver wd) {
//
//		try {
//
//			try {
//
//				Thread.sleep(5000);
//
//			} catch (InterruptedException e1) {
//
//				e1.printStackTrace();
//
//			}
//
//			ArrayList<WebElement> capthaImg = (ArrayList<WebElement>) wd.findElements(By.id("captcha-verify-image"));
//
//			String imgUrl = capthaImg.get(0).getAttribute("src");
//			// 이미지 엘리먼트 다운로드
//			BufferedImage saveImage = null;
//
//			saveImage = ImageIO.read(new URL(imgUrl));
//
//			if (saveImage != null) {
//
//				try {
//
//					String fileName = "capthaImg";
//
//					ImageIO.write(saveImage, "png", new File("./" + fileName + ".png"));
//
//					System.out.println(imgUrl);
//
//				} catch (IOException e) {
//
//					wd.quit();
//
//					System.out.println("성공적으로 종료");
//
//				}
//
//			}
//
//		} catch (IOException e) {
//
//			e.printStackTrace();
//
//			wd.quit();
//
//			System.out.println("에러 발생 후 성공적으로 종료 ");
//
//		}
//
//	}
//
//	void searchEachAgeVideo(String age, WebDriver wd) {
//
//		ArrayList<WebElement> inputTag = (ArrayList<WebElement>) wd.findElements(By.className(Config.cf.mainPageInputTag));
//
//		inputTag.get(0).sendKeys(age);
//
//		inputTag.get(0).sendKeys(Keys.RETURN);
//
//	}
//}
//*/
