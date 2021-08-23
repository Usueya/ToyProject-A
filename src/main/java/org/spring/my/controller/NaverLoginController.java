package org.spring.my.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.spring.my.dto.Ymember;
import org.spring.my.service.NaverLoginService;
import org.spring.my.service.YmemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("naverlogin")
public class NaverLoginController {
	
	@Autowired
	private YmemberService yMemberService;
	
	@Autowired
	private NaverLoginService naverLoginService;
	
	//네아로 callback
	@RequestMapping("callback")
	public String callback(String code, String state, HttpSession session) throws Exception{
		String access_token = naverLoginService.getToken(code, state); //토큰얻기
		Map<String, String> resultMap = naverLoginService.getNaverUserInfo(access_token); //유저정보얻기
		naverLoginService.insert(resultMap); //네이버 아이디로 회원가입
		
		Ymember ymember = yMemberService.selectOne(resultMap.get("id"));
		
		//session.setAttribute("userid", resultMap.get("email")); //세션에 저장
		session.setAttribute("userid", ymember.getUserid()); //세션에 저장
		session.setAttribute("admin", ymember.getAdmin()); //세션에 저장
		return "redirect:/main";
	}
	
}
