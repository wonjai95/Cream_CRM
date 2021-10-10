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

	// host_code를 이용한 comp_res 가져오기
	@Override
	public String getCompRes(String host_code) {
		ReservationDAO dao = sqlSession.getMapper(ReservationDAO.class);
		return dao.getCompRes(host_code);
	}
	
	// 예약요청 목록 조회
	// 1. 예약상태가 "서비스 완료"가 아닌 모든 예약요청 목록(예약완료 & 예약취소) 조회
	// 1-1. 모든 예약요청 목록 중 사장님코드 별 예약종류(comp_res)가 "담당자"인 경우
	@Override
	public List<ReservationVO> getRequestMngList(Map<String, Object> map) {
		
		//ArrayList<reservationVO> list = null;
		
		// 방법1. mapper를 호출하는 방식 | 리턴타입이 반드시 List<reservationVO> 이어야함
		List<ReservationVO> list = sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getRequestMngList", map);
		return list;
	}
	// 1-2. 모든 예약요청 목록 중 사장님코드 별 예약종류(comp_res)가 "호실"인 경우
	@Override
	public List<ReservationVO> getRequestRoomList(Map<String, Object> map) {
		
		//ArrayList<reservationVO> list = null;
		
		// 방법1. mapper를 호출하는 방식 | 리턴타입이 반드시 List<reservationVO> 이어야함
		List<ReservationVO> list = sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getRequestRoomList", map);
		return list;
	}
	// 2. 예약상태가 "서비스 완료"가 아닌 예약요청 목록(= 예약완료) 조회
	@Override
	public List<ReservationVO> getRequestComplete(Map<String, Object> map) {
		
		// 방법1. mapper를 호출하는 방식 | 리턴타입이 반드시 List<reservationVO> 이어야함
		List<ReservationVO> list = sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getRequestComplete", map);
		return list;
	}
	// 3. 예약상태가 "서비스 완료"가 아닌 예약요청 목록(= 예약취소) 조회
	@Override
	public List<ReservationVO> getRequestCancel(Map<String, Object> map) {
		
		// 방법1. mapper를 호출하는 방식 | 리턴타입이 반드시 List<reservationVO> 이어야함
		List<ReservationVO> list = sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getRequestCancel", map);
		return list;
	}

	
	// 예약요청 검색목록
	@Override
	public List<ReservationVO> requestSearch(Map<String, Object> map) {
		
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.ReservationDAO.requestSearch", map);
	}
	
	
	// 예약요청 상세 페이지 내 회원정보
	@Override
	public userVO getUserInfo(String user_id) {
		
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getUserInfo", user_id);
	}
	
	// 예약요청 상세 페이지, 수정 상세 페이지
	@Override
	public ReservationVO getRequestDetail(Map<String, Object> map) {
		
		ReservationVO dao = sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getRequestDetail", map);
		return dao;
		
//		ReservationDAO dao = sqlSession.getMapper(ReservationDAO.class);
//		return dao.getRequestDetail(num);
		
		// 결과가 존재한다면,
		// 1. 작은 바구니(BoardVO) 생성
		// 2. 게시글 한 건을 읽어서 rs 결과를 작은 바구니에 담는다
		//   rs 결과(= sql로부터 가져온 컬럼 값을 getter로 모두 가져옴)
		// 3. 작은 바구니 리턴
	}
	@Override
	public ReservationVO getRequestDetail2(Map<String, Object> map) {
		
		ReservationVO dao = sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getRequestDetail2", map);
		return dao;
		
//		ReservationDAO dao = sqlSession.getMapper(ReservationDAO.class);
//		return dao.getRequestDetail2(num);
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
	public int deleteRequest(ReservationVO vo) {
		
		ReservationDAO dao = sqlSession.getMapper(ReservationDAO.class);
		return dao.deleteRequest(vo);
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

	// 서비스완료 목록 조회
	// 1. 예약상태가 "서비스 완료"인 예약 목록 조회
	// 1-1. 모든 "서비스 완료" 예약 목록 중 사장님코드 별 예약종류(comp_res)가 "담당자"인 경우
	@Override
	public List<ReservationVO> getCompleteMngList(Map<String, Object> map) {
		
		List<ReservationVO> list = sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getCompleteMngList", map);
		return list;
	}
	// 1-2. 모든 "서비스 완료" 예약 목록 중 사장님코드 별 예약종류(comp_res)가 "호실"인 경우
	@Override
	public List<ReservationVO> getCompleteRoomList(Map<String, Object> map) {
		
		List<ReservationVO> list = sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getCompleteRoomList", map);
		return list;
	}

	// 예약조회 상세 페이지, 수정 상세 페이지
	@Override
	public ReservationVO getCompleteDetail(Map<String, Object> map) {
		
		ReservationVO dao = sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getCompleteDetail", map);
		return dao;
	}
	@Override
	public ReservationVO getCompleteDetail2(Map<String, Object> map) {
		
		ReservationVO dao = sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.ReservationDAO.getCompleteDetail2", map);
		return dao;
	}

	
	
}
