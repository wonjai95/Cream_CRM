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
		
		service.NOLlist(req, model);
		
		return "host/accounting/Non_operating_loss_list";
	}
	
	// 매입매출 - 판매비와 관리비 등록 처리
	@RequestMapping("/host/insertSGA")
	public @ResponseBody String insertSGA(HttpServletRequest req, Model model) {
		logger.info("url -> insertSGA");
	  
		String strDate = req.getParameter("SGA_regDate");
		Date slip_regDate = Date.valueOf(strDate);
		String slip_type = req.getParameter("SGA_type");
		int slip_money = Integer.parseInt(req.getParameter("SGA_money"));
		String slip_memo = req.getParameter("SGA_memo");
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
	@RequestMapping("host/SGA_List")
	public String slip_List(HttpServletRequest req, Model model) {
		logger.info("url -> SGA_List]");
		
		service.getSelectList(req, model);
		
		return "host/accounting/SGA_List";
	}
	
	// 검색어 조회
	@RequestMapping("host/slip_Search")
	public String slip_Search(HttpServletRequest req, Model model) {
		logger.info("url -> slip_Search");
		
		service.getSearchList(req, model);
		
		return "host/accounting/slip_List";
	}
	
	
	// 매입매출 수정 페이지
	@RequestMapping("/host/SGA_modify")
	public String SGA_modify(HttpServletRequest req, Model model) {
		logger.info("url -> SGA_modify");
	  
		service.getSlipInfo(req, model);
		
		return "host/accounting/SGA_modify";
	}
	
	// 매입매출 수정 처리
	@RequestMapping("/host/SGA_modifyAction")
	public String SGA_modifyAction(HttpServletRequest req, Model model) {
		logger.info("url -> SGA_modifyAction");
		
		service.modifySlip(req, model);
		
		return "host/accounting/SGA_modifyAction";
	}
	
	// 매입매출 삭제 처리
	@RequestMapping("/host/SGA_deleteAction")
	public String SGA_deleteAction(HttpServletRequest req, Model model) {
		logger.info("url -> SGA_deleteAction");
		
		service.deleteSlip(req, model);
		return "host/accounting/SGA_deleteAction";
	}
	
	// 매입매출 - 영업외 손익등록 처리
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
	
	// 매입매출 - 영업외손익 수정 페이지
	@RequestMapping("/host/NOL_modify")
	public String NOL_modify(HttpServletRequest req, Model model) {
		logger.info("url -> NOL_modify");
		
		service.getNOLInfo(req, model);
		
		return "host/accounting/NOL_modify";
	}
	
	// 매입매출 - 영업외손익 수정 처리
	@RequestMapping("/host/NOL_modifyAction")
	public String NOL_modifyAction(HttpServletRequest req, Model model) {
		logger.info("url -> NOL_modifyAction");
		
		service.modifyNOL(req, model);
		
		return "host/accounting/NOL_modifyAction";
	}
	
	// 매입매출 - 영업외손익 삭제 처리
	@RequestMapping("/host/NOL_deleteAction")
	public String NOL_deleteAction(HttpServletRequest req, Model model) {
		logger.info("url -> NOL_deleteAction");
		
		service.deleteNOL(req, model);
		
		return "host/accounting/NOL_deleteAction";
	}
	
	// 영업외손익 유형별 검색
	@RequestMapping("/host/NOL_List")
	public String NOL_List(HttpServletRequest req, Model model) {
		logger.info("url -> NOL_List");
		
		service.getNOLselectList(req, model);
		
		return "host/accounting/Non_operating_loss_list";
	}
	
	// 검색어에 따른 영업외손익 검색
	@RequestMapping("/host/NOL_Search")
	public String NOL_Search(HttpServletRequest req, Model model) {
		logger.info("url -> NOL_Search");
		
		service.getNOLsearchList(req, model);
		
		return "host/accounting/Non_operating_loss_list";
	}

}
