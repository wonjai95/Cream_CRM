/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 스프링 시큐리티 - 로그인 성공 페이지
*/
package com.spring.Creamy_CRM.AuthService;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.spring.Creamy_CRM.VO.AuthVO;

public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		AuthVO vo = (AuthVO) authentication.getPrincipal();
		System.out.println("uservo => " +vo);
		String authority = vo.getAuthorities().toString();
		System.out.println(authority);
		
		request.getSession().setAttribute("authority", authority);
		request.getSession().setAttribute("id", vo.getUsername());
		System.out.println(vo.getUsername());
		
		String msg = authentication.getName() +"님 환영합니다.";
		System.out.println(msg);
		request.setAttribute("msg", msg);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/mainweb/logincheck.jsp");
		dispatcher.forward(request, response);
		
	}


}
