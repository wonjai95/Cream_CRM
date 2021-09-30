package com.spring.Creamy_CRM.User_service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.ProductDAO;
import com.spring.Creamy_CRM.User_dao.SaleDAO;
import com.spring.Creamy_CRM.VO.userVO;

@Service
public class SaleServiceImpl implements SaleService {

	@Autowired
	SaleDAO dao;
	
	@Autowired
	ProductDAO dao_pro;
	
	Date today = new Date(0);
	
	
	// 회원 - 결제(결제 정보 insert)
	/*
	@Override
	public void insertSaleInfo(HttpServletRequest req, Model model) {
		System.out.println("service ==> insertSaleInfo");

		String user_id = (String) req.getSession().getAttribute("id");
		System.out.println("user_id : " + user_id);
		
		int total_payment = Integer.parseInt(req.getParameter("total_payment"));
		System.out.println("total_payment : " + total_payment);
		String payment_option = req.getParameter("payment_option_hidden");
		System.out.println("payment_option  : " + payment_option);
		
		String credit_select = req.getParameter("credit_select");
		System.out.println("credit_select : " + credit_select);
		String credit_installment = req.getParameter("credit_installment");
		System.out.println("credit_installment : " + credit_installment);
		String sale_memo = req.getParameter("sale_memo");
		String employee_code = req.getParameter("employee_name");
		String res_code = req.getParameter("res_code");
		String room_setting_code = req.getParameter("room_setting_code");
		
		userVO vo = new userVO();
		vo.setTotal_payment(total_payment);
		vo.setPayment_option(payment_option);
		vo.setCredit_select(credit_select);
		vo.setCredit_installment(credit_installment);
		
		vo.setSale_date(today);
		vo.setSale_memo(sale_memo);
		vo.setEmployee_code(employee_code);
		
		vo.setUser_id(user_id);
		vo.setRes_code(res_code);
		vo.setRoom_setting_code(room_setting_code);
		
		int insertCnt = dao_pro.addSaleInfo(vo);
		
		model.addAttribute("insertCnt_sale", insertCnt);
		model.addAttribute("dto", vo);
		
		
	}
*/


}
