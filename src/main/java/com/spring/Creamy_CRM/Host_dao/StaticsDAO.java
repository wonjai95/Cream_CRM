/*
 * 작성자 : 이시현
 * 작성일 : 2021-10-01 ~ 2021-10-03
 * 통계 관련 dao
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

import com.spring.Creamy_CRM.VO.StaticVO;

public interface StaticsDAO {

	// 직원(담당자)별 판매정보 목록 조회
	public List<StaticVO> managerSalesList(String host_code);
	
	// 직원(담당자)별 판매정보 차트 조회
	public List<StaticVO> managerSalesChart(String employee_code);
}
