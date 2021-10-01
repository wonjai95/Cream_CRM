/*
 * 작성자 : 주수림

 * 작성일 : 2021.09.23
 * 고객 예약 화면 및 그 처리 
 * 
*/
package com.spring.Creamy_CRM.User_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.HostVO;
import com.spring.Creamy_CRM.VO.ProductVO;
import com.spring.Creamy_CRM.VO.ReservationVO;

@Repository
public class UserReservationDAOImpl implements UserReservationDAO {

	@Autowired
	SqlSession sqlSession;
	
	// 고객 매장 선택 페이지
	@Override
	public List<HostVO> selectHost() {
		UserReservationDAO dao = sqlSession.getMapper(UserReservationDAO.class);
		return dao.selectHost();
	}
	
	// 고객 매장 선택 페이지 - 검색
	@Override
	public List<HostVO> searchHostList(String keyword) {
		UserReservationDAO dao = sqlSession.getMapper(UserReservationDAO.class);
		return dao.searchHostList(keyword);
	}

	// 해당 사장님의 상품 정보 가져오기
	@Override
	public List<ProductVO> getProductList(String host_code) {
		UserReservationDAO dao = sqlSession.getMapper(UserReservationDAO.class);
		return dao.getProductList(host_code);
	}
	
	// 해당 사장님의 해당 요일 영업시간 조회
	@Override
	public HostVO getOperatingInfo(Map<String, Object> map) {
		UserReservationDAO dao = sqlSession.getMapper(UserReservationDAO.class);
		return dao.getOperatingInfo(map);
	}

	// 회원 예약 가능한 담당자 표시
	@Override
	public List<HostVO> getAvailableManager(Map<String, Object> map) {
		UserReservationDAO dao = sqlSession.getMapper(UserReservationDAO.class);
		return dao.getAvailableManager(map);
	}

	// 해당 담당자의 예약 테이블 확인
	@Override
	public int getReservedManager(Map<String, Object> map) {
		UserReservationDAO dao = sqlSession.getMapper(UserReservationDAO.class);
		return dao.getReservedManager(map);
	}

	// 회원 예약 가능한 호실 표시
	@Override
	public List<ReservationVO> getAvailableRoom(String host_code) {
		UserReservationDAO dao = sqlSession.getMapper(UserReservationDAO.class);
		return dao.getAvailableRoom(host_code);
	}
	
	// 호실 상세 정보
	@Override
	public ReservationVO getRoomInfo(String room_setting_code) {
		UserReservationDAO dao = sqlSession.getMapper(UserReservationDAO.class);
		return dao.getRoomInfo(room_setting_code);
	}

	// 해당 날짜에 해당 호실 예약 현황
	@Override
	public List<ReservationVO> getBookedRoomTime(Map<String, Object> map) {
		UserReservationDAO dao = sqlSession.getMapper(UserReservationDAO.class);
		return dao.getBookedRoomTime(map);
	}

	// 호실 예약 처리
	@Override
	public int insertRoomBooking(ReservationVO vo) {
		UserReservationDAO dao = sqlSession.getMapper(UserReservationDAO.class);
		insertRoomBooking2(vo);
		return dao.insertRoomBooking(vo);
	}
	
	// 호실 예약 상세 처리
	@Override
	public int insertRoomBooking2(ReservationVO vo) {
		UserReservationDAO dao = sqlSession.getMapper(UserReservationDAO.class);
		return dao.insertRoomBooking2(vo);
	}

	// 예약 신청 시간 가능 여부 체크
	@Override
	public int chkRoomBooking(Map<String, Object> map) {
		UserReservationDAO dao = sqlSession.getMapper(UserReservationDAO.class);
		createRoomBookingView(map);
		return dao.chkRoomBooking(map);
	}

	// 예약 신청 시간 가능 여부 체크를 위한 뷰 생성
	@Override
	public void createRoomBookingView(Map<String, Object> map) {
		System.out.println("DAO - sql 문 : " + map.get("sql"));
		UserReservationDAO dao = sqlSession.getMapper(UserReservationDAO.class);
		dao.createRoomBookingView(map);
	}

	// 이름, 사장코드로 room_setting_code 가져오기
	@Override
	public String getRoomCodeByName(Map<String, Object> map) {
		
		return sqlSession.selectOne("com.spring.Creamy_CRM.User_dao.UserReservationDAO.getRoomCodeByName", map);
	}

	
	
	

}
