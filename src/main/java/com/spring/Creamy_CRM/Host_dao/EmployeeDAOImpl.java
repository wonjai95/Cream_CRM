/*
 * 작성자 : 
 * 작성일 : 
 * 회계 관련 dao
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.AttendanceVO;
import com.spring.Creamy_CRM.VO.EmployeeVO;
import com.spring.Creamy_CRM.VO.LeaveVO;
import com.spring.Creamy_CRM.VO.SalaryContractVO;
import com.spring.Creamy_CRM.VO.SalaryVO;
import com.spring.Creamy_CRM.VO.WorkingHoursVO;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	@Autowired
	SqlSession sqlSession;
	
	// 직원 목록 조회
	@Override
	public ArrayList<EmployeeVO> employeeList(String host_code) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.employeeList(host_code);
	}
	
	// 직원 코드 검색
	public ArrayList<EmployeeVO> searchCode(Map<String, Object> map){
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.searchCode(map);
	}
	
	// 직원명 검색
	public ArrayList<EmployeeVO> searchName(Map<String, Object> map){
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.searchName(map);
	}
	
	// 직원이름에 따른 직원코드
	@Override
	public EmployeeVO searchCodeByName(Map<String, Object> map) {
		
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.EmployeeDAO.searchCodeByName", map);
	}

	// 부서명 검색
	public ArrayList<EmployeeVO> searchDep(Map<String, Object> map){
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.searchDep(map);
	}
	
	// 직원 코드 + 직원명 검색
	public ArrayList<EmployeeVO> searchCoNa(Map<String, Object> map){
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.searchCoNa(map);
	}
	
	// 직원 코드 + 부서명 검색
	public ArrayList<EmployeeVO> searchCoDe(Map<String, Object> map){
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.searchCoDe(map);
	}
	
	// 직원명 + 부서명 검색
	public ArrayList<EmployeeVO> searchNaDe(Map<String, Object> map){
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.searchNaDe(map);
	}
	
	// 직원 코드 + 직원명 + 부서명 검색
	public ArrayList<EmployeeVO> searchCoNaDe(Map<String, Object> map){
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.searchCoNaDe(map);
	}
	
	// 직원 상제 정보
	@Override
	public EmployeeVO getEmployeeDetail(String employee_code) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.getEmployeeDetail(employee_code);
	}
	
	// 직원 수정 처리
	@Override
	public int updateEmployee(EmployeeVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.updateEmployee(vo);
	}
	
	// 직원의 근태 정보
	@Override
	public ArrayList<AttendanceVO> getAttendanceList(Map<String, Object> map){
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.getAttendanceList(map);
	}
	
	// 직원의 해당 근태 정보
	public AttendanceVO getAttendanceInfo(String attendance_code) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.getAttendanceInfo(attendance_code);
	}
	
	// 직원의 출근 정보 수정
	public int updateCheckInTime(AttendanceVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.updateCheckInTime(vo);
	}
		
	// 직원의 퇴근 정보 수정
	public int updateCheckOutTime(AttendanceVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.updateCheckOutTime(vo);
	}
	
	// 직원 근태 삭제
	public int deleteAttendance(String attendance_code) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.deleteAttendance(attendance_code);
	}
	
	// 직원의 휴가 정보
	@Override
	public ArrayList<LeaveVO> getLeaveList(Map<String, Object> map){
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.getLeaveList(map);
	}
	
	// 직원의 해당 휴가 정보
	public LeaveVO getLeaveInfo(String leave_code) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.getLeaveInfo(leave_code);
	}
	
	// 직원의 휴가 수정 처리
	public int updateLeave(LeaveVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.updateLeave(vo);
	}
	
	// 직원 휴가 삭제
	public int deleteLeave(String leave_code) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.deleteLeave(leave_code);
	}
	
	// 직원 사용 휴가 일수
	public int[] useLeaveDay(String employee_code) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.useLeaveDay(employee_code);
	}
	
	// 직원의 급여 계약 정보
	@Override
	public ArrayList<SalaryContractVO> getContractList(String employee_code){
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.getContractList(employee_code);
	}
	
	// 직원의 급여 계약 삭제
	@Override
	public int deleteContract(String salary_contract_code) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.deleteContract(salary_contract_code);
	}
	
	// 이미 급여 지급이 완료되었는지 체크
	public int chkPaymentAction(Map<String, Object> map) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.chkPaymentAction(map);
	}
	
	// 직원 급여 지급 등록
	@Override
	public int insertPayment(SalaryVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.insertPayment(vo);
	}
	
	// 직원 급여 지급 정보
	public ArrayList<SalaryVO> getPaymentList(Map<String, Object> map){
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.getPaymentList(map);
	}
	
	// 직원 급여 지급 삭제
	public int deletePayment(String salary_code) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.deletePayment(salary_code);
	}
	
	// 이미 직원 등록이 완료된 id인지 체크
	@Override
	public int chkEmployeeIdPreexisting(String employee_id) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.chkEmployeeIdPreexisting(employee_id);
	}
	
	// 직원 등록시 해당 id가 있는지 체크 
	@Override
	public int chkEmployeeIdAction(String ID) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.chkEmployeeIdAction(ID) + 2;
	}
	
	// 직원 id와 pwd를 Auth 테이블에 삽입 
	@Override
	public int insertEmployeeAuth(Map<String, Object> map) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.insertEmployeeAuth(map);
	}
	
	// 직원 등록
	@Override
	public int insertEmployee(EmployeeVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.insertEmployee(vo);
	}

	// 근태 - 출근 insert
	@Override
	public int insertAttendance(AttendanceVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.insertAttendance(vo);
	}

	// 근태 - 퇴근시 출근 기록 확인
	@Override
	public int chkIn(AttendanceVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.chkIn(vo);
	}

	// 근태 - 퇴근시 attendance_tbl 퇴근시간 update
	@Override
	public int updateAttendanceOut(AttendanceVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.updateAttendanceOut(vo);
	}

	// 근무시간 등록 여부 체크
	@Override
	public int chkWorkingHours(String employee_code) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.chkWorkingHours(employee_code);
	}

	// 근무시간 등록 
	@Override
	public int insertWorkingHours(WorkingHoursVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.insertWorkingHours(vo);
	}

	// 근무시간 update
	@Override
	public int updateWorkingHours(WorkingHoursVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.updateWorkingHours(vo);
	}

	// 휴가 등록 insert
	@Override
	public int insertLeave(LeaveVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.insertLeave(vo);
	}

	// 계좌 등록
	@Override
	public int insertBankInfo(SalaryContractVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.insertBankInfo(vo);
	}
	
	// 은행코드 조회
	@Override
	public String getBankCode(Map<String, Object> map) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.getBankCode(map);
	}
	
	// 급여 계약 등록
	@Override
	public int insertSalaryContract(SalaryContractVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.insertSalaryContract(vo);
	}

	// 은행 이미 등록되어있는지 확인
	@Override
	public int getBankCodeCnt(Map<String, Object> map) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.getBankCodeCnt(map);
	}

	// 등록된 급여 계약이 있는지 확인
	@Override
	public int chkSalaryContract(String employee_code) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.chkSalaryContract(employee_code);
	}

	// 해당 직원코드에 대해 이미 등록된 급여계약이 있을 경우 기존의 contract_stat = '계약 종료'로 update
	@Override
	public int updateSalaryContract(SalaryContractVO vo) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.updateSalaryContract(vo);
	}

	// 안드로이드 직원 근무시간 체크
	@Override
	public WorkingHoursVO getAttendanceDateInfo(Map<String, Object> map) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.getAttendanceDateInfo(map);
	}

	// 안드로이드 직원 코드 구하기
	@Override
	public String getEmpCode(String employee_id) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.getEmpCode(employee_id);
	}
	
	// 안드로이드 직원 근무시간 설정 여부 확인
	@Override
	public int getWorkingHoursCnt(String employee_code) {
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		return dao.getWorkingHoursCnt(employee_code);
	}	
	

	




	





}
