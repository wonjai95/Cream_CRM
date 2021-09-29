/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.21
 * 제일 첫 메인화면 - 고객 service
 * 
*/
package com.spring.Creamy_CRM.User_service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.ProductDAO;
import com.spring.Creamy_CRM.User_dao.MainwebDAOImpl;
import com.spring.Creamy_CRM.User_dao.SaleDAO;
import com.spring.Creamy_CRM.User_dao.UserReservationDAOImpl;
import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.userVO;

@Service
public class MainwebServiceImpl implements MainwebService {

	@Autowired
	MainwebDAOImpl dao;
	
	@Autowired
	UserReservationDAOImpl dao_res;
	
	@Autowired
	ProductDAO dao_pro;
	
	@Autowired
	SaleDAO dao_sale;
	
//======= 회원예약 =======		
	
	// 예약페이지에서 예약 정보 받아오기
	@Override
	public void getResInfo(HttpServletRequest req, Model model) {
		System.out.println("service => add_saleInfo - 예약 정보 가져오기");
		
		String user_id = (String) req.getSession().getAttribute("id");
		System.out.println("user_id : " + user_id);
		
		// 예약 페이지에서 예약 정보 담아오기
		String host_code = req.getParameter("host_code");
		String res_start = req.getParameter("res_start");
		System.out.println("res_start : " + res_start);
		int res_sales = Integer.parseInt(req.getParameter("res_sales"));
		int guestCount = Integer.parseInt(req.getParameter("GuestCount"));
		String res_state = "예약완료";
		String room_setting_code = req.getParameter("selectRoom");
		System.out.println("room_setting_code : " + room_setting_code);
		String res_indiv_request = req.getParameter("res_indiv_request");
		String str_res_date = req.getParameter("selectDate");
		System.out.println("str_res_date : " + str_res_date);
		Date res_date = Date.valueOf(str_res_date);
		
		String open_sche = req.getParameter("open_sche");
		String close_sche = req.getParameter("close_sche");
		
		int openTime = Integer.parseInt(open_sche.split(":")[0]);
		System.out.println("openTime : " + openTime);
		int closeTime = Integer.parseInt(close_sche.split(":")[0]);
		System.out.println("closeTime : " + closeTime); 
		   
		String comp_res = req.getParameter("comp_res");
		
		// vo에 담아서 넘겨주기
		ReservationVO vo = new ReservationVO();
		
		vo.setHost_code(host_code);
		vo.setRes_state(res_state);
		vo.setRes_cnt(guestCount);
		vo.setRoom_setting_code(room_setting_code);
		vo.setRes_indiv_request(res_indiv_request);
		vo.setUser_id(user_id);
		vo.setRes_date(res_date);
		vo.setRes_hour(Integer.parseInt(res_start));
		vo.setRes_sales(res_sales);
		vo.setComp_res(comp_res);
		
		// 예약 코드 생성
		
		int insertCnt = dao_sale.createResCD(room_setting_code);
		System.out.println("insertCnt : " + insertCnt);
		
		String res_code;
		
		if(insertCnt == 1) {
			res_code = vo.getRes_code();
		}
		
		
		model.addAttribute("dto", vo);
		
	}
	
	// 예약코드 생성
	@Override
	public void createResCD(HttpServletRequest req, Model model) {
		System.out.println("service => createResCD");
		
		String res_setting_code = req.getParameter("res_setting_code");
		
		int insertCnt = dao_sale.createResCD(res_setting_code);
		System.out.println("insertCnt : " + insertCnt);
		
		Class cls = res_setting_code.getClass();
		System.out.println("getClass : " + cls);
		
	}
		
	
	
	// 회원예약 등록처리
	@Override
	public void insertBooking(HttpServletRequest req, Model model) {
		System.out.println("insertBooking 시작합니다.");
		/*
		int insertCnt = dao.insertBooking1(vo);
		System.out.println("insertCnt : " + insertCnt);  // insertCnt = 2
		
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("vo", vo);
		System.out.println("vo.getRes_cnt : " + vo.getRes_cnt());
		*/
	}



	
	
	
	
	
	
}
