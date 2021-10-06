package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class AttendanceVO {
	
	private String attendance_code;		// 근태시간코드
	private String employee_code;		// 직원 코드
	private Date attendance_date;		// 출근 날짜
	private String check_in_time;		// 출근시간
	private String check_out_time;		// 퇴근시간
	private String lateChk;			// 지각 여부
	private String temperature;			// 체온
	private String examination_chk1;	// 문진체크1
	private String examination_chk2;	// 문진체크2
	private String examination_chk3;	// 문진체크3
	private String memo;				// 메모
	
	
	
	
	public String getAttendance_code() {
		return attendance_code;
	}
	public void setAttendance_code(String attendance_code) {
		this.attendance_code = attendance_code;
	}
	public String getEmployee_code() {
		return employee_code;
	}
	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}
	public Date getAttendance_date() {
		return attendance_date;
	}
	public void setAttendance_date(Date attendance_date) {
		this.attendance_date = attendance_date;
	}
	public String getCheck_in_time() {
		return check_in_time;
	}
	public void setCheck_in_time(String check_in_time) {
		this.check_in_time = check_in_time;
	}
	public String getCheck_out_time() {
		return check_out_time;
	}
	public void setCheck_out_time(String check_out_time) {
		this.check_out_time = check_out_time;
	}
	public String getLateChk() {
		return lateChk;
	}
	public void setLateChk(String lateChk) {
		this.lateChk = lateChk;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public String getExamination_chk1() {
		return examination_chk1;
	}
	public void setExamination_chk1(String examination_chk1) {
		this.examination_chk1 = examination_chk1;
	}
	public String getExamination_chk2() {
		return examination_chk2;
	}
	public void setExamination_chk2(String examination_chk2) {
		this.examination_chk2 = examination_chk2;
	}
	public String getExamination_chk3() {
		return examination_chk3;
	}
	public void setExamination_chk3(String examination_chk3) {
		this.examination_chk3 = examination_chk3;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	
	

}
