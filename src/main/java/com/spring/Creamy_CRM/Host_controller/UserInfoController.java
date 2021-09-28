/*
	CRM - 회원정보 cotroller
*/

package com.spring.Creamy_CRM.Host_controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.Creamy_CRM.Host_service.CRMuserServiceImpl;
import com.spring.Creamy_CRM.Host_service.LoginServiceImpl;
import com.spring.Creamy_CRM.Host_service.ProductServiceImpl;

@Controller
public class UserInfoController {

private static final Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	@Autowired
	LoginServiceImpl service_login;
	
	@Autowired
	CRMuserServiceImpl service_user;
	
	@Autowired
	ProductServiceImpl service_product;

	// 회원 정보
	@RequestMapping("/host/user")
	public String user(HttpServletRequest req, Model model) {
		logger.info("url -> user");
		
		// 회원 목록 출력
		service_user.printUsers(req, model);
		
		// 회원 선택 하면 해당 회원에 대한 판매 내역 출력(판매 탭) - user_sale
		String user_code = req.getParameter("user_code");
		System.out.println("user_code : " + user_code);
		
		if(user_code != null) {
			
			// 회원별 판매 목록 출력(수정중)
			service_user.userSale(req, model);
			
		} else {
			
		}
		
		return "host/user/user";
	}
	
	// 회원 정보 상세 페이지(for 수정)
	@RequestMapping("/host/user_detail")
	public String user_detail(HttpServletRequest req, Model model) {
		logger.info("url -> user_detail");
		
		return "host/user/user_detail";
	}
	
	// 회원 수정 페이지
	@RequestMapping("/host/modify_user")
	public String modify_user(HttpServletRequest req, Model model) {
		logger.info("url -> modify_user");
		
		String user_code = req.getParameter("user_code");
		System.out.println("user_code : " + user_code);
		
		service_user.getUserInfo(req, model);
		
		return "host/user/modify_user";
	}
	
	// 회원 수정 처리
	@RequestMapping("/host/modify_user_action")
	public String modify_user_action(HttpServletRequest req, Model model) {
		logger.info("url -> modify_user_action");
		
		service_user.modifyUser(req, model);
		
		return "host/user/modify_user_action";
	}
	
	
	// 마이페이지
	@RequestMapping("/host/mypage")
	public String mypage(HttpServletRequest req, Model model) {
		logger.info("url -> mypage");
		
		return "host/user/mypage";
	}
	  
	// 회원 삭제 처리(user_tbl)
	@RequestMapping("/host/del_user_action")
	public String del_user_action(HttpServletRequest req, Model model) {
		logger.info("url -> del_user_action");
		
		service_user.deleteUser(req, model);
		
		return "host/user/del_user_action";
	}
	
	// 회원 삭제 처리(Auth_tbl)
	@RequestMapping("/host/del_userAuth_action")
	public String del_userAuth_action(HttpServletRequest req, Model model) {
		logger.info("url -> del_userAuth_action");
		
		service_user.deleteUserAuth(req, model);
		
		return "host/user/del_userAuth_action";
	}
		
	
	
	// 회원별 판매 내역 출력
	/*
	@RequestMapping("/host/user_sale")
	public String user_sale(HttpServletRequest req, Model model) {
		logger.info("url -> user_sale");
		
		
		
		
		return "host/user/user_sale";
	}
	*/
	
	
}
