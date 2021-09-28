/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 스프링 시큐리티 - 권한 오류 denied 페이지
 * 페이지에서 denied 발생한 경우 대부분은 csrf input안한거..확인하기
*/
package com.spring.Creamy_CRM.AuthService;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class UserDeniedHandler implements AccessDeniedHandler{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		request.setAttribute("errMsg", "관리자만 접근가능페이지");
		System.out.println("denied - "+request.getPathInfo()+" "+request.getRequestURI());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/denied.jsp");
		dispatcher.forward(request, response);
	}

}
