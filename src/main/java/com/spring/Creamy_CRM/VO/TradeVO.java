package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class TradeVO {
	private String trade_code; //거래처 코드
	private String trade_name; //거래처 명
	private Date trade_indate; //거래처 등록 날짜
	private String host_code; //사장코드
	
	
	public String getHost_code() {
		return host_code;
	}
	public void setHost_code(String host_code) {
		this.host_code = host_code;
	}
	public String getTrade_code() {
		return trade_code;
	}
	public void setTrade_code(String trade_code) {
		this.trade_code = trade_code;
	}
	public String getTrade_name() {
		return trade_name;
	}
	public void setTrade_name(String trade_name) {
		this.trade_name = trade_name;
	}
	public Date getTrade_indate() {
		return trade_indate;
	}
	public void setTrade_indate(Date trade_indate) {
		this.trade_indate = trade_indate;
	}
	
}
