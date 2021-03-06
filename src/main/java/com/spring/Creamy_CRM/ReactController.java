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
	
	
	@RequestMapping("react/emp_react_before")
	public String emp_react_before(HttpServletRequest req) {
		System.out.println("url -> emp_react_before");
		
		return "react_test/emp_react_before";
	}
	
	@RequestMapping("react/emp_react_test1")
	public String emp_react_test1(HttpServletRequest req) {
		System.out.println("url -> emp_react_test1");
		
		return "react_test/employee";
	}
	
	@RequestMapping("react/res_complete_detail")
	public String res_complete_detail(HttpServletRequest req) {
		System.out.println("url -> res_complete_detail");
		
		return "react_test/res_complete_detail";
	}
	

}
