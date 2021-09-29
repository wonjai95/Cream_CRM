package com.spring.Creamy_CRM.Host_service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.spring.Creamy_CRM.VO.RoomSettingVO;

public interface HostService {
	static final int WEEK = 7;
	//마이페이지 정보
	void getHostInfo(HttpServletRequest req, Model model);
	//시간설정
	void setWorkTime(HttpServletRequest req, Model model);
	
	//사업자정보 등록
	void addCompanyAction(HttpServletRequest req, Model model);
	
	//호실 이름중복확인
	int chkRoomName(HttpServletRequest req, Model model);
	
	//호실 등록
	RoomSettingVO addRoomAction(HttpServletRequest req, Model model);

	//호실 리스트
	void roomList(HttpServletRequest req, Model model);
	
	
}
