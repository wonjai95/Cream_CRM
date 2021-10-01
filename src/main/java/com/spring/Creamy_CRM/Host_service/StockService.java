package com.spring.Creamy_CRM.Host_service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface StockService {

	// 재고관리 페이지 - 거래처관리와 재고관리
	public void stock_manage(HttpServletRequest req, Model model);
	
	// 재고관리 검색
	public void search_stock(HttpServletRequest req, Model model);
	
	// 재고실사 페이지 
	public void stock_inven(HttpServletRequest req, Model model);
	
	// 재고실사 등록 처리
	public void add_periodic_inven(HttpServletRequest req, Model model);
	
	// 재고 실사 검색
	public void search_periodic_inven(HttpServletRequest req, Model model);
	
	// 입출고 현황 페이지 
	public void inven_inout(HttpServletRequest req, Model model);
	
	// 입고 등록 처리
	public void add_invenInout_action(HttpServletRequest req, Model model);
	
	// 입출고 검색
	public void search_inout(HttpServletRequest req, Model model);
	
	
	
	
}
