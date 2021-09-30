package com.spring.Creamy_CRM.Host_dao;

import java.util.List;

import com.spring.Creamy_CRM.VO.StockVO;

public interface StockDAO {

	// 재고 목록
	public List<StockVO> getInvenList(String host_code);
	
	// 재고실지조사 내역 조회
	public List<StockVO> getInvenLogList(String host_code);
	
}
