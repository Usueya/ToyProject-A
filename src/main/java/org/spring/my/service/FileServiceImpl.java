package org.spring.my.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileServiceImpl implements FileService{
	
	//경로설정은 root-context.xml bean생성 후 자동주입
	@Autowired
	private String uploadDir;

	//파일을 폴더에 저장하고 파일명을 리턴
	@Override
	public String fileUpload(MultipartFile file) {
		
		//원본파일이름
		String originfilename = file.getOriginalFilename(); 
		
		//파일이 없다면, 공백으로 return
		if(originfilename =="") return "";
		
		//파일명이 같았을 경우의 정책
		//파일이름을 겹치지 않도록 1/1000초 단위로 시간을 파일명 앞에 붙여서 생성
		String filename = System.currentTimeMillis()+originfilename;
		
		//경로와 이름을 가진 객체
		//uploadDir > "E:/academy/08_Spring/yclass_upload"
		File f = new File(uploadDir, filename); 
		
		
		try {
			//파일을 올려주는 메소드 > 지정한 경로에 저장
			file.transferTo(f);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return filename;
	}
	
	@Override
	public void fileDownload(String filename, HttpServletResponse response) throws Exception{
		//다운로드 폴더
		String fileUrl = uploadDir + "/" +filename;
		//파일 읽기 스트림
		FileInputStream fis = new FileInputStream(fileUrl);
		
		//파일이름 인코딩
		filename = URLEncoder.encode(filename, "utf-8");
		//응답객체의 헤더설정 변경(첨부파일로 값변경)
		response.setHeader("Content-Disposition", "attachment;filename="+filename);
		
		//파일 보내기 스트림
		OutputStream out = response.getOutputStream();
		//fis 읽어서 out에 내보냄
		FileCopyUtils.copy(fis, out);
		
	}

}
