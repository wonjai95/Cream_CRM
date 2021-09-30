package com.spring.Creamy_CRM.Host_controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.Creamy_CRM.Host_service.StockServiceImpl;

@Controller
public class StockController {
	
	private static final Logger logger = LoggerFactory.getLogger(StockController.class);
	
	@Autowired
	StockServiceImpl service;

	// 재고관리 페이지 요청
	@RequestMapping("/host/stock")
	public String stock(HttpServletRequest req, Model model) {
		logger.info("url -> stock");
		service.stock_manage(req, model);
		return "host/stock/stock";
	}

	
	// 재고실사 페이지 요청
	@RequestMapping("/host/inventory")
	public String inventory(HttpServletRequest req, Model model) {
		logger.info("url -> inventory");
		service.stock_inven(req, model);
		return "host/stock/inventory";
	}
	
	
	// 재고실사 등록 처리
	@RequestMapping("/host/add_periodic_inven")
	public String add_periodic_inven(HttpServletRequest req, Model model) {
		logger.info("url -> add_periodic_inven");
		
		service.add_periodic_inven(req, model);
		return "host/stock/add_periodic_inven";
	}
	
	
	// 재고실사 검색
	@RequestMapping("/host/search_periodic_inven")
	public String search_periodic_inven(HttpServletRequest req, Model model) {
		logger.info("url -> search_periodic_inven");
		
		service.search_periodic_inven(req, model);
		return "host/stock/search_inventory";
	}
	
}
