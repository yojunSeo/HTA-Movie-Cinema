package com.hmc.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.MethodParameter;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import com.hmc.web.annotation.LoginUser;
import com.hmc.web.util.SessionUtils;

public class LoginCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		MethodParameter[] methodParameters = handlerMethod.getMethodParameters();
		
		boolean hasLoginUserAnnotation = false;
		for (MethodParameter parameter : methodParameters) {
			if (parameter.getParameterAnnotation(LoginUser.class) != null) {
				hasLoginUserAnnotation = true;
				break;
			}
		}
		
		if (hasLoginUserAnnotation && SessionUtils.getAttribute("LOGINED_USER") == null) {
			
			response.sendRedirect("/hmc/login/?error=deny");	
			return false;
		}
		
		return true;
	}
}
