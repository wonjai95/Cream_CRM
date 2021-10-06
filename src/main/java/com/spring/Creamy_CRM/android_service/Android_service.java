/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 안드로이드 처리를 담당할 service interface
 * 나중에 안드로이드 다시 연동할 예정
 * 
*/
package com.spring.Creamy_CRM.android_service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface Android_service {

	//로그인
	public Map<String, String> login(HttpServletRequest req);
	
	//마이페이지 - 관리자
	public Map<String, Object> getInfomation(HttpServletRequest req);
	
	//마이페이지 - 고객
	public Map<String, Object> getUserInfomation(HttpServletRequest req);
	
	//회원가입
	public Map<String, Object> Join(HttpServletRequest req);

	
	// 결산 - 손익계산서 조회
	public Map<String, Object> getSettlement(HttpServletRequest req);


	// QR
	public Map<String, Object> getQrCode(HttpServletRequest req);


}
