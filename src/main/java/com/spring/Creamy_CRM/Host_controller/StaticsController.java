/*
 * CRM - 통계 페이지 controller
 * 
*/
package com.spring.Creamy_CRM.Host_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.Creamy_CRM.Host_dao.StaticsDAOImpl;
import com.spring.Creamy_CRM.Host_service.CRMuserServiceImpl;
import com.spring.Creamy_CRM.Host_service.StaticsServiceImpl;
import com.spring.Creamy_CRM.VO.StaticVO;

@Controller
public class StaticsController {

	private static final Logger logger = LoggerFactory.getLogger(StaticsController.class);
	
	@Autowired
	CRMuserServiceImpl service_user;
	
	@Autowired
	StaticsServiceImpl service_statics;
	
	@Autowired
	StaticsDAOImpl dao_statics;
	
	// 회원통계
	@RequestMapping("host/userStatics")
	public String userStatics(HttpServletRequest req, Model model) {
		logger.info("url -> userStatics");
		
		// 회원 목록 출력
		service_user.printUsers(req, model);
		
		// 성비 계산
		service_statics.static_gender_ratio(req, model);
		
		// 연령 계산
		service_statics.static_age_ratio(req, model);
		
		// 월별 인원 현황
		service_statics.static_numOfUserByMonth(req, model);
		
		return "host/statics/userStatics";
	}
	
	// 판매통계
	// 상품별 판매 현황(통계)
	@RequestMapping("host/salesStatics")
	public String salesStatics(HttpServletRequest req, Model model) {
		logger.info("url -> salesStatics");		
		
		String host_code = (String) req.getSession().getAttribute("code");
		System.out.println("host_code : " + host_code);
		
		// employee_code 가져오기
	    List<StaticVO> emp_code = dao_statics.getEmpCode(host_code);
	    System.out.println("emp_code : " + emp_code);
		
		// room_setting_code 가져오기
	    List<StaticVO> room_setting_code = dao_statics.getRoomCode(host_code);
	    System.out.println("room_setting_code : " + room_setting_code);
	    
	    model.addAttribute("emp_code", emp_code);
	    model.addAttribute("room_setting_code", room_setting_code);
		
		return "host/statics/salesStatics";
	}
	
	// 담당자별 판매 현황(통계)
	@RequestMapping("host/managerSalesStatics")
	public String managerSalesStatics(HttpServletRequest req, Model model) {
		logger.info("url -> managerSalesStatics");
		
		// 담당자별 판매정보 목록 출력
		service_statics.static_managerSales(req, model);

		// salesTypeStatics jsp파일 이름
		return "host/statics/managerSalesStatics";
	}
	
	// 유형별(호실별) 판매 현황(통계)
	@RequestMapping("host/roomSalesStatics")
	public String roomSalesStatics(HttpServletRequest req, Model model) {
		logger.info("url -> roomSalesStatics");
		
		// 호실별 판매정보 목록 출력
		service_statics.static_roomSales(req, model);

		
		return "host/statics/roomSalesStatics";
	}

}
