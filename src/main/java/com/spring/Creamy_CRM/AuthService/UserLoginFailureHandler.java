/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 스프링 시큐리티 - 로그인 실패 페이지
*/
package com.spring.Creamy_CRM.AuthService;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class UserLoginFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		request.setAttribute("errMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		System.out.println("loginfail");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/mainweb/login.jsp");
		
		dispatcher.forward(request, response);
		
	}

}
