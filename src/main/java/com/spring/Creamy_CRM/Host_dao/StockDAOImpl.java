package com.spring.Creamy_CRM.Host_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.StockVO;

@Repository
public class StockDAOImpl implements StockDAO {

	@Autowired
	SqlSession sqlSession;
	
	// 재고 목록
	@Override
	public List<StockVO> getInvenList(String host_code) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.getInvenList(host_code);
	}

	// 재고실지조사 내역 조회
	@Override
	public List<StockVO> getInvenLogList(String host_code) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.getInvenLogList(host_code);
	}

}
