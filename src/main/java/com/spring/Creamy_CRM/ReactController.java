package com.spring.Creamy_CRM;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReactController {
	
	@RequestMapping("react/check")
	public String check(HttpServletRequest req) {
		System.out.println("url -> react_check");
		
		//정보도 넘어오나?
		System.out.println(req.getParameter("board_no"));
		
		return "react_test/reactCheck";
	}
	
	/*
	 * @RequestMapping("react/host_resdetail") public String
	 * resdetail(HttpServletRequest req) {
	 * System.out.println("url -> react_resdetail");
	 * 
	 * return "react_test/react_resDetail"; }
	 */

}
