package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

import com.spring.Creamy_CRM.VO.StockVO;

public interface StockDAO {

	// 재고 목록
	public List<StockVO> getInvenList(String host_code);
	
	// 재고실지조사 내역 조회
	public List<StockVO> getInvenLogList(String host_code);
	
	// 재고실사 등록 처리
	public int insertPeriodicInven(StockVO vo);
	
	// 재고실사 검색
	public List<StockVO> searchPeriodicInven(Map<String, Object> map);
	
	// 재고실사 검색을 위한 뷰 생성
	public void createSearchInvenView(Map<String, Object> map);
	
}
