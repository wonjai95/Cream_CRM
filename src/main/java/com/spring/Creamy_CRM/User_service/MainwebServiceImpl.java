/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.21
 * 제일 첫 메인화면 - 고객 service
 * 
*/
package com.spring.Creamy_CRM.User_service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.User_dao.MainwebDAOImpl;
import com.spring.Creamy_CRM.VO.ReservationVO;

@Service
public class MainwebServiceImpl implements MainwebService {

	@Autowired
	MainwebDAOImpl dao;
	
//======= 회원예약 =======		
	// 회원예약 등록처리
	@Override
	public void insertBooking(HttpServletRequest req, Model model) {
		System.out.println("insertBooking 시작합니다.");
		
		String host_code = req.getParameter("host_code");
		String user_id = (String) req.getSession().getAttribute("id");
		String res_state = "예약 완료";
		String employee_code = req.getParameter("employee_code");
		int res_cnt = Integer.parseInt(req.getParameter("GuestCount"));
		String res_indiv_request = req.getParameter("res_indiv_request");
		String product_code = req.getParameter("ReserveProduct");
		String res_memo = req.getParameter("res_memo");
		int res_sales = Integer.parseInt(req.getParameter("ReserveProductSum"));
		
		String selectDate = req.getParameter("selectDate");
		Date res_date = Date.valueOf(selectDate);
		
		String str_hour = req.getParameter("selectTime");
		String[] hours = str_hour.split(":");
		int res_hour = Integer.parseInt(hours[0]);
		
		// vo에 담기
		ReservationVO vo = new ReservationVO();
		vo.setHost_code(host_code);
		vo.setUser_id(user_id);							// 회원아이디
		vo.setRes_state(res_state);						// 예약상태(방문?예약중?예약완료?)
		vo.setRes_date(res_date);						// 예약날짜
		vo.setRes_hour(res_hour);						// 예약시간
		vo.setEmployee_code(employee_code);				// 예약담당자
		vo.setRes_cnt(res_cnt);							// 예약인원수
		vo.setRes_indiv_request(res_indiv_request);		// 특별요청(추가요청)
		vo.setProduct_code(product_code);				// 예약한 상품서비스
		vo.setRes_memo(res_memo);
		vo.setRes_sales(res_sales);
		
		System.out.println("user_id : " + user_id);
		System.out.println("res_state : " + res_state);
		System.out.println("res_hour : " + res_hour);
		System.out.println("employee_code : " + employee_code);
		System.out.println("res_cnt : " + res_cnt);
		System.out.println("res_indiv_request : " + res_indiv_request);
		System.out.println("product_code : " + product_code);
		
		int insertCnt = dao.insertBooking1(vo);
		System.out.println("insertCnt : " + insertCnt);  // insertCnt = 2
		
		model.addAttribute("insertCnt", insertCnt);
	}

	
	
	
	
	
	
}
