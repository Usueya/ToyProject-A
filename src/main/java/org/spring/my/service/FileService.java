package org.spring.my.service;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {
	//파일을 폴더에 저장하고 파일명을 리턴
	public String fileUpload(MultipartFile file);
	
	//파일다운로드
	public void fileDownload(String filename, HttpServletResponse response) throws Exception;

	
	
}
