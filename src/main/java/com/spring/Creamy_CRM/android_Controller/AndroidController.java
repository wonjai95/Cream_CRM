/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 안드로이드 처리를 담당할 controller
 * 나중에 안드로이드 다시 연동할 예정
 * 
*/
package com.spring.Creamy_CRM.android_Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.Creamy_CRM.Host_service.LoginServiceImpl;
import com.spring.Creamy_CRM.android_service.Android_service;
import com.spring.Creamy_CRM.android_service.Android_serviceImpl;

@Controller
public class AndroidController {
	
	private static final Logger log = LoggerFactory.getLogger(AndroidController.class);
	
	@Autowired
	Android_serviceImpl service_android;
	
	
	//로그인
	@ResponseBody // 웹(스프링)에서 안드로이드로 값(json)을 전달하기 위한 어노테이션
	@RequestMapping("android/androidSignIn")
	public Map<String, String> androidSignIn(HttpServletRequest req){
		log.info("androidSignIn()");
		System.out.println("url -> 안드로이드 로그인");
		
		Map<String, String> out = service_android.login(req);
		
		return out;
	}
	
	// 앱 마이페이지 ->사장, 사원
	@ResponseBody
	@RequestMapping("android/androidMyPageMain")
	public Map<String, Object> androidMyPageMain(HttpServletRequest req) {
		log.info("androidMyPageMain()");
		System.out.println("url -> 안드로이드 마이페이지");
		
		Map<String, Object> map = service_android.getInfomation(req);
		
		
		return map;
	}
	
	//마이페이지 - 고객
	@ResponseBody
	@RequestMapping("android/androidUserPageMain")
	public Map<String, Object> androidUserPageMain(HttpServletRequest req){
		log.info("androidMyPageMain()");
		System.out.println("url -> 안드로이드 마이페이지");
		
		Map<String, Object> map = service_android.getUserInfomation(req);
		
		
		return map;
	}

}
