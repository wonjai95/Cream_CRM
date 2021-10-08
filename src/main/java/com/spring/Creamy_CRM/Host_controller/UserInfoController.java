/*
	CRM - 회원정보 cotroller
*/

package com.spring.Creamy_CRM.Host_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.Creamy_CRM.Host_service.CRMuserServiceImpl;
import com.spring.Creamy_CRM.Host_service.LoginServiceImpl;
import com.spring.Creamy_CRM.Host_service.ProductServiceImpl;
import com.spring.Creamy_CRM.VO.ProductVO;
import com.spring.Creamy_CRM.VO.userVO;

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
		
		String host_code = (String) req.getSession().getAttribute("code");
		System.out.println("host_code : " + host_code);
		
		// 회원 목록 출력   
		service_user.printUsers(req, model);
		
		// 회원별 예약 및 판매 내역 출력
		service_user.userSale(req, model);
		
		return "host/user/user";
	}
	
	// 회원 검색
	@ResponseBody
	@RequestMapping("/host/searchUserList")
	public List<userVO> searchUserList(HttpServletRequest req, Model model) {
		logger.info("url -> searchUserList");
		
		return service_user.searchUserList(req, model);
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
		String user_id = req.getParameter("user_id");
		System.out.println("user_id : " + user_id);
		
		service_user.getUserInfo(req, model);
		
		return "host/user/modify_user";
	}
	
	// 회원 수정 처리
	@RequestMapping("/host/modify_user_action")
	public String modify_user_action(HttpServletRequest req, Model model) {
		logger.info("url -> modify_user_action");
		
		// 수정 처리
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
		
		String user_code = req.getParameter("user_code");
		System.out.println("user_code : " + user_code);
		String user_id = req.getParameter("user_id");
		System.out.println("user_id : " + user_id);
		
		req.setAttribute("user_code", user_code);
		req.setAttribute("user_id", user_id);
		
		// user_tbl 회원 만료일자 추가
		service_user.deleteUser(req, model);
		
		return "host/user/del_user_action";
	}
	/*
	 * // 회원별 판매 내역 출력
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping("/host/user_sale") public userVO user_sale(HttpServletRequest
	 * req, Model model) { logger.info("url -> user_sale");
	 * 
	 * String user_code = req.getParameter("userCode");
	 * System.out.println("user_code : " + user_code);
	 * 
	 * return service_user.userSale(req, model); }
	 */
	
	
}
