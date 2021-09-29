/*
 * 작성자 : 
 * 작성일 : 
 * 직원 관련 service interface
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface EmployeeService {
	
	// 직원 목록 조회
	public void employeeList(HttpServletRequest req, Model model);
	
	// 직원 검색
	public void employeeSearch(HttpServletRequest req, Model model);
	
	// 직원 상세 정보
	public void employeeDetail(HttpServletRequest req, Model model);
	
	// 직원 상세 정보 수정 처리
	public void updateEmployeeAction(HttpServletRequest req, Model model);
	
	// 직원 근태 목록 조회
	public void attendanceList(HttpServletRequest req, Model model);
	
	// 해당 월 직원 근태 목록 조회
	public void attendanceMonthList(HttpServletRequest req, Model model);
	
	// 수정할 근태 정보 가져오기
	public void getAttendanceInfo(HttpServletRequest req, Model model);
	
	// 직원 근태 수정 처리
	public void updateAttendance(HttpServletRequest req, Model model);
	
	// 직원 근태 삭제
	public void deleteAttendance(HttpServletRequest req, Model model);
	
	// 직원 휴가 목록 조회
	public void leaveList(HttpServletRequest req, Model model);
	
	// 수정할 휴가 정보 가져오기
	public void getLeaveInfo(HttpServletRequest req, Model model);
	
	// 직원 휴가 수정 처리
	public void updateLeave(HttpServletRequest req, Model model);
	
	// 직원 휴가 삭제
	public void deleteLeave(HttpServletRequest req, Model model);
	
	// 직원 급여 계약 목록 조회
	public void contractList(HttpServletRequest req, Model model);
	
	// 직원 급여 계약 삭제
	public void deleteContract(HttpServletRequest req, Model model);
	
	// 직원 급여 지급 등록
	public void insertPaymentAction(HttpServletRequest req, Model model);
	
	// 직원 급여 지금 목록 조회
	public void paymentList(HttpServletRequest req, Model model);
	
	// 직원 급여 지급 삭제
	public void deletePayment(HttpServletRequest req, Model model);
	
	// 직원 등록시 해당 id가 있는지 체크 
	public void chkEmployeeIdAction(HttpServletRequest req, Model model);

	// 직원 등록
	public void enlistEmployee(HttpServletRequest req, Model model);
	
	// 근태 등록 처리
	public void employeeAttendanceAction(HttpServletRequest req, Model model);
	
	// 근무시간 등록 처리
	public void employeeWorkHoursAction(HttpServletRequest req, Model model);
	
	// 휴가 등록 페이지
	public void regLeavePage(HttpServletRequest req, Model model);
	
	// 휴가 등록 처리
	public void leaveAction(HttpServletRequest req, Model model);
	
	// 급여 계약과 갱신 처리
	public void salaryContractAction(HttpServletRequest req, Model model);
	
	
}
