package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class outReviewVO {
	private String outreview_code;		//코드
	private String outreview_title;		//제목
	private String outreview_keyword;	//키워드
	private String outreview_url;		//url
	private String outreview_chk;		//추적여부
	private Date  outreview_date;		//등록일
	private Date outreview_update;		//update일
	
	//detail
	private int outdetail_rank;			//검색순위
	private Date outdetail_date;		//날짜
	public String getOutreview_code() {
		return outreview_code;
	}
	public void setOutreview_code(String outreview_code) {
		this.outreview_code = outreview_code;
	}
	public String getOutreview_title() {
		return outreview_title;
	}
	public void setOutreview_title(String outreview_title) {
		this.outreview_title = outreview_title;
	}
	public String getOutreview_keyword() {
		return outreview_keyword;
	}
	public void setOutreview_keyword(String outreview_keyword) {
		this.outreview_keyword = outreview_keyword;
	}
	public String getOutreview_url() {
		return outreview_url;
	}
	public void setOutreview_url(String outreview_url) {
		this.outreview_url = outreview_url;
	}
	public String getOutreview_chk() {
		return outreview_chk;
	}
	public void setOutreview_chk(String outreview_chk) {
		this.outreview_chk = outreview_chk;
	}
	public Date getOutreview_date() {
		return outreview_date;
	}
	public void setOutreview_date(Date outreview_date) {
		this.outreview_date = outreview_date;
	}
	public Date getOutreview_update() {
		return outreview_update;
	}
	public void setOutreview_update(Date outreview_update) {
		this.outreview_update = outreview_update;
	}
	public int getOutdetail_rank() {
		return outdetail_rank;
	}
	public void setOutdetail_rank(int outdetail_rank) {
		this.outdetail_rank = outdetail_rank;
	}
	public Date getOutdetail_date() {
		return outdetail_date;
	}
	public void setOutdetail_date(Date outdetail_date) {
		this.outdetail_date = outdetail_date;
	}
	
	
	
	
	
	
	

}