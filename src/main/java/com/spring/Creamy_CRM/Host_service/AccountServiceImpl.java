/*
 * 작성자 : 
 * 작성일 : 
 * 회계 관련 service
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.AccountDAOImpl;
import com.spring.Creamy_CRM.VO.AccountVO;
import com.spring.Creamy_CRM.VO.CostofSalesVO;
import com.spring.Creamy_CRM.VO.EndingInventoryVO;
import com.spring.Creamy_CRM.VO.StockVO;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	AccountDAOImpl dao;

	// 판관비 목록
	@Override
	public void slipList(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		
		List<AccountVO> dtos = dao.getSlipList(host_code);
		
		model.addAttribute("dtos", dtos);
	}
	
	// 유형에 따른 매출전표 조회
	public void getSelectList(HttpServletRequest req, Model model) {
		String slip_type = req.getParameter("SGA_type");
		System.out.println("slip_type : " + slip_type);
		
		String host_code = (String) req.getSession().getAttribute("code");
		System.out.println("host_code : " + host_code);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("host_code", host_code);
		map.put("slip_type", slip_type);
		
		List<AccountVO> vo = dao.getSelectList(map);
		
		model.addAttribute("vo", vo);
	}
	
	// 검색에 따른 매출전표 조회
	public void getSearchList(HttpServletRequest req, Model model) {
		String search = req.getParameter("search_content");
		System.out.println("search : " + search);
		
		String host_code = (String) req.getSession().getAttribute("code");
		System.out.println("host_code : " + host_code);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("host_code", host_code);
		map.put("search", search);
		
		List<AccountVO> vo = dao.getSearchList(map);
		
		model.addAttribute("vo", vo);
	}
	

	// 매입매출 전표 수정 페이지
	@Override
	public void getSlipInfo(HttpServletRequest req, Model model) {
		String slip_code = req.getParameter("SGA_code");
		
		AccountVO vo = dao.getSlipInfo(slip_code);
		System.out.println("slip_money : " + vo.getSlip_money());
		model.addAttribute("dto", vo);
		
	}
	
	// 매입매출 수정 처리
	@Override
	public void modifySlip(HttpServletRequest req, Model model) {
		String slip_code = req.getParameter("SGA_code");
		String strDate = req.getParameter("SGA_regDate");
		Date slip_regDate = Date.valueOf(strDate);
		String slip_type = req.getParameter("SGA_type");
		String strMoney = req.getParameter("SGA_money");
		String slip_memo = req.getParameter("SGA_memo");
		int slip_money = 0;
		
		if(strMoney.contains(",")) {
			slip_money = Integer.parseInt(strMoney.replace(",", ""));
		} else {
			slip_money = Integer.parseInt(strMoney);
		}
		
		AccountVO vo = new AccountVO();
		vo.setSlip_code(slip_code);
		vo.setSlip_regDate(slip_regDate);
		vo.setSlip_type(slip_type);
		vo.setSlip_money(slip_money);
		vo.setSlip_memo(slip_memo);
		
		int updateCnt = 0;
		
		updateCnt = dao.updateSlip(vo);
		model.addAttribute("updateCnt", updateCnt);
		
	}

	// 매입매출 전표 삭제처리
	@Override
	public void deleteSlip(HttpServletRequest req, Model model) {
		String slip_code = req.getParameter("SGA_code");
		int deleteCnt = 0;
		
		deleteCnt = dao.deleteSlip(slip_code);
		model.addAttribute("deleteCnt", deleteCnt);
	}

	// 영업외 손익 목록 조회
	public void NOLlist(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		
		List<AccountVO> vo = dao.getNOLlist(host_code);
		
		model.addAttribute("NOL", vo);
	}

	
	// 엽업외손익 수정 페이지
	public void getNOLInfo(HttpServletRequest req, Model model) {
		String slip_code = req.getParameter("NOL_code");	
		
		AccountVO vo = dao.getSlipInfo(slip_code);
		System.out.println("slip_money : " + vo.getSlip_money());
		
		model.addAttribute("dto", vo);
	}
	
	// 영업외손익 수정 처리
	public void modifyNOL(HttpServletRequest req, Model model) {
		String slip_code = req.getParameter("NOL_code");
		String strDate = req.getParameter("NOL_regDate");
		Date slip_regDate = Date.valueOf(strDate);
		String slip_type = req.getParameter("NOL_type");
		String strMoney = req.getParameter("NOL_money");
		String slip_memo = req.getParameter("NOL_memo");
		int slip_money = 0;
		
		if(strMoney.contains(",")) {
			slip_money = Integer.parseInt(strMoney.replace(",", ""));
		} else {
			slip_money = Integer.parseInt(strMoney);
		}
		
		AccountVO vo = new AccountVO();
		vo.setSlip_code(slip_code);
		vo.setSlip_regDate(slip_regDate);
		vo.setSlip_type(slip_type);
		vo.setSlip_money(slip_money);
		vo.setSlip_memo(slip_memo);
		
		int updateCnt = 0;
		
		updateCnt = dao.updateSlip(vo);
		model.addAttribute("updateCnt", updateCnt);
	}
	
	// 영업외손익 삭제 처리
	public void deleteNOL(HttpServletRequest req, Model model) {
		String slip_code = req.getParameter("NOL_code");
		int deleteCnt = 0;
		
		deleteCnt = dao.deleteSlip(slip_code);
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	// 유형에 따른 영업외손익 조회
	public void getNOLselectList(HttpServletRequest req, Model model) {
		String slip_type = req.getParameter("NOL_type");
		System.out.println("slip_type : " + slip_type);
		
		String host_code = (String) req.getSession().getAttribute("code");
		System.out.println("host_code : " + host_code );
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("host_code", host_code);
		map.put("slip_type", slip_type);
		
		List<AccountVO> vo = dao.getNOLselectList(map);
		
		model.addAttribute("NOL", vo);
	}
	
	// 검색어에 따른 영업외손익 조회
	public void getNOLsearchList(HttpServletRequest req, Model model){
		String host_code = (String) req.getSession().getAttribute("code");
		System.out.println("host_code : " + host_code);
		
		String search = req.getParameter("search_content");
		System.out.println("search : " + search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("host_code", host_code);
		map.put("search", search);
		
		List<AccountVO> vo = dao.getNOLsearchList(map);
		
		model.addAttribute("NOL", vo);
	}
	
	// 손익계산서
	public void income_statement(HttpServletRequest req, Model model) {
		
	}
		
	// 결산
	public void settlement(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		System.out.println("host_code : " + host_code);
		
		String currentMonth = req.getParameter("currentMonth");
		System.out.println("currentMonth : " + currentMonth);
		
		// Date nowMonth = Date.valueOf(currentMonth);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("host_code", host_code);
		// map1.put("nowMonth", currentMonth);
		
		// 매출 <- 판매 테이블
		int Revenue = dao.getRevenue(map1);
		
		// 판매비와 관리비 테이블 <- 매출전표에서
		int[] sumExpenses = dao.sumSGA_expenses(map1);
		
		// 영업외손익 <- 매출전표에서
		int[] sumOperatingLoss = dao.sumNonOperatingLoss(map1);
		
		// 직원 급여 총합
		int TotalSalary = dao.getTotalSalary(map1);
		
		// 재고관리 <- 기초(전기 기말) / 당기(재고) / 기말(재고실사)
		
		// 1. 기초 재고액 <- 전기(전월)의 기말재고액
		EndingInventoryVO EIList = dao.getEndingInven(map1);
		System.out.println(EIList.getInven_price());
		System.out.println(EIList.getInven_cnt());
		
		// 2. 당기 매입액 <- 입고현황
		CostofSalesVO CSList = dao.getStockTotal(map1);
		System.out.println(CSList.getPullingPrice());
		System.out.println(CSList.getPullingCnt());
		
		// 3. 기말 재고액 <- 재고실사
		int TotalInvenCnt = dao.TotalInvenCnt(map1);
		System.out.println(TotalInvenCnt);
		
		int averagePrice = Math.round((EIList.getInven_price() + CSList.getPullingPrice()) / (EIList.getInven_cnt() + CSList.getPullingCnt()));
		System.out.println(averagePrice);
		
		int endingInvenPrice = (averagePrice * TotalInvenCnt); 
		
		
		model.addAttribute("Revenue", Revenue);
		model.addAttribute("EIList", EIList);
		model.addAttribute("CSList", CSList);
		model.addAttribute("endingInvenPrice", endingInvenPrice);
		model.addAttribute("TotalSalary", TotalSalary);
		model.addAttribute("sumExpenses", sumExpenses);
		model.addAttribute("sumOperatingLoss", sumOperatingLoss);
	}

}
