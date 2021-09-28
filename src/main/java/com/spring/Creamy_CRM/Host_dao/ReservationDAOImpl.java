/*
 * 작성자 : 이시현
 * 작성일 : 2021-09-20 ~ 2021-09-20
 * 예약 관련 dao
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.userVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {

	// 커넥션풀 생성
	@Autowired
	private SqlSession sqlSession;
	
//======= 예약요청 탭 =======	
	// 예약요청 목록 갯수 구하기
	@Override
	public int getRequestCnt() {
		// 방법1. mapper를 호출하는 방식 | sqlSession.selectOne("패키지명.namespace명.getBoardCnt");
		// int selectCnt = sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getRequestCnt");
		// return selectCnt;
		
		// 방법2. 메서드를 활용/호출하는 방식
		ReservationDAO dao = sqlSession.getMapper(ReservationDAO.class);
		return dao.getRequestCnt();
	}

	// 예약요청 목록 조회
	@Override
	public List<ReservationVO> getRequestList(Map<String, Object> map) {
		
		//ArrayList<reservationVO> list = null;
		
		// 방법1. mapper를 호출하는 방식 | 리턴타입이 반드시 List<reservationVO> 이어야함
		List<ReservationVO> list = sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getRequestList", map);
		return list;
	}

	
	// 예약요청 검색목록
	@Override
	public List<ReservationVO> requestSearch(String res_code) {
		
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.ReservationDAO.requestSearch", res_code);
	}
	
	
	// 예약요청 상세 페이지 내 회원정보
	@Override
	public userVO getUserInfo(String user_id) {
		
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getUserInfo", user_id);
	}
	
	// 예약요청 상세 페이지, 수정 상세 페이지
	@Override
	public ReservationVO getRequestDetail(String num) {
		
		ReservationDAO dao = sqlSession.getMapper(ReservationDAO.class);
		return dao.getRequestDetail(num);
		
		// 결과가 존재한다면,
		// 1. 작은 바구니(BoardVO) 생성
		// 2. 게시글 한 건을 읽어서 rs 결과를 작은 바구니에 담는다
		//   rs 결과(= sql로부터 가져온 컬럼 값을 getter로 모두 가져옴)
		// 3. 작은 바구니 리턴
	}

	// 예약요청 수정 처리 페이지
	@Override
	public int updateRequest1(ReservationVO vo) {
		// SQL(DB) : reservation_tbl 업데이트
		ReservationDAO dao = sqlSession.getMapper(ReservationDAO.class);
		return dao.updateRequest1(vo) + dao.updateRequest2(vo);
	}
	@Override
	public int updateRequest2(ReservationVO vo) {
		// SQL(DB) : reservation_detail_tbl 업데이트
		ReservationDAO dao = sqlSession.getMapper(ReservationDAO.class);
		return dao.updateRequest2(vo);
	}

	// 예약요청 삭제 처리 페이지
	@Override
	public int deleteRequest1(String res_code) {
		
		ReservationDAO dao = sqlSession.getMapper(ReservationDAO.class);
		int deleteCnt = dao.deleteRequest1(res_code);
		
		return deleteCnt;
	}
	@Override
	public int deleteRequest2(String res_detail_code) {
		
		ReservationDAO dao = sqlSession.getMapper(ReservationDAO.class);
		int deleteCnt = dao.deleteRequest2(res_detail_code);
		
		return deleteCnt;
	}
	
	// 서비스 완료처리 페이지
	public int completeService(ReservationVO vo) {
		// SQL(DB) : reservation_tbl 업데이트
		ReservationDAO dao = sqlSession.getMapper(ReservationDAO.class);
		return dao.completeService(vo);
	}

//======= 예약조회 탭 =======
	// 예약조회 목록 갯수 구하기
	@Override
	public int getCompleteCnt() {
		// 방법2. 메서드를 활용/호출하는 방식
		ReservationDAO dao = sqlSession.getMapper(ReservationDAO.class);
		
		return dao.getCompleteCnt();
	}

	// 예약요청 목록 조회
	@Override
	public List<ReservationVO> getCompleteList(Map<String, Object> map) {

		//ArrayList<reservationVO> list = null;
		
		// 방법1. mapper를 호출하는 방식 | 리턴타입이 반드시 List<reservationVO> 이어야함
		List<ReservationVO> list = sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getCompleteList", map);
		return list;
	}

	
	
}
