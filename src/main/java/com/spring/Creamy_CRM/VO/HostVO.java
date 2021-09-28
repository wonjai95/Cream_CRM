/*
 * 작성자 : 주수림
 * 작성일 : 2021.09.15
 * host_tbl vo
 * 
*/
package com.spring.Creamy_CRM.VO;

public class HostVO {

	private String host_code; // 관리자 코드 PK
	private String host_id; // 관리자 아이디 FK
	private String host_pw; // 관리자 비밀번호
	private String host_email; // 관리자 이메일
	private String host_name; // 관리자 이름
	private String comp_name; // 회사명
	private String host_ph; // 사장님 전화번호

	// 사업자 테이블
	private String comp_no; // 사업자 등록 번호
	private String comp_address; // 주소
	private String comp_condition; // 업태
	private String comp_type; // 업종
	private String zipcode; // 우편번호
	private String comp_res; // 예약 종류('호실', '담당자')

	// 영업시간 설정
	private String operating_sche_code; // 영업 시간 설정 코드
	private String operating_day; // 영업 요일
	private String open_sche; // 영업 시작 시간
	private String close_sche; // 영업 종료 시간

	// 직원 정보
	private String employee_code; // 직원코드
	private String employee_name; // 직원이름

	public String getHost_code() {
		return host_code;
	}

	public void setHost_code(String host_code) {
		this.host_code = host_code;
	}

	public String getHost_id() {
		return host_id;
	}

	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}

	public String getHost_pw() {
		return host_pw;
	}

	public void setHost_pw(String host_pw) {
		this.host_pw = host_pw;
	}

	public String getHost_email() {
		return host_email;
	}

	public void setHost_email(String host_email) {
		this.host_email = host_email;
	}

	public String getHost_name() {
		return host_name;
	}

	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}

	public String getComp_name() {
		return comp_name;
	}

	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}

	public String getHost_ph() {
		return host_ph;
	}

	public void setHost_ph(String host_ph) {
		this.host_ph = host_ph;
	}

	public String getComp_no() {
		return comp_no;
	}

	public void setComp_no(String comp_no) {
		this.comp_no = comp_no;
	}

	public String getComp_address() {
		return comp_address;
	}

	public void setComp_address(String comp_address) {
		this.comp_address = comp_address;
	}

	public String getComp_condition() {
		return comp_condition;
	}

	public void setComp_condition(String comp_condition) {
		this.comp_condition = comp_condition;
	}

	public String getComp_type() {
		return comp_type;
	}

	public void setComp_type(String comp_type) {
		this.comp_type = comp_type;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getComp_res() {
		return comp_res;
	}

	public void setComp_res(String comp_res) {
		this.comp_res = comp_res;
	}

	public String getOperating_sche_code() {
		return operating_sche_code;
	}

	public void setOperating_sche_code(String operating_sche_code) {
		this.operating_sche_code = operating_sche_code;
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

	public String getEmployee_code() {
		return employee_code;
	}

	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

}