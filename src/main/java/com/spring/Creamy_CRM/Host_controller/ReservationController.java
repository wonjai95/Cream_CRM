/*
 * CRM - 예약 controller 
 * 
*/
package com.spring.Creamy_CRM.Host_controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.Creamy_CRM.Host_service.ReservationServiceImpl;

@Controller
public class ReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	ReservationServiceImpl service;
	
	//예약 첫 페이지
	@RequestMapping("/host/reservation")
	public String reservation(HttpServletRequest req, Model model) {
		logger.info("url -> reservation");
		
		String user_id = req.getParameter("user_id");
		System.out.println("user_id : " + user_id);
		
		service.requestList(req, model);
		//service.requestSearch(req, model);
		
		service.completeList(req, model);
		return "host/reservation/reservation";
	}
	//예약 요청
	@RequestMapping("/host/requestReservation")
	public String requestReservation(HttpServletRequest req, Model model) {
		logger.info("url -> requestReservation");
		
		return "host/reservation/requestReservation";
	}
	//예약 요청 이동
	@RequestMapping("/host/requestDetails")
	public String requestDetails(HttpServletRequest req, Model model) {
		logger.info("url -> requestDetails");
		
		service.requestDetailAction(req, model);
		
		return "host/reservation/requestDetails";
	}
	//예약 요청 상세페이지
	@RequestMapping("/host/requestDetail")
	public String requestDetail(HttpServletRequest req, Model model) {
		logger.info("url -> requestDetail");
		
		return "host/reservation/requestDetail";
	}
	//예약 등록
	@RequestMapping("/host/insertAction")
	public String insertAction(HttpServletRequest req, Model model) {
		logger.info("url -> insertAction");
		
		return "host/reservation/insertAction";
	}
	//예약 수정
	@RequestMapping("/host/modifyAction")
	public String modifyAction(HttpServletRequest req, Model model) {
		logger.info("url -> modifyAction");
		
		service.modifyAction(req, model);
		
		return "host/reservation/modifyAction";
	}
	//예약 취소
	@RequestMapping("/host/deleteAction")
	public String deleteAction(HttpServletRequest req, Model model) {
		logger.info("url -> deleteAction");
		
		service.deleteAction(req, model);
		
		return "host/reservation/deleteAction";
	}
	//예약 취소
	@RequestMapping("/host/completeAction")
	public String completeAction(HttpServletRequest req, Model model) {
		logger.info("url -> completeAction");
		
		service.completeAction(req, model);
		
		return "host/reservation/completeAction";
	}
	//예약 조회
	@RequestMapping("/host/showReservation")
	public String showReservation(HttpServletRequest req, Model model) {
		logger.info("url -> showReservation");
		
		service.completeList(req, model);
		
		return "host/reservation/showReservation";
	}
	//예약 조회 이동
	@RequestMapping("/host/completeDetails")
	public String completeDetails(HttpServletRequest req, Model model) {
		logger.info("url -> completeDetails");
		
		service.requestDetailAction(req, model);
		
		return "host/reservation/completeDetails";
	}
	//예약 요청 상세페이지
	@RequestMapping("/host/completeDetail")
	public String completeDetail(HttpServletRequest req, Model model) {
		logger.info("url -> completeDetail");
		
		return "host/reservation/completeDetail";
	}
	
}

