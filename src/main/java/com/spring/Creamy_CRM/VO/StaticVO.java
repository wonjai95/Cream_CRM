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
	private String res_dates;				// String형 예약된 날짜(= 서비스완료로 기재된 예약건의 날짜)
	
	private String res_code;				// 예약 코드
	private String room_setting_code;		// 호실 코드
	private String room_name;				// 호실 이름
	
	
	private int totalSum;
	private int janSalesSum;
	private int febSalesSum;
	private int marSalesSum;
	private int aprSalesSum;
	private int maySalesSum;
	private int junSalesSum;
	private int julSalesSum;
	private int augSalesSum;
	private int sepSalesSum;
	private int octSalesSum;
	private int novSalesSum;
	private int decSalesSum;
	
	
	
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
	
	public String getRes_dates() {
		return res_dates;
	}
	public void setRes_dates(String res_dates) {
		this.res_dates = res_dates;
	}
	
	
	
	public String getRes_code() {
		return res_code;
	}
	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}
	
	public String getRoom_setting_code() {
		return room_setting_code;
	}
	public void setRoom_setting_code(String room_setting_code) {
		this.room_setting_code = room_setting_code;
	}
	
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	
	
	
	
	
	
	
	public int getTotalSum() {
		return totalSum;
	}
	public void setTotalSum(int totalSum) {
		this.totalSum = totalSum;
	}
	public int getJanSalesSum() {
		return janSalesSum;
	}
	public void setJanSalesSum(int janSalesSum) {
		this.janSalesSum = janSalesSum;
	}
	public int getFebSalesSum() {
		return febSalesSum;
	}
	public void setFebSalesSum(int febSalesSum) {
		this.febSalesSum = febSalesSum;
	}
	public int getMarSalesSum() {
		return marSalesSum;
	}
	public void setMarSalesSum(int marSalesSum) {
		this.marSalesSum = marSalesSum;
	}
	public int getAprSalesSum() {
		return aprSalesSum;
	}
	public void setAprSalesSum(int aprSalesSum) {
		this.aprSalesSum = aprSalesSum;
	}
	public int getMaySalesSum() {
		return maySalesSum;
	}
	public void setMaySalesSum(int maySalesSum) {
		this.maySalesSum = maySalesSum;
	}
	public int getJunSalesSum() {
		return junSalesSum;
	}
	public void setJunSalesSum(int junSalesSum) {
		this.junSalesSum = junSalesSum;
	}
	public int getJulSalesSum() {
		return julSalesSum;
	}
	public void setJulSalesSum(int julSalesSum) {
		this.julSalesSum = julSalesSum;
	}
	public int getAugSalesSum() {
		return augSalesSum;
	}
	public void setAugSalesSum(int augSalesSum) {
		this.augSalesSum = augSalesSum;
	}
	public int getSepSalesSum() {
		return sepSalesSum;
	}
	public void setSepSalesSum(int sepSalesSum) {
		this.sepSalesSum = sepSalesSum;
	}
	public int getOctSalesSum() {
		return octSalesSum;
	}
	public void setOctSalesSum(int octSalesSum) {
		this.octSalesSum = octSalesSum;
	}
	public int getNovSalesSum() {
		return novSalesSum;
	}
	public void setNovSalesSum(int novSalesSum) {
		this.novSalesSum = novSalesSum;
	}
	public int getDecSalesSum() {
		return decSalesSum;
	}
	public void setDecSalesSum(int decSalesSum) {
		this.decSalesSum = decSalesSum;
	}
	
	
	
	
	
	
	
}
