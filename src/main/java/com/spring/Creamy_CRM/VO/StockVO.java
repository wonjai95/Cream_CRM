package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class StockVO {

	private String stock_code;
	private String stock_name;
	private int stock_price;
	private String stock_brand;
	private int stock_count;
	private Date stock_indate;
	private String stock_status;
	private String trade_code;
	
	public String getStock_code() {
		return stock_code;
	}
	public void setStock_code(String stock_code) {
		this.stock_code = stock_code;
	}
	public String getStock_name() {
		return stock_name;
	}
	public void setStock_name(String stock_name) {
		this.stock_name = stock_name;
	}
	public int getStock_price() {
		return stock_price;
	}
	public void setStock_price(int stock_price) {
		this.stock_price = stock_price;
	}
	public String getStock_brand() {
		return stock_brand;
	}
	public void setStock_brand(String stock_brand) {
		this.stock_brand = stock_brand;
	}
	public int getStock_count() {
		return stock_count;
	}
	public void setStock_count(int stock_count) {
		this.stock_count = stock_count;
	}
	public Date getStock_indate() {
		return stock_indate;
	}
	public void setStock_indate(Date stock_indate) {
		this.stock_indate = stock_indate;
	}
	public String getStock_status() {
		return stock_status;
	}
	public void setStock_status(String stock_status) {
		this.stock_status = stock_status;
	}
	public String getTrade_code() {
		return trade_code;
	}
	public void setTrade_code(String trade_code) {
		this.trade_code = trade_code;
	}
	
}
