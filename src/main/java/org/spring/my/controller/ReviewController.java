package org.spring.my.controller;

import javax.servlet.http.HttpSession;

import org.spring.my.dto.Yreview;
import org.spring.my.service.YreviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("review")
public class ReviewController {
	
	@Autowired
	YreviewService yReviceService;
	
	@PostMapping("add")
	public String reviewAdd(Yreview yReview, Model model, HttpSession session ) {
		yReviceService.reviewAdd(yReview);
		model.addAttribute("msg", "리뷰가 등록되었습니다.");
		return "redirect:/mypages/userclasses";
	}

}
