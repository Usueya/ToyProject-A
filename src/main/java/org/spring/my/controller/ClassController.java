package org.spring.my.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.spring.my.dto.Page;
import org.spring.my.dto.Yclass;
import org.spring.my.dto.Ymember;
import org.spring.my.service.YclassService;
import org.spring.my.service.YreviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("class")
@SessionAttributes("page")
public class ClassController {
	
	@Autowired
	private YclassService yClassService;
	
	@Autowired
	private YreviewService yReviewService;
	
	//세션생성
	@RequestMapping("/")
	public String home(Page page, Model model)  throws Exception{
		//Model생성 @SessionAttributes
		model.addAttribute("page", page);
		return "redirect:/class/main";
	}
	
	//클래스메인페이지이동
	@GetMapping(value = "main")
	public String classmain(@ModelAttribute("page") Page page, Model model) throws Exception {
		List<Yclass> resultList = yClassService.selectClassListPage(page);
		model.addAttribute("page", page);
		model.addAttribute("resultList", resultList);
		return "classes/main";
	}
	
	//클래스상세페이지이동
	@GetMapping(value = "classdetail")
	public String classdetail(int clsnum, Model model, HttpSession session) throws Exception{
		
		//조회수 +1
		String userid= (String)session.getAttribute("userid");
		yClassService.updateReadCnt(clsnum, userid);
		
		//클래스조회
		Map<String, Object> findmap = new HashMap<>();
		findmap.put("clsnum", clsnum);
		findmap.put("userid", userid);
		Yclass resultClass = yClassService.selectOne(findmap);
		
		//클래스의 후기조회
		 List<Map<String, Object>> reviewList = yReviewService.selectList(clsnum);
		
		model.addAttribute("resultClass", resultClass);
		model.addAttribute("reviewList", reviewList);
		
		return "classes/detail";
	}
	
	//클래스 판매페이지이동
	@GetMapping(value = "sales")
	public String classsales(int clsnum, Model model, HttpSession session) throws Exception {
		//클래스조회
		Yclass resultClass = yClassService.selectOne(clsnum);
		model.addAttribute("resultClass", resultClass);
		
		return "classes/sales";
	}
	
	//관리자클래스등록
	@PostMapping(value = "add")
	public String add(Yclass yClass) throws Exception{
		yClassService.add(yClass);
		return "redirect:/mypages/classlist";
	}
	
	//클래스상세폼으로이동
	@GetMapping(value = "detail")
	public String detail(int clsnum, Model model) throws Exception{
		//클래스조회
		Yclass resultClass = yClassService.selectOne(clsnum);
		model.addAttribute("resultClass", resultClass);
		return "mypages/classdetail";
	}
	
	//클래스수정폼이동
	@GetMapping(value = "modify")
	public String modify(int clsnum, Model model) throws Exception{
		//강사리스트
		List<Ymember> resultList = yClassService.selectTeacherList();
		//클래스조회
		Yclass resultClass = yClassService.selectOne(clsnum);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("resultClass", resultClass);
		return "mypages/classmodify";
	}
	
	//클래스삭제
	@GetMapping(value = "delete")
	public String delete(int clsnum) throws Exception{
		yClassService.deleteClass(clsnum);
		return "redirect:/mypages/classlist";
	}
	
	//클래스내용수정
	@PostMapping(value = "modify")
	public String modify(String oldfiles, Yclass yClass, Model model) throws Exception{
		yClassService.update(oldfiles, yClass);
		return "redirect:/mypages/classlist";
	}
	
	
	//좋아요처리
	@ResponseBody
	@GetMapping("like/{clsnum}")
	public String like(@PathVariable("clsnum") int clsnum, HttpSession session)  throws Exception{
		String userid=(String)session.getAttribute("userid");
		yClassService.updateLikeCnt(clsnum, userid);
		return "ok";
	}
	
	//좋아요취소처리
	@ResponseBody
	@GetMapping("likeCancel/{clsnum}")
	public String likeCancel(@PathVariable("clsnum") int clsnum, HttpSession session)  throws Exception{
		String userid=(String)session.getAttribute("userid");
		yClassService.updateLikeCntCancel(clsnum, userid);
		return "ok";
	}

}
