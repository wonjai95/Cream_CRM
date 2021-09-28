package com.spring.Creamy_CRM.Host_dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.ReservationVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	SqlSession sqlSession;

	
	

}
