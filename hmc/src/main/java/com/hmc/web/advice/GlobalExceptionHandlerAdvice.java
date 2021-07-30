package com.hmc.web.advice;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.hmc.exception.FindException;
import com.hmc.exception.SampleException;

@ControllerAdvice
public class GlobalExceptionHandlerAdvice {
	
	/*
	 * SampleException
	 * 		- 애플리케이션에서 업무로직 예외와 관련 모든 예외클래스의 부모클래스다.
	 * 		- 애플리케이션에서 업무로직 예외가 발생하면 handleSampeException()가 예외를 처리한다.
	 * 		- 본 예외처리 메소드에서는 error폴더의 business.jsp로 내부이동시킨다.
	 */
	@ExceptionHandler(FindException.class)
	public String handleSampleException(FindException ex, Model model) {
		model.addAttribute("error", ex);
		return "error/userNotFound";
	}

	
}
