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
	
	
	
}
