/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.21
 * 제일 첫 메인화면 - 고객 service interface
 * 
*/
package com.spring.Creamy_CRM.User_service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MainwebService {

	
//======= 회원예약 =======		
	// 회원예약 등록처리
	public void insertBooking(HttpServletRequest req, Model model);
	
}
