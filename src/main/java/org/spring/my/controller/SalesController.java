package org.spring.my.controller;

import org.spring.my.dto.Ysales;
import org.spring.my.service.YsalesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("sales")
public class SalesController {
	
	@Autowired
	YsalesService ySalesService;

	//클래스신청
	@PostMapping(value = "add")
	public String salesAdd(Ysales ySales) {
		ySalesService.salesAdd(ySales);
		return "redirect:/mypages/userclasses";
	}
	
	//클래스신청내용 수정폼으로 이동
	@GetMapping(value = "modify")
	public String salesModifyForm(int salenum, Model model) {
		Ysales resultSale = ySalesService.selectOne(salenum);
		model.addAttribute("resultSale", resultSale);
		return "mypages/userclassmodify";
	}
	
	//클래스신청내용 수정후 리스트로 이동
	@PostMapping(value = "modify")
	public String saleModify(Ysales ySales) {
		ySalesService.saleUpdate(ySales);
		return "redirect:/mypages/userclasses";
	}
	
	//신청한 클래스 삭제
	@GetMapping(value = "delete")
	public String saleDelete(int salenum) {
		ySalesService.saleDelete(salenum);
		return "redirect:/mypages/userclasses";
	}
	
	
}
