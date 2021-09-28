package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class ProductGroupVO {
	private String product_group_code; //상품그룹코드
	private String product_group_name; //상품그룹명
    private Date pg_indate; //등록 날짜     
    private String host_code; //호스트 코드   
    
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
	
	public String getHost_code() {
		return host_code;
	}
	public void setHost_code(String host_code) {
		this.host_code = host_code;
	}
	
}
