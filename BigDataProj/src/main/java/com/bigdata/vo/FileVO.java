package com.bigdata.vo;
//
//public class FileVO {
//	private String file_name, original_file_name;
//	private int board_no;
//	
//	public FileVO() {;}
//
//	public String getFile_name() {
//		return file_name;
//	}
//
//	public void setFile_name(String file_name) {
//		this.file_name = file_name;
//	}
//
//	public String getOriginal_file_name() {
//		return original_file_name;
//	}
//
//	public void setOriginal_file_name(String original_file_name) {
//		this.original_file_name = original_file_name;
//	}
//
//	public int getBoard_no() {
//		return board_no;
//	}
//
//	public void setBoard_no(int board_no) {
//		this.board_no = board_no;
//	}
//	
//	
//}

//기존것
public class FileVO {
  	private int board_no; 			//NUMBER,
    private String file_name; 			//VARCHAR2(4000),
  	private String file_path;			//varchar2(4000),
    private String orignal_file_name; 	//VARCHAR2(4000) NOT NULL,
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getOrignal_file_name() {
		return orignal_file_name;
	}
	public void setOrignal_file_name(String orignal_file_name) {
		this.orignal_file_name = orignal_file_name;
	}
    
}