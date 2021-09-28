package com.spring.Creamy_CRM.User_dao;

import java.util.List;
import java.util.Map;

import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.ReviewVO;

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
	
}
