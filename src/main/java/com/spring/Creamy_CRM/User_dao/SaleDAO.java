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
	public int insertSaleInfo(userVO vo);
	
}
