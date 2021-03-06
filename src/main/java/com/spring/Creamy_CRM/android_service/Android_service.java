/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 안드로이드 처리를 담당할 service interface
 * 나중에 안드로이드 다시 연동할 예정
 * 
*/
package com.spring.Creamy_CRM.android_service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.ReviewVO;

public interface Android_service {

	//로그인
	public Map<String, String> login(HttpServletRequest req);
	
	//마이페이지 - 관리자
	public Map<String, Object> getInfomation(HttpServletRequest req);
	
	//마이페이지 - 고객
	public Map<String, Object> getUserInfomation(HttpServletRequest req);
	
	//회원가입
	public Map<String, Object> Join(HttpServletRequest req);

	
	// 결산 - 손익계산서 조회
	public Map<String, Object> getSettlement(HttpServletRequest req);


	// QR
	public Map<String, Object> getQrCode(HttpServletRequest req);
	
	//리뷰
	public List<ReviewVO> reviewListFromStore(HttpServletRequest req);


	// 비밀번호 변경전 비번 확인
	public Map<String, Object> modifyPW(HttpServletRequest req);
	
	// 비밀번호 변경
	public Map<String, Object> updatePW(HttpServletRequest req);
	

	
	// 관리자페이지 - 예약목록 조회
	public List<ReservationVO> getResList(HttpServletRequest req);
    //public Map<String, Object> getResList(HttpServletRequest req);


}
