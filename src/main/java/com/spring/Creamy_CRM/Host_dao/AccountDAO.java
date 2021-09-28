/*
 * 작성자 : 
 * 작성일 : 
 * 회계 관련 DAO interface
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.List;

import com.spring.Creamy_CRM.VO.AccountVO;

public interface AccountDAO {

	// 매입매출 전표 목록
	public List<AccountVO> getSlipList(String host_code);
	
	// 매입매출 전표 등록
	public int insertSlip(AccountVO vo);
	
	// 선택된 유형의 매출전표 조회
	public List<AccountVO> getSelectList(String slip_type);
	
	// 검색어에 따른 매출전표 조회
	public List<AccountVO> getSearchList(String search);
	
	// 매입매출 전표 수정 페이지
	public AccountVO getSlipInfo(String slip_code);
	
	// 매입매출 전표 수정처리
	public int updateSlip(AccountVO vo);
	
	// 매입매출 전표 삭제처리
	public int deleteSlip(String slip_code);
	
}
