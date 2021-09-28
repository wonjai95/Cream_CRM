package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class ProductVO {

	private String product_code;			//제품 코드
	private String product_name;			//제품명
	private String product_typeOfSales;		//판매 형태
	private int product_price;				//판매가
	private int product_rentalPeriod;		//기간 구입
	private String product_img;				//제품 이미지
	private Date product_indate;			//제품 등록일
	private String product_status;			//제품 품절 여부
	private String product_content;			//제품 설명  
	private String product_group_code;		//제품 그룹코드
	
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
	public String getProduct_group_code() {
		return product_group_code;
	}
	public void setProduct_group_code(String product_group_code) {
		this.product_group_code = product_group_code;
	}
	
}
