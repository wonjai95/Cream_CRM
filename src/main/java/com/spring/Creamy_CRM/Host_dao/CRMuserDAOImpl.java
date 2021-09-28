/*
 * 작성자 : 장현정
 * 작성일 : 2021-09-20 ~ 2021-09-22
 * 회원 관련 DAO interface
 * 
*/

package com.spring.Creamy_CRM.Host_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.userVO;

@Repository
public class CRMuserDAOImpl implements CRMuserDAO {

	@Autowired
	SqlSession sqlSession;
	
	// 회원 정보 출력
	@Override
	public List<userVO> printUsers() {
		
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.CRMuserDAO.printUsers");
	}

	// 선택된 회원 정보 출력
	@Override
	public userVO getUserInfo(String user_code) {
		
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.CRMuserDAO.getUserInfo", user_code);
	}

	// 회원 정보 수정
	@Override
	public int updateUser(userVO vo) {
		
		return sqlSession.update("com.spring.Creamy_CRM.Host_dao.CRMuserDAO.updateUser", vo);
	}

	// 회원별 판매 내역 출력
	@Override
	public List<userVO> userSale(String user_code) {
		
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.CRMuserDAO.userSale", user_code);
	}

	// 회원 삭제(user_tbl)
	@Override
	public int deleteUser(String user_code) {

		return sqlSession.delete("com.spring.Creamy_CRM.Host_dao.CRMuserDAO.deleteUser", user_code);
	}

	// 회원 삭제(Auth_tbl)
	@Override
	public int deleteUserAuth(String user_code) {
		
		return sqlSession.delete("com.spring.Creamy_CRM.Host_dao.CRMuserDAO.deleteUserAuth", user_code);
	}

}
