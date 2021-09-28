package com.spring.React_Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.Creamy_CRM.Host_controller.MainController;

@Controller
public class ReactController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("")
	public String react_test1(HttpServletRequest req, Model model) {
		
		
		return null;
	}
	
	
	
}
