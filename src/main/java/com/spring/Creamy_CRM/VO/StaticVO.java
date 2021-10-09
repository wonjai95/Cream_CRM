package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class StaticVO {

	
	private String res_state;				// 예약상태
	private int salesCount;					// 판매건수(= 서비스완료된 예약코드 res_code)
	private int salesSum;					// 판매합계(= 서비스완료된 총금액 res_sales)
	private String employee_code;			// 담당자(직원) 코드
	private String employee_id;				// 담당자(직원) ID
	private String employee_name;			// 담당자(직원) 이름
	private String position;				// 담당자(직원) 직책
	private String host_code;				// 사장님 코드
	private Date res_date;					// 예약된 날짜(= 서비스완료로 기재된 예약건의 날짜)
	
	// getter & setter
	public String getRes_state() {
		return res_state;
	}
	public void setRes_state(String res_state) {
		this.res_state = res_state;
	}
	
	public int getSalesCount() {
		return salesCount;
	}
	public void setSalesCount(int salesCount) {
		this.salesCount = salesCount;
	}
	
	public int getSalesSum() {
		return salesSum;
	}
	public void setSalesSum(int salesSum) {
		this.salesSum = salesSum;
	}
	
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
	
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
	public String getHost_code() {
		return host_code;
	}
	public void setHost_code(String host_code) {
		this.host_code = host_code;
	}
	
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	
	
	
	
	
	
	
}
