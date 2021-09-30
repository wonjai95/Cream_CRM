/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.21
 * 제일 첫 메인화면 - 고객 dao
 * 
*/
package com.spring.Creamy_CRM.User_dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.ReservationVO;

@Repository
public class MainwebDAOImpl implements MainwebDAO {

	@Autowired
	SqlSession sqlSession;


//======= 회원예약 =======	안하는거
	// 회원예약 등록처리
	@Override
	public int insertBooking1(ReservationVO vo) {
		// 방법2. 메서드를 활용/호출하는 방식
		MainwebDAO dao = sqlSession.getMapper(MainwebDAO.class);
		return dao.insertBooking2(vo) + dao.insertBooking1(vo);
	}

	public int insertBooking2(ReservationVO vo) {
		// 방법2. 메서드를 활용/호출하는 방식
		MainwebDAO dao = sqlSession.getMapper(MainwebDAO.class);
		return dao.insertBooking2(vo);
	}

	
	
	
	
}
