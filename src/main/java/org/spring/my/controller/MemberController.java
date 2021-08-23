package org.spring.my.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.spring.my.dto.Ymember;
import org.spring.my.service.MailSendService;
import org.spring.my.service.YmemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	YmemberService yMemberService;
	
	@Autowired
	MailSendService mailSendService;
	
	//회원가입폼으로이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String createAccount() throws Exception{
		return "member/join";
	}
	
	//회원가입시아이디중복여부확인
	@ResponseBody
	@GetMapping(value = "checkId/{userid}", produces = "application/text; charset=utf-8")
	public String checkId(@PathVariable("userid") String userid) throws Exception{
		
		if(yMemberService.selectOne(userid)==null) {
			return "available ID";
		}else {
			return "already used ID";
		}
	}
	
	//회원가입후로그인폼으로이동
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String createAccount(Ymember ymember, Model model) throws Exception{
		Map<String, Object> resultMap = yMemberService.createAccount(ymember);
		model.addAttribute("msg", resultMap.get("msg"));
		return "redirect:/login";
	}
	
	//프로필수정페이지로이동
	@GetMapping(value = "modify")
	public String modify(HttpSession session, Model model) throws Exception {
		String userid = (String)session.getAttribute("userid");
		Ymember resultUser = yMemberService.selectOne(userid);
		model.addAttribute("resultUser", resultUser);
		return "/mypages/userprofilemodify";
	}
	
	//회원정보에서 emailAuth_Unverified 상태 클릭시
	@ResponseBody
	@RequestMapping("emailAuth")
	public String emailAuth(String userid, String email, HttpSession session) throws Exception{
		String authCode = mailSendService.sendAuthMail(email, userid);
		session.setAttribute(userid, authCode);
		session.setMaxInactiveInterval(30*60);//30분 유효 60초 * 30분
		return "ok";
	}
	
	//인증메일을 클릭했을 때
	@RequestMapping("joinConfirm")
	public String joinConfirm(String userid, String authCode, 
							HttpSession session, Model model) throws Exception{
		
		String sessionAuthCode = (String) session.getAttribute(userid);
		//인증키 검증
		if(sessionAuthCode == null) {
			//세션기간이 종료된 경우 인증키 소멸
			model.addAttribute("msg","세션기간만료");
			return "redirect:/main";
			
		}else if(sessionAuthCode.equals(authCode)) {
			//유저아이디의 authCode 일치 여부
			model.addAttribute("msg","인증성공");
			yMemberService.updateEmailAuth(userid);
			return "redirect:/mypages/userprofile";
			
		}else {
			model.addAttribute("msg","인증키불일치");
			return "redirect:/mypages/userprofile";
			
		}
	}
	
	//주소팝업 폼으로 이동하기
	@RequestMapping("jusoPopup")
	public String jusoPopup() {
		return "member/jusoPopup";
	}
	
	//프로필수정후상세페이지로이동
	@PostMapping(value = "modify")
	public String modify(String oldfiles, Ymember yMember,
						HttpSession session, Model model) throws Exception {
		yMemberService.update(oldfiles, yMember);
		return "redirect:/mypages/userprofile";
	}
	
	//Admin변경
	@RequestMapping("adminChange")
	public String adminChange(String userid, String admin, Model model) {
		yMemberService.updateAdmin(userid, admin);
		model.addAttribute("userid", userid);
		return "redirect:/mypages/adminpage";
	}
	
	//회원탈퇴
	@GetMapping(value="delete")
	public String delete(HttpSession session, Model model, RedirectAttributes rttr) {
		String userid = (String)session.getAttribute("userid");
		yMemberService.delete(userid);
		session.invalidate(); //모든 세션의 변수 삭제
		rttr.addFlashAttribute("msg", "정상처리되었습니다.");
		return "redirect:/main";
	}

}
