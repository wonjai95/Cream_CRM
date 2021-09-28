package com.spring.Creamy_CRM.VO;

public class OperatingScheVO {
	
	private String operating_sche_code; // 영업 시간 설정 코드
	private String host_code; // 사장 코드
	private String operating_day;	// 영업 요일
	private String open_sche; // 시작 시간
	private String close_sche; // 종료 시간
	
	public String getOperating_sche_code() {
		return operating_sche_code;
	}
	public void setOperating_sche_code(String operating_sche_code) {
		this.operating_sche_code = operating_sche_code;
	}
	public String getHost_code() {
		return host_code;
	}
	public void setHost_code(String host_code) {
		this.host_code = host_code;
	}
	public String getOperating_day() {
		return operating_day;
	}
	public void setOperating_day(String operating_day) {
		this.operating_day = operating_day;
	}
	public String getOpen_sche() {
		return open_sche;
	}
	public void setOpen_sche(String open_sche) {
		this.open_sche = open_sche;
	}
	public String getClose_sche() {
		return close_sche;
	}
	public void setClose_sche(String close_sche) {
		this.close_sche = close_sche;
	}
	
}
