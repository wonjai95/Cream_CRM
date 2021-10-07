/*
 * 작성자 : 
 * 작성일 : 
 * 직원 관련 dao
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.ArrayList;
import java.util.Map;

import com.spring.Creamy_CRM.VO.AttendanceVO;
import com.spring.Creamy_CRM.VO.EmployeeVO;
import com.spring.Creamy_CRM.VO.LeaveVO;
import com.spring.Creamy_CRM.VO.SalaryContractVO;
import com.spring.Creamy_CRM.VO.SalaryVO;
import com.spring.Creamy_CRM.VO.WorkingHoursVO;
import com.spring.Creamy_CRM.VO.userVO;

public interface EmployeeDAO {

	// 직원 목록 조회
	public ArrayList<EmployeeVO> employeeList(String host_code);
	
	// 직원 코드 검색
	public ArrayList<EmployeeVO> searchCode(Map<String, Object> map);
	
	// 직원명 검색
	public ArrayList<EmployeeVO> searchName(Map<String, Object> map);
	
	// 직원이름에 따른 직원코드
	public EmployeeVO searchCodeByName(Map<String, Object> map);
	
	// 부서명 검색
	public ArrayList<EmployeeVO> searchDep(Map<String, Object> map);
	
	// 직원 코드 + 직원명 검색
	public ArrayList<EmployeeVO> searchCoNa(Map<String, Object> map);
	
	// 직원 코드 + 부서명 검색
	public ArrayList<EmployeeVO> searchCoDe(Map<String, Object> map);
	
	// 직원명 + 부서명 검색
	public ArrayList<EmployeeVO> searchNaDe(Map<String, Object> map);
	
	// 직원 코드 + 직원명 + 부서명 검색
	public ArrayList<EmployeeVO> searchCoNaDe(Map<String, Object> map);
	
	// 직원 상제 정보
	public EmployeeVO getEmployeeDetail(String employee_code);
	
	// 직원 수정 처리
	public int updateEmployee(EmployeeVO vo);
	
	// 직원의 근태 정보
	public ArrayList<AttendanceVO> getAttendanceList(Map<String, Object> map);
	
	// 직원의 해당 근태 정보
	public AttendanceVO getAttendanceInfo(String attendance_code);
	
	// 직원의 출근 정보 수정
	public int updateCheckInTime(AttendanceVO vo);
	
	// 직원의 퇴근 정보 수정
	public int updateCheckOutTime(AttendanceVO vo);
	
	// 직원 근태 삭제
	public int deleteAttendance(String attendance_code);
	
	// 직원의 휴가 정보
	public ArrayList<LeaveVO> getLeaveList(Map<String, Object> map);
	
	// 직원의 해당 휴가 정보
	public LeaveVO getLeaveInfo(String leave_code);
	
	// 직원의 휴가 수정 처리
	public int updateLeave(LeaveVO vo);
	
	// 직원 휴가 삭제
	public int deleteLeave(String leave_code);
	
	// 직원 사용 휴가 일수
	public int[] useLeaveDay(String employee_code);
	
	// 직원의 급여 계약 정보
	public ArrayList<SalaryContractVO> getContractList(String employee_code);
	
	// 직원의 급여 계약 삭제
	public int deleteContract(String salary_contract_code);
	
	// 이미 급여 지급이 완료되었는지 체크
	public int chkPaymentAction(Map<String, Object> map);
	
	// 직원 급여 지급 등록
	public int insertPayment(SalaryVO vo);
	
	// 직원 급여 지급 정보
	public ArrayList<SalaryVO> getPaymentList(Map<String, Object> map);
	
	// 직원 급여 지급 삭제
	public int deletePayment(String salary_code);
	
	// 이미 직원 등록이 완료된 id인지 체크
	public int chkEmployeeIdPreexisting(String employee_id);
	
	// 직원 등록시 해당 id가 있는지 체크 
	public int chkEmployeeIdAction(String employee_id);
	
	// 직원 id와 pwd를 Auth 테이블에 삽입 
	public int insertEmployeeAuth(Map<String, Object> map);
	
	// 직원 등록 
	public int insertEmployee(EmployeeVO vo);
	
	// 근태 - 출근 insert
	public int insertAttendance(AttendanceVO vo);
	
	// 근태 - 퇴근시 출근 기록 확인
	public int chkIn(AttendanceVO vo);
	
	// 근태 - 퇴근시 attendance_tbl 퇴근시간 update
	public int updateAttendanceOut(AttendanceVO vo);
	
	// 근무시간 등록 여부 체크
	public int chkWorkingHours(String employee_code);
	
	// 근무시간 등록 
	public int insertWorkingHours(WorkingHoursVO vo);
	
	// 근무시간 update
	public int updateWorkingHours(WorkingHoursVO vo);
	
	// 휴가 등록 insert
	public int insertLeave(LeaveVO vo);
	
	// 계좌 등록
	public int insertBankInfo(SalaryContractVO vo);
	
	// 은행코드 조회
	public String getBankCode(Map<String, Object> map);
	
	// 은행 이미 등록되어있는지 확인
	public int getBankCodeCnt(Map<String, Object> map);
	
	// 급여 계약 등록 
	public int insertSalaryContract(SalaryContractVO vo);
	
	// 등록된 급여 계약이 있는지 확인
	public int chkSalaryContract(String employee_code);
	
	// 해당 직원코드에 대해 이미 등록된 급여계약이 있을 경우 기존의 contract_stat = '계약 종료'로 update
	public int updateSalaryContract(SalaryContractVO vo);
	
	
	// 안드로이드 직원 근무시간 체크
	public WorkingHoursVO getAttendanceDateInfo(Map<String, Object> map);
	
	// 안드로이드 직원 코드 구하기
	public String getEmpCode(String employee_id);
}
