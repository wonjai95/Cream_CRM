package com.spring.Creamy_CRM.android_DAO;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.EmployeeVO;
import com.spring.Creamy_CRM.VO.HostVO;
import com.spring.Creamy_CRM.VO.IncomeStatementVO;
import com.spring.Creamy_CRM.VO.userVO;


@Repository
public class Android_LoginDAOImpl implements Android_LoginDAO{

	@Autowired
	SqlSession sqlSession;
	

	@Override
	public String getPw(String id) {
		Android_LoginDAO dao = sqlSession.getMapper(Android_LoginDAO.class);
		return dao.getPw(id);
	}

	@Override
	public String getAuth(String id) {
		Android_LoginDAO dao = sqlSession.getMapper(Android_LoginDAO.class);
		return dao.getAuth(id);
	}

	@Override
	public userVO getUserInfo(String id) {
		Android_LoginDAO dao = sqlSession.getMapper(Android_LoginDAO.class);
		return dao.getUserInfo(id);
	}

	@Override
	public HostVO getHostInfo(String id) {
		Android_LoginDAO dao = sqlSession.getMapper(Android_LoginDAO.class);
		return dao.getHostInfo(id);
	}

	@Override
	public EmployeeVO getEmployeeVO(String id) {
		Android_LoginDAO dao = sqlSession.getMapper(Android_LoginDAO.class);
		return dao.getEmployeeVO(id);
	}
	
	// host_id를 이용한 host_code 가져오기
	@Override
	public String getCode(String host_id) {
		Android_LoginDAO dao = sqlSession.getMapper(Android_LoginDAO.class);
		return dao.getCode(host_id);
	}
	
	// 손익계산서 조회
	@Override
	public IncomeStatementVO getSettlement(Map<String, Object> map) {
		Android_LoginDAO dao = sqlSession.getMapper(Android_LoginDAO.class);
		return dao.getSettlement(map);
	}

}
