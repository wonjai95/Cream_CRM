/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * CRM메인화면 - 홈화면 및 마이페이지, 환경설정 등 들어올 예정
 * 
*/
package com.spring.Creamy_CRM.Host_controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.Creamy_CRM.Host_service.LoginService;
import com.spring.Creamy_CRM.Host_service.LoginServiceImpl;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	LoginServiceImpl service_login;
	
	//메인 홈 화면
	@RequestMapping("/host/home")
	public String home(HttpServletRequest req, Model model) {
		logger.info("url -> host_home");
		
		return "host/home";
	}
	
	//메인 홈 화면
	@RequestMapping("/host/firsthome")
	public String firsthome(HttpServletRequest req, Model model) {
		logger.info("url -> firsthome");
		
		service_login.getHostCode(req, model);
		
		System.out.println(req.getSession().getAttribute("code"));
		
		return "host/home";
	}


}
