package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class KakaoPayReadyVO {
	
	//response
    private String tid, next_redirect_pc_url;
    private Date created_at;
	public String getNext_redirect_pc_url() {
		
		return next_redirect_pc_url;
	}
	public String getTid() {
		
		return tid;
	}
	
}
