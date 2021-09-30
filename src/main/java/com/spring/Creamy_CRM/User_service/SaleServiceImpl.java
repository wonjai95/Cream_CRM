package com.spring.Creamy_CRM.User_service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.LoginDAOImpl;
import com.spring.Creamy_CRM.Host_dao.ProductDAO;
import com.spring.Creamy_CRM.User_dao.SaleDAO;
import com.spring.Creamy_CRM.VO.userVO;

@Service
public class SaleServiceImpl implements SaleService {

	@Autowired
	SaleDAO dao;
	
	@Autowired
	ProductDAO dao_pro;
	
	@Autowired
	LoginDAOImpl dao_login;
	
	
	Date today = new Date(0);
	
	
	// 회원 - 결제(결제 정보 insert)
	@Override
	public void insertSaleInfo(HttpServletRequest req, Model model) {
		System.out.println("service ==> insertSaleInfo");

		String user_id = (String) req.getSession().getAttribute("id");
		System.out.println("user_id : " + user_id);
		
		//유저 코드 들고오기
		String user_code = dao_login.getUserInfo(user_id).getUser_code();
		
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
		
		userVO vo = new userVO();
		vo.setTotal_payment(total_payment);
		vo.setPayment_option(payment_option);
		vo.setCredit_select(credit_select);
		vo.setCredit_installment(credit_installment);
		
		vo.setSale_date(today);
		vo.setSale_memo(sale_memo);
		vo.setEmployee_code(employee_code);
		
		vo.setUser_id(user_id);
		vo.setUser_code(user_code);
		
		int insertCnt = dao.insertSaleInfo(vo);
		
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("dto", vo);
		System.out.println("결제 insertCnt : " + insertCnt);
		
	}



}
