package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class StockVO {

	private String stock_code;
	private String stock_name;
	private int stock_price;
	private String stock_brand;
	private int stock_cnt;
	private Date stock_indate;
	private String stock_status;
	private String trade_code;
	
	// 제고상세 테이블
	private String stock_detail_code;	
	private int stock_pur_cnt;
	private int stock_pur_price;
	private int stock_pur_cal;
	
	// 재고실사 테이블
	private String inven_code;
	private Date inven_date;
	private int indiv_inven_cnt;
	
	// 기말 재고액 테이블 (전기말 -> 다음기의 기초)
	private String ending_inven_code;
	private Date ending_inven_date;
	private int inven_price;
	private int inven_cnt;
	
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
	public int getStock_cnt() {
		return stock_cnt;
	}
	public void setStock_cnt(int stock_cnt) {
		this.stock_cnt = stock_cnt;
	}
	public String getStock_detail_code() {
		return stock_detail_code;
	}
	public void setStock_detail_code(String stock_detail_code) {
		this.stock_detail_code = stock_detail_code;
	}
	public int getStock_pur_cnt() {
		return stock_pur_cnt;
	}
	public void setStock_pur_cnt(int stock_pur_cnt) {
		this.stock_pur_cnt = stock_pur_cnt;
	}
	public int getStock_pur_price() {
		return stock_pur_price;
	}
	public void setStock_pur_price(int stock_pur_price) {
		this.stock_pur_price = stock_pur_price;
	}
	public int getStock_pur_cal() {
		return stock_pur_cal;
	}
	public void setStock_pur_cal(int stock_pur_cal) {
		this.stock_pur_cal = stock_pur_cal;
	}
	public String getInven_code() {
		return inven_code;
	}
	public void setInven_code(String inven_code) {
		this.inven_code = inven_code;
	}
	public Date getInven_date() {
		return inven_date;
	}
	public void setInven_date(Date inven_date) {
		this.inven_date = inven_date;
	}
	public int getIndiv_inven_cnt() {
		return indiv_inven_cnt;
	}
	public void setIndiv_inven_cnt(int indiv_inven_cnt) {
		this.indiv_inven_cnt = indiv_inven_cnt;
	}
	public String getEnding_inven_code() {
		return ending_inven_code;
	}
	public void setEnding_inven_code(String ending_inven_code) {
		this.ending_inven_code = ending_inven_code;
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
