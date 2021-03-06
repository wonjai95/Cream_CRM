/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.21
 * 제일 첫 메인화면 - 고객 dao interface
 * 
*/
package com.spring.Creamy_CRM.User_dao;

import com.spring.Creamy_CRM.VO.ReservationVO;

public interface MainwebDAO {

	
//======= 회원예약 =======	
	// 회원예약 등록처리
	public int insertBooking1(ReservationVO vo);
	public int insertBooking2(ReservationVO vo);
	
	// 고객의 사장님코드별 예약종류 담당자 상세페이지
	public ReservationVO getMngBookingDetail(String code);
	// 고객의 사장님코드별 예약종류 호실 상세페이지
	public ReservationVO getRoomBookingDetail(String code);
	
	// 고객 예약상세정보 내 예약내역취소 처리
	public int deleteActionByUser(ReservationVO vo);
	
	
	
}
