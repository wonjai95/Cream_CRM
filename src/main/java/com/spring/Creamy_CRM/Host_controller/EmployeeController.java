/*
 * CRM - 직원 화면 controller
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

import com.spring.Creamy_CRM.Host_service.EmployeeServiceImpl;

@Controller
public class EmployeeController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Autowired
	EmployeeServiceImpl service;
	
	// 직원 목록
	@RequestMapping("host/employee")
	public String employee(HttpServletRequest req, Model model) {
		logger.info("url -> employee");
	  
		service.employeeList(req, model);
		
		return "host/employee/employee";
	}
	
	// 직원 검색
	@RequestMapping("host/employee_searchList")
	public String employee_searchList(HttpServletRequest req, Model model) {
		logger.info("url -> employee_searchList");
		
		service.employeeSearch(req, model);
		
		return "host/employee/employee_searchList";
	}
	
	// 직원 상세 정보
	@RequestMapping("host/employee_detail")
	public String employee_detail(HttpServletRequest req, Model model) {
		logger.info("url -> employee_detail");
	    
		service.employeeDetail(req, model);
		
		return "host/employee/employee_detail";
	}
	
	// 직원 수정
	@RequestMapping("host/employee_updateAction")
	public String employee_updateAction(HttpServletRequest req, Model model) {
		logger.info("url -> employee_updateAction]");
		
		service.updateEmployeeAction(req, model);
		
		return "host/employee/employee_enlistAction";
	}
	
	// 직원 근태 목록 조회
	@RequestMapping("host/employee_attendanceList")
	public String employee_attendanceList(HttpServletRequest req, Model model) {
		logger.info("url -> employee_attendanceList");
		
		service.attendanceList(req, model);
		
		return "host/employee/employee_attendanceList";
	}
	
	// 선택한 월의 직원 근태 목록 조회
	@RequestMapping("host/month_attendanceList")
	public String month_attendanceList(HttpServletRequest req, Model model) {
		logger.info("url -> month_attendanceList");
		
		service.attendanceMonthList(req, model);
		
		return "host/employee/month_attendanceList";
	}
	
	// 직원 근태 수정 페이지
	@RequestMapping("host/employee_getAttendanceInfo")
	public String employee_getAttendanceInfo(HttpServletRequest req, Model model) {
		logger.info("url -> employee_getAttendanceInfo");
		
		service.getAttendanceInfo(req, model);
		
		return "host/employee/employee_getAttendanceInfo";
	}
	
	// 직원 근태 수정 처리
	@RequestMapping("host/employee_updateAttendance")
	public String employee_updateAttendance(HttpServletRequest req, Model model) {
		logger.info("url -> employee_updateAttendance");
		
		service.updateAttendance(req, model);
		
		return "host/employee/employee_attendanceAction";
	}
	
	// 직원 근태 삭제
	@RequestMapping("host/employee_attendanceDelete")
	public String employee_attendanceDelete(HttpServletRequest req, Model model) {
		logger.info("url -> employee_attendanceDelete");
		
		service.deleteAttendance(req, model);
		
		return "host/employee/employee_attendanceAction";
	}
	
	// 직원 휴가 목록 조회
	@RequestMapping("host/employee_leaveList")
	public String employee_leaveList(HttpServletRequest req, Model model) {
		logger.info("url -> employee_leaveList");
		
		service.leaveList(req, model);
		
		return "host/employee/employee_leaveList";
	}
	
	// 직원 휴가 수정 페이지
	@RequestMapping("host/employee_getLeaveInfo")
	public String employee_getLeaveInfo(HttpServletRequest req, Model model) {
		logger.info("url -> employee_getLeaveInfo");
		
		service.getLeaveInfo(req, model);
		
		return "host/employee/employee_getLeaveInfo";
	}
	
	// 직원 휴가 수정 처리
	@RequestMapping("host/employee_leaveUpdate")
	public String employee_leaveUpdate(HttpServletRequest req, Model model) {
		logger.info("url -> employee_leaveUpdate");
		
		service.updateLeave(req, model);
		
		return "host/employee/employee_leaveAction";
	}
	
	// 직원 휴가 삭제
	@RequestMapping("host/employee_leaveDelete")
	public String employee_leaveDelete(HttpServletRequest req, Model model) {
		logger.info("url -> employee_leaveDelete");
		
		service.deleteLeave(req, model);
		
		return "host/employee/employee_leaveAction";
	}
	
	// 직원 급여 계약 목록 조회
	@RequestMapping("host/employee_contractList")
	public String employee_contractList(HttpServletRequest req, Model model) {
		logger.info("url -> employee_contractList");
		
		service.contractList(req, model);
		
		return "host/employee/employee_contractList";
	}
	
	// 직원 급여 계약 삭제
	@RequestMapping("host/employee_contractDelete")
	public String employee_contractDelete(HttpServletRequest req, Model model) {
		logger.info("url -> employee_contractDelete");
		
		service.deleteContract(req, model);
		
		return "host/employee/employee_contractAction";
	}
	
	// 급여 지급 등록
	@RequestMapping("host/employee_paymentAction")
	public String employee_paymentAction(HttpServletRequest req, Model model) {
		logger.info("url -> employee_paymentAction");
		
		service.insertPaymentAction(req, model);
		
		return "host/employee/employee_paymentAction";
	}
	
	// 급여 지급 조회
	@RequestMapping("host/employee_paymentList")
	public String employee_payment(HttpServletRequest req, Model model) {
		
		service.paymentList(req, model);
		
		return "host/employee/employee_paymentList";
	}
	
	// 직원 급여 지급 삭제
	@RequestMapping("host/employee_paymentDelete")
	public String employee_salaryDelete(HttpServletRequest req, Model model) {
		logger.info("url -> employee_paymentDelete");
		
		service.deletePayment(req, model);
		
		return "host/employee/employee_paymentAction";
	}
	   
	// 직원 등록
	@RequestMapping("host/employee_enlist")
	public String employee_enlist(HttpServletRequest req, Model model) {
		logger.info("url -> employee_enlist");
	  
		return "host/employee/employee_enlist";
	}
	
	// 직원 등록시 id 체크
	@RequestMapping("host/employee_IdChkAction")
	public String employee_confrimIdChk(HttpServletRequest req, Model model) {
		logger.info("url -> employee_IdChkAction");
		
		service.chkEmployeeIdAction(req, model);
		
		return "host/employee/employee_IdChkAction";
	}
	
	// 직원 등록 처리
	@RequestMapping("host/employee_enlistAction")
	public String employee_enlistAction(HttpServletRequest req, Model model) {
		logger.info("url -> employee_enlistAction");
		
		service.enlistEmployee(req, model);
		
		return "host/employee/employee_enlistAction";
	}
	
	// 근태 등록
	@RequestMapping("host/employee_attendance")
	public String employee_attendance(HttpServletRequest req, Model model) {
		logger.info("url -> employee_attendance");
		
		model.addAttribute("employee_code", req.getParameter("employee_code"));
		model.addAttribute("employee_name", req.getParameter("employee_name"));
		
		return "host/employee/employee_attendance";
	}
	
	// 근태 등록 처리
	@RequestMapping("host/employee_attendanceAction")
	public String employee_attendanceAction(HttpServletRequest req, Model model) {
		logger.info("url -> employee_attendanceAction");
		
		service.employeeAttendanceAction(req, model);
		return "host/employee/employee_attendanceAction";
	}
	
	// 근무시간
	@RequestMapping("host/employee_workhours")
	public String employee_workhours(HttpServletRequest req, Model model) {
		logger.info("url -> employee_workhours");
		
		model.addAttribute("employee_code", req.getParameter("employee_code"));
		model.addAttribute("employee_name", req.getParameter("employee_name"));

		return "host/employee/employee_workhours";
	}
	
	// 근무시간
	@RequestMapping("host/employee_workhoursAction")
	public String employee_workhoursAction(HttpServletRequest req, Model model) {
		logger.info("url -> employee_workhoursAction");
		
		service.employeeWorkHoursAction(req, model);
		return "host/employee/employee_workhoursAction";
	}
	
	
	// 휴가 등록 페이지
	@RequestMapping("host/employee_leave")
	public String employee_leave(HttpServletRequest req, Model model) {
		logger.info("url -> employee_leave");
		
		service.regLeavePage(req, model);
		return "host/employee/employee_leave";
	}
	
	// 휴가 등록 처리
	@RequestMapping("host/employee_leaveAction")
	public String employee_leaveAction(HttpServletRequest req, Model model) {
		logger.info("url -> employee_leaveAction");
		
		service.leaveAction(req, model);
		return "host/employee/employee_leaveAction";
	}
	
	// 급여 계약 등록
	@RequestMapping("host/employee_contract")
	public String employee_contract(HttpServletRequest req, Model model) {
		logger.info("url -> employee_contract");
		
		model.addAttribute("employee_code", req.getParameter("employee_code"));
		model.addAttribute("employee_name", req.getParameter("employee_name"));

		return "host/employee/employee_contract";
	}
	
	// 급여 계약 신규 등록 및 갱신 처리
	@RequestMapping("host/employee_contractAction")
	public String employee_contractAction(HttpServletRequest req, Model model) {
		logger.info("url -> employee_contractAction");
		
		service.salaryContractAction(req, model);
		return "host/employee/employee_contractAction";
	}
	
	
	
}
