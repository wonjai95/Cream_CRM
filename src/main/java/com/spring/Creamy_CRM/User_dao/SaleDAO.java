/*
 * 작성자 : 장현정

 * 작성일 : 
 * 
 * 
*/
package com.spring.Creamy_CRM.User_dao;

import com.spring.Creamy_CRM.VO.KakaoPayApprovalVO;
import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.userVO;

public interface SaleDAO {

	// 결제정보 등록
	public int insertSaleInfo(userVO vo);
	
	// 환불 처리
	public int deletePay(String res_code);
	
	// 카카오페이 정보 입력
	public int insertKakaoPay(KakaoPayApprovalVO vo);
}
