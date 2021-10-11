package com.spring.Creamy_CRM.User_service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.spring.Creamy_CRM.VO.KakaoPayApprovalVO;
import com.spring.Creamy_CRM.VO.ReservationVO;

public interface SaleService {
	
	// 회원 - 결제(결제 정보 insert)
	public void insertSaleInfo(HttpServletRequest req, Model model);
	
	// 카카오페이 결제
	public String kakaoPayReady(HttpServletRequest req, Model model);
	
	// 카카오페이 결제 승인 내용
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token);
	
}
