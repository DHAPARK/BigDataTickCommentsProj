package com.bigdata.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.bigdata.action.ActionForward;
import com.bigdata.dao.BoardDAO;
import com.bigdata.vo.FileVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class IMGUploadAction {

	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		FileVO fvo = new FileVO();
		BoardDAO bdao = new BoardDAO();
		String uploadPath = "/upload";
		int size = 10 * 1024 * 1024; // 업로드 사이즈 제한 10M 이하
		String fileName = ""; // 파일명
		MultipartRequest multi = null;

		try {
			multi = new MultipartRequest(req, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String file = (String) files.nextElement();
			fileName = multi.getFilesystemName(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Enumeration params = multi.getParameterNames();

//	 	out.println("----------------------------------------<br>");

		Enumeration files = multi.getFileNames();

		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			fileName = multi.getFilesystemName(name); // 파일 이름 얻기
			String original = multi.getOriginalFileName(name); // 이전 파일 이름 얻기
			String type = multi.getContentType(name);
			File file = multi.getFile(name); // 파일의 참조를 얻음
			String filePath = file.getPath();
			System.out.println("요청들어온 파라미터 이름 : " + name);
			System.out.println("실제 파일 이름 : " + original);
			System.out.println("저장 파일 이름 : " + fileName);
			System.out.println("파일 컨텐츠 유형 : " + type);

			if (file != null) {
				
				System.out.println("파일 크기 : " + file.length());
				System.out.println("파일 경로 : " + file.getPath());
				System.out.println("최종 수정일 : " + file.lastModified());
				
				fvo.setFile_path(filePath);
				fvo.setFile_name(fileName);
				fvo.setOrignal_file_name(original);
				bdao.insertFile(fvo);

				uploadPath += "/" + fileName;
				JSONObject jobj = new JSONObject();
				jobj.put("url", uploadPath);
				jobj.put("fileName", fileName);
				resp.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
				PrintWriter out = resp.getWriter();
				out.print(jobj.toJSONString());
				System.out.println("자손 : " + jobj.toJSONString());
			}
			System.out.println("-------------------------------------------------------------");
		}
	}
}