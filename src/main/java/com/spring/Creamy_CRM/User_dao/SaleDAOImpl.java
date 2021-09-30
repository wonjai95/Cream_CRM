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

	

	
	
	

}
