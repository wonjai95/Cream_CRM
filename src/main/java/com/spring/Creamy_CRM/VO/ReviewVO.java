package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class ReviewVO {
	private String review_code;		//리뷰 코드
	private String user_code;		//작성자 코드
	private String title;			//제목
	private String content;			//내용
	private int readCnt;			//조회수
	private Date regDate;			//등록일
	private int star;				//별점
	private String review_img;		//이미지 경로
	private String res_code;		//예약 코드
	
	private String user_name;		//작성자 이름
	private String user_id;			//작성자 id
	
	
	
	public String getReview_code() {
		return review_code;
	}
	public void setReview_code(String review_code) {
		this.review_code = review_code;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public String getRes_code() {
		return res_code;
	}
	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	

}
