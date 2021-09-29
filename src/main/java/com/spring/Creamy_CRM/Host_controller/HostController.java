package com.spring.Creamy_CRM.Host_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.Creamy_CRM.Host_service.HostService;
import com.spring.Creamy_CRM.VO.RoomSettingVO;

@Controller
public class HostController {
	private static final Logger logger = LoggerFactory.getLogger(HostController.class);

	@Autowired
	private HostService service;

	@RequestMapping("/host/hostPage")
	public String mypage(HttpServletRequest req, Model model) {
		logger.info("url -> hostPage");
		service.getHostInfo(req, model);
		return "host/hostPage/hostPage";
	}

	// 시간설정
	@RequestMapping("/host/setWorkTime")
	public String setWorkTime(HttpServletRequest req, Model model) {
		logger.info("url -> setWorkTime");
		service.setWorkTime(req, model);
		return "host/hostPage/setWorkTime";
	}

	// 사업자 정보 등록(company)
	@RequestMapping("/host/addCompanyAction")
	public String addCompanyAction(HttpServletRequest req, Model model) {
		logger.info("url -> addCompanyAction");
		service.addCompanyAction(req, model);
		return "host/hostPage/addCompanyAction";
	}

	// 호실 리스트
	@RequestMapping("/host/roomList")
	public String roomList(HttpServletRequest req, Model model) {
		logger.info("url -> roomList");
		service.roomList(req, model);
		return "host/hostPage/roomListAction";
	}

	// 호실 등록 페이지
	@RequestMapping("/host/setRoom")
	public String addRoom(HttpServletRequest req, Model model) {
		logger.info("url -> setRoom");
		return "host/hostPage/setRoom";
	}
	
	// 호실 등록
	@ResponseBody
	@RequestMapping("/host/addRoomAction")
	public RoomSettingVO addRoomAction(HttpServletRequest req, Model model) {
		logger.info("url -> addRoomAction");
		return service.addRoomAction(req, model);
	}

	// 호실이름중복확인
	@ResponseBody
	@RequestMapping("/host/chkRoomName")
	public int chkRoomName(HttpServletRequest req, Model model) {
		logger.info("url -> chkRoomName");
		return service.chkRoomName(req, model);
	}

}
