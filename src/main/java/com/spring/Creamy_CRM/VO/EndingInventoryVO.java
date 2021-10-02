package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class EndingInventoryVO {

	private String ending_inven_code;
	private String host_code;
	private Date ending_inven_date;
	private int inven_price;			// 전기(전월) 기말 재고액
	private int inven_cnt;				// 전기(전월) 기말 총 재고수량
	
	
	public String getEnding_inven_code() {
		return ending_inven_code;
	}
	
	public void setEnding_inven_code(String ending_inven_code) {
		this.ending_inven_code = ending_inven_code;
	}
	
	public String getHost_code() {
		return host_code;
	}
	
	public void setHost_code(String host_code) {
		this.host_code = host_code;
	}
	
	public Date getEnding_inven_date() {
		return ending_inven_date;
	}
	
	public void setEnding_inven_date(Date ending_inven_date) {
		this.ending_inven_date = ending_inven_date;
	}
	
	public int getInven_price() {
		return inven_price;
	}
	
	public void setInven_price(int inven_price) {
		this.inven_price = inven_price;
	}
	
	public int getInven_cnt() {
		return inven_cnt;
	}
	
	public void setInven_cnt(int inven_cnt) {
		this.inven_cnt = inven_cnt;
	}
	
	
}
