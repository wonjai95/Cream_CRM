package com.spring.Creamy_CRM.User_service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface UserReviewService {
	
	//예약목록 받아오기
	public void getReservationList(HttpServletRequest req, Model model);

	//한 건의 예약 정보 받아오기
	public void getReservationdetail(HttpServletRequest req, Model model);
	
	//리뷰 insert
	public void insertReviewAction(HttpServletRequest req, Model model);
	
	//내가 쓴 리뷰 보기
	public void getMyReviewList(HttpServletRequest req, Model model);
	
	//전체 후기 보기
	public void getReviewList(HttpServletRequest req, Model model);
	
	//매장별 후기 보기
	public void getStoreReviewList(HttpServletRequest req, Model model);
	
	//후기 클릭시 상세내용 출력
	public void ReviewDetail(HttpServletRequest req, Model model);
	
	//후기 수정 액션
	public void Modify_reviewAction(HttpServletRequest req, Model model);
	
	//검색 결과 list
	public void reviewSearchList(HttpServletRequest req, Model model);
	
	//-----------------------------------------------------
	//후기추적 - 키워드 검색
	public void SearchKeyword(HttpServletRequest req, Model model);
	
}
