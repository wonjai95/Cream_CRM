package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

import com.spring.Creamy_CRM.VO.StockVO;

public interface StockDAO {

	// 재고 목록
	public List<StockVO> getInvenList(String host_code);
	
	// 재고 검색
	public List<StockVO> searchStockList(Map<String, Object> map);
	
	// 재고실지조사 내역 조회
	public List<StockVO> getInvenLogList(String host_code);
	
	// 재고실사 등록 처리시 실사날짜에 기록 여부 판단
	public int ChkinsertInven(StockVO vo);
	
	// 재고실사 등록 처리
	public int insertPeriodicInven(StockVO vo);
	
	// 재고실사 검색
	public List<StockVO> searchPeriodicInven(Map<String, Object> map);
	
	// 재고실사 검색을 위한 뷰 생성
	public void createSearchInvenView(Map<String, Object> map);
	
	// 입고 현황 내역
	public List<StockVO> getInvenInOutList(String host_code);
	
	// 입고 등록
	public int addInvenIn(StockVO vo);
	
	// 재고 검색
	public List<StockVO> searchInoutList(Map<String, Object> map);
	
	
}
