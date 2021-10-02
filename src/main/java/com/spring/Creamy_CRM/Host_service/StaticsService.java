/*
 * 작성자 : 이시현
 * 작성일 : 2021-10-01 ~ 2021-10-03
 * 통계 관련 service interface
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface StaticsService {
	
	// 성별 통계
	public void static_gender_ratio(HttpServletRequest req, Model model);
	
	// 연령 통계
	public void static_age_ratio(HttpServletRequest req, Model model);
	
	// 월별 인원 현황
	public void static_numOfUserByMonth(HttpServletRequest req, Model model);

}
