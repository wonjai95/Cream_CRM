/*
 * 작성자 : 장현정
 * 작성일 : 2021-09-20 ~ 2021-09-22
 * 회원 관련 DAO interface
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import com.spring.Creamy_CRM.VO.userVO;

public interface CRMuserDAO {

	// 회원 정보 전체 리스트 출력
	public List<userVO> printUsers();
	
	// 선택된 회원 정보 출력
	public userVO getUserInfo(String user_code);
	
	// 회원 정보 수정
	public int updateUser(userVO vo);
	
	// 회원별 판매 내역 출력
	public List<userVO> userSale(String user_code);
	
	// 회원 삭제(user_tbl)
	public int deleteUser(String user_code);
	
	// 회원 인증테이블 로그인체크 업데이트
	public int updateAuth(String ID);
	
}
