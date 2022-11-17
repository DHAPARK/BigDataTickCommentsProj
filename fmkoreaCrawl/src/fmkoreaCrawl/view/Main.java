package fmkoreaCrawl.view;

import fmkoreaCrawl.dao.Crawler;

public class Main {

	public static void main(String[] args) throws InterruptedException {

		Crawler cr = new Crawler();
		
		cr.activate();
	}
}
