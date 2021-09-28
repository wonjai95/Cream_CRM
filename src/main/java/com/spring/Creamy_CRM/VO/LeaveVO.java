package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class LeaveVO {
	private String leave_code;			// 휴가코드
	private String employee_code;		// 직원코드
	private Date leave_date;			// 휴가 시작기간
	private Date leave_end;				// 휴가 끝기간
	private int leave_usage_cnt;		// 사용일수
	private String leave_reason;		// 사유
	private String emergency_contact;	// 비상연락망
	private String leave_memo;			// 기타 메모
	private Date leave_regDatae;		// 신청일자
	
	
	public String getLeave_code() {
		return leave_code;
	}
	public void setLeave_code(String leave_code) {
		this.leave_code = leave_code;
	}
	public String getEmployee_code() {
		return employee_code;
	}
	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}
	public Date getLeave_date() {
		return leave_date;
	}
	public void setLeave_date(Date leave_date) {
		this.leave_date = leave_date;
	}
	public Date getLeave_end() {
		return leave_end;
	}
	public void setLeave_end(Date leave_end) {
		this.leave_end = leave_end;
	}
	public int getLeave_usage_cnt() {
		return leave_usage_cnt;
	}
	public void setLeave_usage_cnt(int leave_usage_cnt) {
		this.leave_usage_cnt = leave_usage_cnt;
	}
	public String getLeave_reason() {
		return leave_reason;
	}
	public void setLeave_reason(String leave_reason) {
		this.leave_reason = leave_reason;
	}
	public String getEmergency_contact() {
		return emergency_contact;
	}
	public void setEmergency_contact(String emergency_contact) {
		this.emergency_contact = emergency_contact;
	}
	public String getLeave_memo() {
		return leave_memo;
	}
	public void setLeave_memo(String leave_memo) {
		this.leave_memo = leave_memo;
	}
	public Date getLeave_regDatae() {
		return leave_regDatae;
	}
	public void setLeave_regDatae(Date leave_regDatae) {
		this.leave_regDatae = leave_regDatae;
	}
	
	
	
}
