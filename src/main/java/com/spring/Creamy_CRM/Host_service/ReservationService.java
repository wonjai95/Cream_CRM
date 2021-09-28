/*
 * 작성자 : 이시현
 * 작성일 : 2021-09-20 ~ 2021-09-20
 * 예약 관련 service interface
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ReservationService {

	
//======= 예약요청 탭 =======	
	// 예약요청 목록	
	public void requestList(HttpServletRequest req, Model model);
	
	// 예약요청 검색목록
	public void requestSearch(HttpServletRequest req, Model model);
	
	// 예약요청 상세 페이지
	public void requestDetailAction(HttpServletRequest req, Model model);
	
	// 예약요청 등록처리 페이지
	//public void insertAction(HttpServletRequest req, Model model);
	
	// 예약요청 수정처리 페이지
	public void modifyAction(HttpServletRequest req, Model model);
		
	// 예약요청 삭제처리 페이지
	public void deleteAction(HttpServletRequest req, Model model);
	
	// 서비스 완료처리 페이지
	public void completeAction(HttpServletRequest req, Model model);
	
//======= 예약조회 탭 =======	
	// 예약조회 목록	
	public void completeList(HttpServletRequest req, Model model);
	
	// 예약조회 상세 페이지
	//public void completeDetailAction(HttpServletRequest req, Model model);
	
	// 예약조회 처리 페이지
	//public void profitPutAction(HttpServletRequest req, Model model);
}
