/*
 * 작성자 : 
 * 작성일 : 
 * 회계 관련 dao
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.AccountVO;
import com.spring.Creamy_CRM.VO.Income_statementVO;

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
	public List<AccountVO> getSelectList(Map<String, Object> map){
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.getSelectList(map);
	}
	
	// 검색어에 따른 매출전표 조회
	public List<AccountVO> getSearchList(Map<String, Object> map){
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.getSearchList(map);
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

	// 영업외 손익 목록 조회
	public List<AccountVO> getNOLlist(String host_code){
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.getNOLlist(host_code);
	}
	
	// 선택된 유형의 영업외손익 조회
	public List<AccountVO> getNOLselectList(Map<String, Object> map){
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.getNOLselectList(map);
	}

	// 검색어에 따른 영업외손익 조회
	public List<AccountVO> getNOLsearchList(Map<String, Object> map){
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.getNOLsearchList(map);
	}
	
	// 손익계산서 조회
	public List<Income_statementVO> getIncome_statement(String host_code){
		return null;
	}
	
	// 매입매출전표에서 복리후생비, 소모품비, 수수료비용 합계
	public int[] sumSGA_expenses(Map<String, Object> map) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.sumSGA_expenses(map);
	}


}
