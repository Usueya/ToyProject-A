package org.spring.my.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.spring.my.dto.Page;
import org.spring.my.dto.Yclass;
import org.spring.my.dto.Ymember;
import org.spring.my.dto.Ysales;
import org.spring.my.service.YclassService;
import org.spring.my.service.YmemberService;
import org.spring.my.service.YreviewService;
import org.spring.my.service.YsalesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("mypages")
public class MyPageController {
	
	@Autowired
	YmemberService yMemberService;
	@Autowired
	YclassService yClassService;
	@Autowired
	YsalesService ySalesService;
	@Autowired
	YreviewService yReviceService;

	//관리자_페이지로이동(회원정보조회/총회원수)
	@RequestMapping(value = "adminpage", method = RequestMethod.GET)
	public String adminPage(Model model) throws Exception{
		List<Ymember> resultList = yMemberService.selectList();
		model.addAttribute("resultList", resultList);
		return "mypages/adminpage";
	}
	
	//관리자_어드민변경페이지이동
	@RequestMapping(value = "adminmodify", method = RequestMethod.GET)
	public String adminmodify(String userid, Model model) throws Exception {
		Ymember resultUser = yMemberService.selectOne(userid);
		model.addAttribute("resultUser", resultUser);
		return "mypages/adminmodify";
	}
	
	//관리자_클래스리스트페이지이동
	@RequestMapping(value = "classlist", method = RequestMethod.GET)
	public String classList(@ModelAttribute("page") Page page, Model model) throws Exception{
		List<Yclass> resultList = yClassService.selectClassList();
		model.addAttribute("resultList", resultList);
		return "mypages/classlist";
	}
	
	//관리자_클래스등록페이지이동(강사리스트)
	@RequestMapping(value = "classadd", method = RequestMethod.GET)
	public String classAdd(Model model) throws Exception {
		List<Ymember> teacherList = yClassService.selectTeacherList();
		model.addAttribute("teacherList", teacherList);
		return "mypages/classadd";
	}
	
	//회원_프로필페이지이동
	@RequestMapping(value = "userprofile", method = RequestMethod.GET)
	public String userProfile(HttpSession session, Model model) throws Exception {
		String userid = (String)session.getAttribute("userid");
		Ymember resultUser = yMemberService.selectOne(userid);
		model.addAttribute("resultUser", resultUser);
		return "mypages/userprofile";
	}
	
	//회원_클래스페이지이동
	@RequestMapping(value = "userclasses", method = RequestMethod.GET)
	public String userClasses(HttpSession session, Model model) throws Exception{
		String userid = (String)session.getAttribute("userid");
		List<Ysales> userSales = ySalesService.selectListUser(userid);
		model.addAttribute("userSales", userSales);
		return "mypages/userclasses";
	}
	
	//회원_리뷰작성페이지이동
	@RequestMapping(value = "userreview", method = RequestMethod.GET)
	public String userReview(int salenum, HttpSession session, Model model) throws Exception{
		
		//리뷰작성여부 확인
		String userid = (String)session.getAttribute("userid");
		
		if(yReviceService.selectOne(userid, salenum) != null) {
			model.addAttribute("msg", "이미 작성된 리뷰입니다.");
			return "redirect:/mypages/userclasses";
		}else {
			Ysales userSales = ySalesService.selectOne(salenum);
			model.addAttribute("userSales", userSales);
			return "mypages/userreview";
		}
		
	}
	
}
