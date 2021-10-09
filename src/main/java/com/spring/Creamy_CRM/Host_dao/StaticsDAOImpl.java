/*
 * 작성자 : 이시현
 * 작성일 : 2021-10-01 ~ 2021-10-03
 * 통계 관련 DAO
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.StaticVO;

@Repository
public class StaticsDAOImpl implements StaticsDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	
	// 직원(담당자)별 판매정보 목록 조회
	@Override
	public List<StaticVO> managerSalesList(String host_code) {
		StaticsDAO dao = sqlSession.getMapper(StaticsDAO.class);
		return dao.managerSalesList(host_code);
	}
	
	// 직원(담당자)별 판매정보 차트 조회
	public List<StaticVO> managerSalesChart(String host_code) {
		StaticsDAO dao = sqlSession.getMapper(StaticsDAO.class);
		return dao.managerSalesChart(host_code);
	}

}
