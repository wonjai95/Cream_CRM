/*
 * 작성자 : 
 * 작성일 : 
 * 회계 관련 DAO interface
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

import com.spring.Creamy_CRM.VO.AccountVO;

public interface AccountDAO {

	// 매입매출 전표 목록
	public List<AccountVO> getSlipList(String host_code);
	
	// 매입매출 전표 등록
	public int insertSlip(AccountVO vo);
	
	// 선택된 유형의 매출전표 조회
	public List<AccountVO> getSelectList(Map<String, Object> map);
	
	// 검색어에 따른 매출전표 조회
	public List<AccountVO> getSearchList(Map<String, Object> map);
	
	// 매입매출 전표 수정 페이지
	public AccountVO getSlipInfo(String slip_code);
	
	// 매입매출 전표 수정처리
	public int updateSlip(AccountVO vo);
	
	// 매입매출 전표 삭제처리
	public int deleteSlip(String slip_code);
	
	// 영업외 손익 목록 조회
	public List<AccountVO> getNOLlist(String host_code);
	
	// 선택된 유형의 영업외손익 조회
	public List<AccountVO> getNOLselectList(Map<String, Object> map);
	
	// 검색어에 따른 영업외손익 조회
	public List<AccountVO> getNOLsearchList(Map<String, Object> map);
}
