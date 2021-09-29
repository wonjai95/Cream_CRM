/*
 * 작성자 : 장현정

 * 작성일 : 
 * 
 * 
*/
package com.spring.Creamy_CRM.User_dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.userVO;


@Repository
public class SaleDAOImpl implements SaleDAO {

	@Autowired
	SqlSession sqlSession;

	// 결제정보 등록
	@Override
	public int addSaleInfo(userVO vo) {
		
		return sqlSession.insert("", vo);
	}

	// 예약코드 생성(결제 처리)
	@Override
	public int createResCD(String res_setting_code) {
		
		return sqlSession.insert("com.spring.Creamy_CRM.User_dao.SaleDAO.createResCD", res_setting_code);
	}
	
	

	
	
	

}
