/*
 * 작성자 : 이시현
 * 작성일 : 2021-09-20 ~ 2021-09-20
 * 예약 관련 dao
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.userVO;

public interface ReservationDAO {

//======= 예약요청 탭 =======	
	// 예약요청 목록 갯수 구하기
	public int getRequestCnt();
	
	// 예약요청 목록 조회
	// 1. 예약상태가 "서비스 완료"가 아닌 모든 예약요청 목록(예약완료 & 예약취소) 조회
	// 1-1. 모든 예약요청 목록 중 사장님코드 별 예약종류(comp_res)가 "담당자"인 경우
	public List<ReservationVO> getRequestMngList(Map<String, Object> map);
	// 1-2. 모든 예약요청 목록 중 사장님코드 별 예약종류(comp_res)가 "호실"인 경우
	public List<ReservationVO> getRequestRoomList(Map<String, Object> map);
	// 2. 예약상태가 "서비스 완료"가 아닌 예약요청 목록(= 예약완료) 조회
	public List<ReservationVO> getRequestComplete(Map<String, Object> map);
	// 3. 예약상태가 "서비스 완료"가 아닌 예약요청 목록(= 예약취소) 조회
	public List<ReservationVO> getRequestCancel(Map<String, Object> map);
	
	// 예약요청 검색목록
	public List<ReservationVO> requestSearch(String res_code);
	
	// 예약요청 상세 페이지 내 회원정보
	public userVO getUserInfo(String user_id);
		
	// 예약요청 상세 페이지, 수정 상세 페이지
	public ReservationVO getRequestDetail(String num);
	public ReservationVO getRequestDetail2(String num);
	
	// 예약요청 수정 처리 페이지
	public int updateRequest1(ReservationVO vo);
	public int updateRequest2(ReservationVO vo);
	
	// 예약요청 삭제 처리 페이지
	public int deleteRequest(ReservationVO vo);
	//public int deleteRequest1(String res_code);
	//public int deleteRequest2(String res_detail_code);
	
	// 서비스 완료처리 페이지
	public int completeService(ReservationVO vo);
	
//======= 예약조회 탭 =======
	// 예약조회 목록 갯수 구하기
	public int getCompleteCnt();
	
	// 예약요청 목록 조회
	public List<ReservationVO> getCompleteList(Map<String, Object> map);
	
	// 예약조회 상세 페이지, 수정 상세 페이지
	//public void reservationVO getCompleteDetail(int num);
		
	
}
