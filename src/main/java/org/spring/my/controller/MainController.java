package org.spring.my.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.spring.my.service.MapService;
import org.spring.my.service.NaverLoginService;
import org.spring.my.service.YmemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MainController {
	
	@Autowired
	private NaverLoginService naverLoginService;
	
	@Autowired
	private YmemberService yMemberService;
	
	@Autowired
	private MapService mapService;

	//메인화면으로이동
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String home(Model model) {
		return "main";
	}
	
	//회사안내페이지이동
	@RequestMapping(value = "contact", method = RequestMethod.GET)
	public String contact(Model model) throws Exception {
		String address = "서울특별시 관악구 관악로 145";
		Map<String, String> resultMap = mapService.getXY(address);
		model.addAttribute("resultMap", resultMap);
		return "contact";
	}

	//로그인폼으로이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) throws Exception{
		//네아로 ${apiURL} 생성 후 로그인 폼으로 이동
		 Map<String, String> resultMap = naverLoginService.getApiUrl();
		 session.setAttribute("state", resultMap.get("state"));
		 model.addAttribute("apiURL", resultMap.get("apiURL"));
		return "login";
	}
	
	//로그인후세션저장
	@PostMapping("login")
	public String login(String userid, String passwd, Model model, HttpSession session) throws Exception{
		//rcode >> 0:정상로그인, 1:미가입아이디, 2:비밀번호불일치
		Map<String, Object>  resultMap = yMemberService.login(userid, passwd);

		if((int)resultMap.get("rcode") == 0) {
			//로그인 성공시 세션에 아이디 저장
			session.setAttribute("userid", userid);
			session.setAttribute("admin", (String)resultMap.get("admin"));
			return "redirect:main";
		}else {
			model.addAttribute("msg", resultMap.get("msg"));
			return "redirect:login";
		}
	}
	
	//로그아웃
	@GetMapping("logout")
	public String logout(String userid, HttpSession session, RedirectAttributes rttr) {
		session.invalidate(); //모든 세션의 변수 삭제
		rttr.addFlashAttribute("msg", "로그아웃되었습니다.");
		return "redirect:main";
	}
	
}
