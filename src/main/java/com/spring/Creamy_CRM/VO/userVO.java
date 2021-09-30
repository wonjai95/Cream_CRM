/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * user_tbl vo - sql변경으로 수정 예정
 * 
*/
package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class userVO {
	
	private String user_code;
	private String user_password;
	private String user_name;
	private String user_gender;
	private Date user_birth;
	private int user_age;
	private String user_email;
	private String zipcode;
	private String user_address;
	private String user_ph;
	private Date join_date;
	private Date expire_date;
	private String bank_code;
	private String user_id;
	private String user_memo;
	private Date wedding_anniversary;
	private String car_number;

	
	
	// sale_tbl(결제 테이블)
	private String sale_code;
	private int total_payment;
	private Date sale_date;
	private String payment_option;
	private String sale_memo;
	private String credit_select;
	private String credit_installment;
	
	// product_tbl(상품 테이블)
	private String product_code;
	private String product_name;
	private String product_typeOfSales;
	private int product_price;
	private int product_rentalPeriod;
	private String product_img;
	private Date product_indate;
	private String product_status;
	private String product_content;
	
	
	// product_group_tbl(상품 그룹 테이블)
	private String product_group_code;
	private String product_group_name;
	private Date pg_indate;
	
	
	// employee_tbl(직원 테이블)
	private String employee_code;
	private String employee_id;
	private String employee_name;
	private String employee_gender;
	private int employee_age;
	private String employee_email;
	private String employee_address;
	private String employee_ph;
	private Date employee_hireDate;
	private Date employee_resignDate;
	private String department;
	private String position;
	private String duty;
	private String job;
	private String employee_type;
	private String annual_leave_cnt;
	private String annual_leave_usage;
	
	// 예약
	private String res_code;
	private String room_setting_code;
	
	
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public Date getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}
	public int getUser_age() {
		return user_age;
	}
	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public Date getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(Date expire_date) {
		this.expire_date = expire_date;
	}
	public String getBank_code() {
		return bank_code;
	}
	public void setBank_code(String bank_code) {
		this.bank_code = bank_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_ph() {
		return user_ph;
	}
	public void setUser_ph(String user_ph) {
		this.user_ph = user_ph;
	}
	public String getUser_memo() {
		return user_memo;
	}
	public void setUser_memo(String user_memo) {
		this.user_memo = user_memo;
	}
	public Date getWedding_anniversary() {
		return wedding_anniversary;
	}
	public void setWedding_anniversary(Date wedding_anniversary) {
		this.wedding_anniversary = wedding_anniversary;
	}
	public String getCar_number() {
		return car_number;
	}
	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}
	
	
	
	
	
	// sale_tbl
	public String getSale_code() {
		return sale_code;
	}
	public void setSale_code(String sale_code) {
		this.sale_code = sale_code;
	}
	public int getTotal_payment() {
		return total_payment;
	}
	public void setTotal_payment(int total_payment) {
		this.total_payment = total_payment;
	}
	public Date getSale_date() {
		return sale_date;
	}
	public void setSale_date(Date sale_date) {
		this.sale_date = sale_date;
	}
	public String getPayment_option() {
		return payment_option;
	}
	public void setPayment_option(String payment_option) {
		this.payment_option = payment_option;
	}
	public String getSale_memo() {
		return sale_memo;
	}
	public void setSale_memo(String sale_memo) {
		this.sale_memo = sale_memo;
	}
	public String getCredit_select() {
		return credit_select;
	}
	public void setCredit_select(String credit_select) {
		this.credit_select = credit_select;
	}
	public String getCredit_installment() {
		return credit_installment;
	}
	public void setCredit_installment(String credit_installment) {
		this.credit_installment = credit_installment;
	}
	
	
	
	// product_tbl
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_typeOfSales() {
		return product_typeOfSales;
	}
	public void setProduct_typeOfSales(String product_typeOfSales) {
		this.product_typeOfSales = product_typeOfSales;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_rentalPeriod() {
		return product_rentalPeriod;
	}
	public void setProduct_rentalPeriod(int product_rentalPeriod) {
		this.product_rentalPeriod = product_rentalPeriod;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public Date getProduct_indate() {
		return product_indate;
	}
	public void setProduct_indate(Date product_indate) {
		this.product_indate = product_indate;
	}
	public String getProduct_status() {
		return product_status;
	}
	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	
	
	// product_group_tbl
	public String getProduct_group_code() {
		return product_group_code;
	}
	public void setProduct_group_code(String product_group_code) {
		this.product_group_code = product_group_code;
	}
	public String getProduct_group_name() {
		return product_group_name;
	}
	public void setProduct_group_name(String product_group_name) {
		this.product_group_name = product_group_name;
	}
	public Date getPg_indate() {
		return pg_indate;
	}
	public void setPg_indate(Date pg_indate) {
		this.pg_indate = pg_indate;
	}
	
	
	// employee_tbl
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
	public void setEmployee_resignDate(Date employee_resignDate) {
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
	public String getAnnual_leave_cnt() {
		return annual_leave_cnt;
	}
	public void setAnnual_leave_cnt(String annual_leave_cnt) {
		this.annual_leave_cnt = annual_leave_cnt;
	}
	public String getAnnual_leave_usage() {
		return annual_leave_usage;
	}
	public void setAnnual_leave_usage(String annual_leave_usage) {
		this.annual_leave_usage = annual_leave_usage;
	}


	
	
	
	
	
	
}
