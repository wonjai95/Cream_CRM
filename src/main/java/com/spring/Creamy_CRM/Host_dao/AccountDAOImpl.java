/*
 * 작성자 : 
 * 작성일 : 
 * 회계 관련 dao
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.AccountVO;

@Repository
public class AccountDAOImpl implements AccountDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 매입매출 전표 목록
	@Override
	public List<AccountVO> getSlipList(String host_code) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.getSlipList(host_code);
	}
	
	// 매입매출 전표 등록
	@Override
	public int insertSlip(AccountVO vo) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.insertSlip(vo);
	}
	
	// 선택된 유형의 매출전표 조회
	public List<AccountVO> getSelectList(String slip_type){
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.getSelectList(slip_type);
	}
	
	// 검색어에 따른 매출전표 조회
	public List<AccountVO> getSearchList(String search){
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.getSearchList(search);
	}
	
	// 매입매출 전표 수정 페이지
	@Override
	public AccountVO getSlipInfo(String slip_code) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.getSlipInfo(slip_code);
	}
	
	// 매입매출 전표 수정처리
	@Override
	public int updateSlip(AccountVO vo) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.updateSlip(vo);
	}

	// 매입매출 전표 삭제처리
	@Override
	public int deleteSlip(String slip_code) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.deleteSlip(slip_code);
	}

	



}
