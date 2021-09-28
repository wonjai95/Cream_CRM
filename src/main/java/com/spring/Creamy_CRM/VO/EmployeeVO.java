package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class EmployeeVO {

	private String employee_code;		// 직원코드
	private String employee_id;			// 직원 ID
	private String host_code;			// 사장님 코드
	private String employee_name;		// 직원 이름
	private String employee_gender;		// 직원 성별
	private int employee_age;			// 직원 나이
	private String employee_email;		// 직원 이메일
	private String employee_address;	// 직원 주소
	private String employee_ph;			// 직원 연락처
	private Date employee_hireDate;		// 직원 입사날짜
	private Date employee_resignDate;	// 직원 퇴사날짜
	private String department;			// 부서
	private String position;			// 직책
	private String duty;				// 직위
	private String job;					// 업무
	private String employee_type;		// 고용 형태
	private int annual_leave_cnt;		// 연차일수
	private int annual_leave_usage;		// 연차 사용일수
	
	
	// getter, setter
	public String getEmployee_code() {
		return employee_code;
	}
	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getHost_code() {
		return host_code;
	}
	public void setHost_code(String host_code) {
		this.host_code = host_code;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getEmployee_gender() {
		return employee_gender;
	}
	public void setEmployee_gender(String employee_gender) {
		this.employee_gender = employee_gender;
	}
	public int getEmployee_age() {
		return employee_age;
	}
	public void setEmployee_age(int employee_age) {
		this.employee_age = employee_age;
	}
	public String getEmployee_email() {
		return employee_email;
	}
	public void setEmployee_email(String employee_email) {
		this.employee_email = employee_email;
	}
	public String getEmployee_address() {
		return employee_address;
	}
	public void setEmployee_address(String employee_address) {
		this.employee_address = employee_address;
	}
	public String getEmployee_ph() {
		return employee_ph;
	}
	public void setEmployee_ph(String employee_ph) {
		this.employee_ph = employee_ph;
	}
	public Date getEmployee_hireDate() {
		return employee_hireDate;
	}
	public void setEmployee_hireDate(Date employee_hireDate) {
		this.employee_hireDate = employee_hireDate;
	}
	public Date getEmployee_resignDate() {
		return employee_resignDate;
	}
	public void setEmployee_resginDate(Date employee_resignDate) {
		this.employee_resignDate = employee_resignDate;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getEmployee_type() {
		return employee_type;
	}
	public void setEmployee_type(String employee_type) {
		this.employee_type = employee_type;
	}
	public int getAnnual_leave_cnt() {
		return annual_leave_cnt;
	}
	public void setAnnual_leave_cnt(int annual_leave_cnt) {
		this.annual_leave_cnt = annual_leave_cnt;
	}
	public int getAnnual_leave_usage() {
		return annual_leave_usage;
	}
	public void setAnnual_leave_usage(int annual_leave_usage) {
		this.annual_leave_usage = annual_leave_usage;
	}
	public void setEmployee_resignDate(Date employee_resignDate) {
		this.employee_resignDate = employee_resignDate;
	}
	
	
	
	
	
	
	
	
}
