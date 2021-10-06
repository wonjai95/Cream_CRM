package com.spring.Creamy_CRM.User_dao;

import java.util.List;
import java.util.Map;

import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.ReviewVO;
import com.spring.Creamy_CRM.VO.outReviewVO;

public interface UserReviewDAO {
	
	//예약목록 조회
	public List<ReservationVO> getReservationList(String id); 
	
	//한건의 예약정보 받아오기
	public ReservationVO getReservationDetail(String res_code);

	//리뷰 insert
	public int InsertReview(ReviewVO vo);
	
	//리뷰 작성 완료시 예약테이블 체크 바꿔주기
	public int modifyresCheck(String res_code);
	
	//내가 쓴 리뷰 보기
	public List<ReviewVO> getMyReviewList(String user_code);
	
	//전체 후기 출력
	public List<ReviewVO> getAllReviewList();
	
	//매장별 후기 출력
	public List<ReviewVO> getStoreReviewList(String host_code);
	
	//관리자가 고객 후기에서 예약 목록 확인하는용도
	public List<ReservationVO> getUserReservationlist(String user_code);
	
	//리뷰 상세 받아오기
	public ReviewVO getReviewDetail(String review_code);
	
	//조회수 증가
	public int plusReadCnt(Map<String, Object> map);
	
	//리뷰 수정하기
	public int modify_Review(ReviewVO vo);
	
	//글제목으로 리뷰 검색
	public List<ReviewVO> getReviewSearch_title(Map<String, String> map);
	
	//작성자로 리뷰 검색
	public List<ReviewVO> getReviewSearch_user(Map<String, String> map);
	
	//등록일로 리뷰 검색
	public List<ReviewVO> getReviewSearch_date(Map<String, String> map);
	
	//-----------------------------------------------------------------
	
	
	//새 추적 등록
	public int addOutReview(outReviewVO vo);
	
	//새 추적 - 상세 테이블 등록
	public int addDetailOutReview(outReviewVO vo);
	
	//후기 추적 리스트 받아오기
	public List<outReviewVO> getOutreviewList(String host_code);
	
	//후기추적리스트 - 업데이트용
	public List<outReviewVO> getUpdateOutreviewList(String host_code);
	
	//그래프용 리스트 받아오기
	public List<outReviewVO> getGraphOutreviewList(String code);
	
	//오늘자 순위 업데이트되었는지 여부 카운트함
	public int getGraphCount();
	
	//detail update -> notnull
	public int insertDetail_ranknotnull(outReviewVO vo);
	
	//추적중단
	public int updateOutreview_rankout(outReviewVO vo);
	
	//하락한도 이내 -계속추적
	public int updateOutreview_MaxrankIn(outReviewVO vo);
	
	//추적 삭제
	public int deleteOutreview(String code);
	
	
	
}
