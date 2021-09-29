/*
 * 작성자 : 장현정

 * 작성일 : 
 * 
 * 
*/
package com.spring.Creamy_CRM.User_dao;

import com.spring.Creamy_CRM.VO.userVO;

public interface SaleDAO {

	// 결제정보 등록
	public int addSaleInfo(userVO vo);
	
	// 예약코드 생성(결제 처리)
	public int createResCD(String res_setting_code);
}
