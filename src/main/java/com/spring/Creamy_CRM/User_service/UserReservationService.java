/*
 * 작성자 : 주수림

 * 작성일 : 2021.09.23
 * 고객 예약 화면 및 그 처리 
 * 
*/
package com.spring.Creamy_CRM.User_service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


public interface UserReservationService {
	
	// 고객 매장 선택 페이지
	public void selectHost(HttpServletRequest req, Model model);
	
	// 고객 매장 선택 페이지 - 검색
	public void searchHostList(HttpServletRequest req, Model model);

	// 고객 담장자 예약 페이지
	public void custManagerBooking(HttpServletRequest req, Model model);
	
	// 고객 예약 가능 시간 표시
	public void bookingTimeTable(HttpServletRequest req, Model model);
	
	// 회원 예약 가능한 담당자 표시
	public void bookingManagerTable(HttpServletRequest req, Model model);
	
	// 회원 예약 가능한 호실 표시
	public void bookingRoomTable(HttpServletRequest req, Model model);
	
	// 호실 클릭시 영업시간과 예약 현황 표시
	public void bookingRoomTimeTable(HttpServletRequest req, Model model);
	
	// 호실 예약 처리
	public void insertRoomBookingAction(HttpServletRequest req, Model model);
}
