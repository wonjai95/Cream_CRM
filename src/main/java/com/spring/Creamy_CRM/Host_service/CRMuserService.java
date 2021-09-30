/*
 * 작성자 : 장현정
 * 작성일 : 2021-09-21
 * 회원 관련 service interface
 * 봐서 길어지면 나눠도 되고..
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface CRMuserService {
	
	// 선택된 회원 정보 출력
	public void getUserInfo(HttpServletRequest req, Model model);
	
	// 회원 정보 출력
	public void printUsers(HttpServletRequest req, Model model);
	
	// 회원 정보 수정
	public void modifyUser(HttpServletRequest req, Model model);
	
	// 회원별 판매 내역 출력
	public void userSale(HttpServletRequest req, Model model);
	
	// 회원 정보 삭제(user_tbl)
	public void deleteUser(HttpServletRequest req, Model model);
	
}
