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


//======= 회원 담당자 예약 =======	
	// 회원예약 등록처리
	@Override
	public int insertBooking1(ReservationVO vo) {
		// 방법2. 메서드를 활용/호출하는 방식
		MainwebDAO dao = sqlSession.getMapper(MainwebDAO.class);
		return dao.insertBooking2(vo) + dao.insertBooking1(vo);
	}
	@Override
	public int insertBooking2(ReservationVO vo) {
		// 방법2. 메서드를 활용/호출하는 방식
		MainwebDAO dao = sqlSession.getMapper(MainwebDAO.class);
		return dao.insertBooking2(vo);
	}

	// 고객 예약 상세정보 조회 처리
	@Override
	public ReservationVO getBookingDetail(String code) {
		
		MainwebDAO dao = sqlSession.getMapper(MainwebDAO.class);
		return dao.getBookingDetail(code);
	}
	
	// 고객 예약상세정보 내 예약내역취소 처리
	@Override
	public int deleteActionByUser(ReservationVO vo) {
		// SQL(DB) : reservation_tbl 업데이트
		MainwebDAO dao = sqlSession.getMapper(MainwebDAO.class);
		return dao.deleteActionByUser(vo);
	}

	
}
