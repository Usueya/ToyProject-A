package org.spring.my.advice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

//controller에서 발생한 Exception을 전문적으로 처리하는 클래스
@ControllerAdvice
public class CommonExceptionAdvice {
	
	//Exception이 발생되면 핸들링할 수 있는 클래스
	@ExceptionHandler(Exception.class)
	public String common(Exception e, Model model) {
		
		System.out.println("Exception 발생!");
		//어떤 예외가 발생되었는지 console창에 출력
		System.out.println(e.toString());
		e.printStackTrace();
		//Exception이 발생될때 사용자에게 보여줄 화면
		
		//뷰에서 에러 메세지 출력할 경우 Model을 이용해 가져가기
		model.addAttribute("err", e);
		return "error/error";
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public String common404(HttpServletRequest request, Exception e, Model model) {
		System.out.println("Exception 발생!");
		System.out.println(e.toString());
		
		
		model.addAttribute("url", request.getRequestURL());
		return "error/error";
	}
	

}
