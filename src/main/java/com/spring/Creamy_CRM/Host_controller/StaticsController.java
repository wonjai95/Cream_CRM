/*
 * CRM - 통계 페이지 controller
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
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.Creamy_CRM.Host_service.CRMuserServiceImpl;

@Controller
public class StaticsController {

	private static final Logger logger = LoggerFactory.getLogger(StaticsController.class);
	
	@Autowired
	CRMuserServiceImpl service_user;
	
	// 회원통계
	@RequestMapping("host/userStatics")
	public String userStatics(HttpServletRequest req, Model model) {
		logger.info("url -> userStatics");
		
		// 회원 목록 출력
		service_user.printUsers(req, model);
	  
		return "host/statics/userStatics";
	}
	
	// 판매통계
	@RequestMapping("host/salesStatics")
	public String salesStatics(HttpServletRequest req, Model model) {
		logger.info("url -> salesStatics");
		
		return "host/statics/salesStatics";
	}
	
	// 판매통계
	@RequestMapping("host/salesTypeStatics")
	public String salesTypeStatics(HttpServletRequest req, Model model) {
		logger.info("url -> salesStatics");
		
		return "host/statics/salesTypeStatics";
	}

}
