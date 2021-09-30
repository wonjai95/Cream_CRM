/*
 * CRM - 회계 페이지 controller
 * 
*/
package com.spring.Creamy_CRM.Host_controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.Creamy_CRM.Host_dao.AccountDAOImpl;
import com.spring.Creamy_CRM.Host_service.AccountServiceImpl;
import com.spring.Creamy_CRM.VO.AccountVO;

@Controller
public class AccountController { 
	
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	AccountServiceImpl service;
	
	@Autowired
	AccountDAOImpl dao;
	
	// 손익 계산서
	@RequestMapping("/host/Accounting")
	public String Accounting(HttpServletRequest req, Model model) {
		logger.info("url -> Accounting");
	  
		return "host/accounting/Accounting";
	}
	
	// 매입매출 전표
	@RequestMapping("/host/SGA_expenses")
	public String SGA_expenses(HttpServletRequest req, Model model) {
		logger.info("url -> SGA_expenses");
	  
		service.slipList(req, model);
		
		return "host/accounting/SGA_expenses";
	}
	
	// 
	@RequestMapping("/host/Non_operating_loss")
	public String Non_operating_loss(HttpServletRequest req, Model model) {
		logger.info("url -> Non_operating_loss");
		
		return "host/accounting/Non_operating_loss";
	}
	
	// 매입매출 등록 처리
	@RequestMapping("/host/insertSlip")
	public @ResponseBody String insertSlip(HttpServletRequest req, Model model) {
		logger.info("url -> insertSlip");
	  
		String strDate = req.getParameter("slip_regDate");
		Date slip_regDate = Date.valueOf(strDate);
		String slip_type = req.getParameter("slip_type");
		int slip_money = Integer.parseInt(req.getParameter("slip_money"));
		String slip_memo = req.getParameter("slip_memo");
		String host_code = (String) req.getSession().getAttribute("code");
		
		AccountVO vo = new AccountVO();
		vo.setHost_code(host_code);
		vo.setSlip_regDate(slip_regDate);
		vo.setSlip_type(slip_type);
		vo.setSlip_money(slip_money);
		vo.setSlip_memo(slip_memo);
		
		int insertCnt = dao.insertSlip(vo);
		System.out.println("insertCnt : " + insertCnt);
		
		return Integer.toString(insertCnt);
		
	}
	
	// 매입매출 등록 처리
	@RequestMapping("/host/insertNOL")
	public @ResponseBody String insertNOL(HttpServletRequest req, Model model) {
		logger.info("url -> insertSlip");
	   
		String strDate = req.getParameter("operloss_regDate");
		Date slip_regDate = Date.valueOf(strDate);
		String slip_type = req.getParameter("operloss_type");
		int slip_money = Integer.parseInt(req.getParameter("operloss_money"));
		String slip_memo = req.getParameter("operloss_memo");
		String host_code = (String) req.getSession().getAttribute("code");
		
		AccountVO vo = new AccountVO();
		vo.setHost_code(host_code);
		vo.setSlip_regDate(slip_regDate);
		vo.setSlip_type(slip_type);
		vo.setSlip_money(slip_money);
		vo.setSlip_memo(slip_memo);
		
		int insertCnt = dao.insertSlip(vo);
		System.out.println("insertCnt : " + insertCnt);
		
		return Integer.toString(insertCnt);
		
	}
	
	// 목록에서 유형 선택시 해당되는 데이터만 출력
	@RequestMapping("host/slip_List")
	public String slip_List(HttpServletRequest req, Model model) {
		logger.info("url -> slip_List]");
		
		service.getSelectList(req, model);
		
		return "host/accounting/slip_List";
	}
	
	// 검색어 조회
	@RequestMapping("host/slip_Search")
	public String slip_Search(HttpServletRequest req, Model model) {
		logger.info("url -> slip_Search");
		
		service.getSearchList(req, model);
		
		return "host/accounting/slip_List";
	}
	
	
	// 매입매출 수정 페이지
	@RequestMapping("/host/slip_modify")
	public String slip_modify(HttpServletRequest req, Model model) {
		logger.info("url -> slip_modify");
	  
		service.getSlipInfo(req, model);
		return "host/accounting/slip_modify";
	}
	
	// 매입매출 수정 처리
	@RequestMapping("/host/slip_modifyAction")
	public String slip_modifyAction(HttpServletRequest req, Model model) {
		logger.info("url -> slip_modifyAction");
		
		service.modifySlip(req, model);
		return "host/accounting/slip_modifyAction";
	}
	
	// 매입매출 삭제 처리
	@RequestMapping("/host/slip_deleteAction")
	public String slip_deleteAction(HttpServletRequest req, Model model) {
		logger.info("url -> slip_deleteAction");
		
		service.deleteSlip(req, model);
		return "host/accounting/slip_deleteAction";
	}
	

}
