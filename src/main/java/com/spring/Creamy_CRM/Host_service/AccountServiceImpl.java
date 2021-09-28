/*
 * 작성자 : 
 * 작성일 : 
 * 회계 관련 service
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.AccountDAOImpl;
import com.spring.Creamy_CRM.VO.AccountVO;

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
		String slip_type = req.getParameter("slip_type");
		System.out.println("slip_type : " + slip_type);
		
		List<AccountVO> vo = dao.getSelectList(slip_type);
		
		model.addAttribute("vo", vo);
	}
	
	// 검색에 따른 매출전표 조회
	public void getSearchList(HttpServletRequest req, Model model) {
		String search = req.getParameter("search_content");
		System.out.println("search : " + search);
		
		List<AccountVO> vo = dao.getSearchList(search);
		
		model.addAttribute("vo", vo);
	}
	

	// 매입매출 전표 수정 페이지
	@Override
	public void getSlipInfo(HttpServletRequest req, Model model) {
		String slip_code = req.getParameter("slip_code");
		
		AccountVO vo = dao.getSlipInfo(slip_code);
		System.out.println("slip_money : " + vo.getSlip_money());
		model.addAttribute("dto", vo);
		
	}
	
	// 매입매출 수정 처리
	@Override
	public void modifySlip(HttpServletRequest req, Model model) {
		String slip_code = req.getParameter("slip_code");
		String strDate = req.getParameter("slip_regDate");
		Date slip_regDate = Date.valueOf(strDate);
		String slip_type = req.getParameter("slip_type");
		String strMoney = req.getParameter("slip_money");
		String slip_memo = req.getParameter("slip_memo");
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
		String slip_code = req.getParameter("slip_code");
		int deleteCnt = 0;
		
		deleteCnt = dao.deleteSlip(slip_code);
		model.addAttribute("deleteCnt", deleteCnt);
	}

	

	
	

}
