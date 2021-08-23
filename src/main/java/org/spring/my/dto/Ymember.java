package org.spring.my.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Ymember {
	private String userid;
	private String passwd;
	private String name;
	private String email;
	private String zip;
	private String addr1;
	private String addr2;
	private String filename;
	private String memo;
	private String admin;
	private String emailauth;
	private String simplejoin;
	private String regdate;
	
	private MultipartFile files;
}
