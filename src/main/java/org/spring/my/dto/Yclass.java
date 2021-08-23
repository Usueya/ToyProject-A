package org.spring.my.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Yclass {
	private int clsnum;
	private String clsname;
	private String teacherid;
	private String clsdate;
	private String clstime;
	private int clsprice;
	private int clsnumber;
	private String filename;
	private int readcnt;
	private int likecnt;
	private int  dislikecnt;
	private String regdate;
	private String modifydate;
	
	private String name; //강사이름
	private String state; //유저의 리액션상태
	private int reviewcnt; //리뷰갯수
	
	private MultipartFile files;
}
