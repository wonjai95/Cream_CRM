package com.spring.Creamy_CRM.User_service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface SaleService {
	
	// 회원 - 결제(결제 정보 insert)
	public void insertSaleInfo(HttpServletRequest req, Model model);

	
}
