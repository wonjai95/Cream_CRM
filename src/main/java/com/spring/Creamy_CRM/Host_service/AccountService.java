/*
 * 작성자 : 
 * 작성일 : 
 * 회계 관련 service interface
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface AccountService {
	
	// 판관비 목록
	public void slipList(HttpServletRequest req, Model model);
	
	// 유형에 따른 매출전표 조회
	public void getSelectList(HttpServletRequest req, Model model);
	
	// 검색에 따른 매출전표 조회
	public void getSearchList(HttpServletRequest req, Model model);
	
	// 매입매출 전표 수정 페이지
	public void getSlipInfo(HttpServletRequest req, Model model);
	
	// 매입매출 전표 수정처리
	public void modifySlip(HttpServletRequest req, Model model);
	
	// 매입매출 전표 삭제처리
	public void deleteSlip(HttpServletRequest req, Model model);
	
}
