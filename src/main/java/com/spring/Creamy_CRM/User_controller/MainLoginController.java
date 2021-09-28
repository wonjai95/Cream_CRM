/*
 * 작성자 : 정지은

 * 작성일 : 2021.09.28
 * 로그인 / 회원가입 컨트롤러
 * 
 * 
*/
package com.spring.Creamy_CRM.User_controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.Creamy_CRM.Host_controller.MainController;
import com.spring.Creamy_CRM.Host_service.LoginServiceImpl;

@Controller
public class MainLoginController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	LoginServiceImpl service_login;
	
	//로그인 화면
	@RequestMapping("/login")
	public String login() {
		logger.info("url => login");
		
		return "mainweb/login";
	}
	
	//로그인 후 회원 이름 세션에 넣어주기 위한 메서드
	@RequestMapping("/firsthome")
	public String firsthome(HttpServletRequest req, Model model) {
		logger.info("url -> first_home");
		
		service_login.getUserCode(req, model);
		
		return "mainweb/home";
	}
	
	//회원가입
	@RequestMapping("/signIn")
	public String SignIn() {
		logger.info("url -> signIn");
		
		return "mainweb/login/signIn";
	}
	
	//회원가입 - 중복 로그인 처리
	@RequestMapping("/confirmId")
	public String confirmId(HttpServletRequest req, Model model) {
		logger.info("url -> confirmId");
		
		service_login.IDDupcheck(req, model);
		
		return "mainweb/login/confirmId";
	}
	
	//회원가입 처리 - 끝나면 홈화면으로 return
	@RequestMapping("/signInAction")
	public String signInAction(HttpServletRequest req, Model model) {
		logger.info("url -> signInAction");
		
		service_login.signInAction(req, model);
		
		return "mainweb/home";
	}
	
	//회원가입 - 사장님
	@RequestMapping("/signIn_host")
	public String signIn_host(HttpServletRequest req, Model model) {
		logger.info("url -> signIn_host");
		
		return "mainweb/login/signIn_host";
	}
	
	//회원가입 처리 - 끝나면 홈화면으로 return
	@RequestMapping("/HostsignInAction")
	public String HostsignInAction(HttpServletRequest req, Model model) {
		logger.info("url -> HostsignInAction");
		
		service_login.HostsignInAction(req, model);
		
		return "mainweb/home";
	}
	
	
	//회원 마이페이지
	@RequestMapping("/mypage")
	public String mypage(HttpServletRequest req, Model model) {
		logger.info("url -> mypage");
		
		service_login.modifyUserpage(req, model);
		
		return "mainweb/mypage/mypage";
	}
	
	//마이페이지 - 수정전 비밀번호 체크
	@RequestMapping("/infopwcheck")
	public String infopwcheck(HttpServletRequest req, Model model) {
		logger.info("url -> infopwcheck");
		
		service_login.InfopwCheck(req, model);
		
		return "mainweb/mypage/Infopwcheck";
	}
	
	//마이페이지 - 회원정보 수정
	@RequestMapping("/modifyInfo")
	public String modifyInfo(HttpServletRequest req, Model model) {
		logger.info("url-> modifyInfo");
		
		service_login.InfoModifyAction(req, model);
		
		return "mainweb/mypage/modify_check";
	}
	
	//로그아웃 - 수정예정
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		logger.info("url -> logout");
		req.getSession().invalidate();
		
		
		return "mainweb/home";
	}
		
	
}
