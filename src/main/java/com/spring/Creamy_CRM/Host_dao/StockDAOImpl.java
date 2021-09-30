package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

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

	// 재고실사 등록 처리
	@Override
	public int insertPeriodicInven(StockVO vo) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.insertPeriodicInven(vo);
	}

	// 재고실사 검색
	@Override
	public List<StockVO> searchPeriodicInven(Map<String, Object> map) {
		createSearchInvenView(map);
		
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.searchPeriodicInven(map);
	}

	// 재고실사 검색을 위한 뷰 생성
	@Override
	public void createSearchInvenView(Map<String, Object> map) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		dao.createSearchInvenView(map);
	}

}
