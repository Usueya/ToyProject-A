package org.spring.my.service;

import java.util.Map;

public interface NaverLoginService {
	//네이버 apiURL생성
	public Map<String, String> getApiUrl() throws Exception;
	//token얻기
	public String getToken(String code, String state) throws Exception;
	//개인정보 얻기
	public Map<String, String> getNaverUserInfo(String access_token) throws Exception;
	public void insert(Map<String, String> resultMap);
}
