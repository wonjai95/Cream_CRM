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
import com.spring.Creamy_CRM.VO.IncomeStatementVO;
import com.spring.Creamy_CRM.VO.CostofSalesVO;
import com.spring.Creamy_CRM.VO.EndingInventoryVO;

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
	
	// 손익계산서 조회
	public IncomeStatementVO getIncome_statement(Map<String, Object> map);
	
	// 총 매출액 조회
	public int getRevenue(Map<String, Object> map);
	
	// 1. 기초 재고액
	public EndingInventoryVO getEndingInven(Map<String, Object> map);
	
	// 2. 당기 매입액
	public CostofSalesVO getStockTotal(Map<String, Object> map);
	
	// 3. 기말 재고액을 구하기 위한 재고 실사 수량 조회
	public int TotalInvenCnt(Map<String, Object> map);
	
	// 직원 지급 급여 총 금액 조회
	public int getTotalSalary(Map<String, Object> map);
	
	// 매입매출전표에서 복리후생비, 소모품비, 수수료비용 합계
	public int[] sumSGA_expenses(Map<String, Object> map);
	
	// 매입매출전표에서 법인세등, 비용, 수익 합계
	public int[] sumNonOperatingLoss(Map<String, Object> map);
	
	// 손익계산서 등록처리
	public int InsertIncomeStatement(IncomeStatementVO vo);
	
	// 기말재고액 등록처리
	public int insertEndingInventory(EndingInventoryVO vo);
}
