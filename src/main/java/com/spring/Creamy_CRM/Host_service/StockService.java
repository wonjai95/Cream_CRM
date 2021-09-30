package com.spring.Creamy_CRM.Host_service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface StockService {

	// 재고관리 페이지 - 거래처관리와 재고관리
	public void stock_manage(HttpServletRequest req, Model model);
	
	// 재고실사 페이지 
	public void stock_inven(HttpServletRequest req, Model model);
	
	
	
}
