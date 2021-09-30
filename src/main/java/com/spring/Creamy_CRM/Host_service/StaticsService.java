/*
 * 작성자 : 
 * 작성일 : 
 * 통계 관련 service interface
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface StaticsService {
	
	//성별 통계
	public void static_gender_ratio(HttpServletRequest req, Model model);

}
