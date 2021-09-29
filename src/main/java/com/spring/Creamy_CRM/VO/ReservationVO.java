/*
 * 작성자 : 이시현
 * 작성일 : 2021.09.20
 *
*/
package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class ReservationVO {
	
	private String res_code;				// 예약코드(시퀀스)
	private String res_state;				// 예약상태
	private Date res_date;					// 예약일
	private int res_hour;					// 예약시각
	private String employee_code;			// 예약담당자(= employee_code)
	private String user_id;					// 회원아이디
	private String res_detail_code;			// 예약상세코드(시퀀스)
	private int res_cnt;					// 인원수
	private String res_indiv_request;		// 별도 요청
	private String product_code;			// 예약할 상품서비스
	private String res_memo;				// 기타메모
	private String res_room;				// 예약호실
	private String res_review_chk;			// 후기 작성여부 체크
	private String res_start;				// 예약 시작 시간
	private String res_end;					// 예약 종료 시간
	private int res_sales;					// 총 금액
	
	//고객 예약내역에서 사용할 변수
	private String comp_name;			//회사명
	private String comp_res;			//예약종류(호실/담당자)
	private String product_name;		//서비스(제품)명
	private String comp_res;			// 호실, 담당자 
	
	// 호실 테이블
	private String room_setting_code;	// 호실 코드
	private String room_name;			// 호실 이름
	private String room_stat;			// 호실 상태('사용가능', '사용불가능')
	private int per_price;				// 1인당 가격
	private int min_cnt;				// 최소 인원수
	private int max_cnt;				// 최대 인원수
	
	
	private String host_code;			// 사장님 코드
	
	public String getRes_code() {
		return res_code;
	}
	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}
	
	public String getRes_state() {
		return res_state;
	}
	public void setRes_state(String res_state) {
		this.res_state = res_state;
	}
	
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	
	public int getRes_hour() {
		return res_hour;
	}
	public void setRes_hour(int res_hour) {
		this.res_hour = res_hour;
	}
	
	public String getEmployee_code() {
		return employee_code;
	}
	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getRes_detail_code() {
		return res_detail_code;
	}
	public void setRes_detail_code(String res_detail_code) {
		this.res_detail_code = res_detail_code;
	}
	
	public int getRes_cnt() {
		return res_cnt;
	}
	public void setRes_cnt(int res_cnt) {
		this.res_cnt = res_cnt;
	}
	
	public String getRes_indiv_request() {
		return res_indiv_request;
	}
	public void setRes_indiv_request(String res_indiv_request) {
		this.res_indiv_request = res_indiv_request;
	}
	
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	
	public String getRes_memo() {
		return res_memo;
	}
	public void setRes_memo(String res_memo) {
		this.res_memo = res_memo;
	}
	
	public String getRes_room() {
		return res_room;
	}
	public void setRes_room(String res_room) {
		this.res_room = res_room;
	}
	public String getComp_name() {
		return comp_name;
	}
	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}
	public String getComp_res() {
		return comp_res;
	}
	public void setComp_res(String comp_res) {
		this.comp_res = comp_res;
	}
	public String getRes_review_chk() {
		return res_review_chk;
	}
	public void setRes_review_chk(String res_review_chk) {
		this.res_review_chk = res_review_chk;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getComp_res() {
		return comp_res;
	}
	public void setComp_res(String comp_res) {
		this.comp_res = comp_res;
	}
	public String getRes_start() {
		return res_start;
	}
	public void setRes_start(String res_start) {
		this.res_start = res_start;
	}
	public String getRes_end() {
		return res_end;
	}
	public void setRes_end(String res_end) {
		this.res_end = res_end;
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
	public String getRoom_stat() {
		return room_stat;
	}
	public void setRoom_stat(String room_stat) {
		this.room_stat = room_stat;
	}
	public String getHost_code() {
		return host_code;
	}
	public void setHost_code(String host_code) {
		this.host_code = host_code;
	}
	public int getPer_price() {
		return per_price;
	}
	public void setPer_price(int per_price) {
		this.per_price = per_price;
	}
	public int getMin_cnt() {
		return min_cnt;
	}
	public void setMin_cnt(int min_cnt) {
		this.min_cnt = min_cnt;
	}
	public int getMax_cnt() {
		return max_cnt;
	}
	public void setMax_cnt(int max_cnt) {
		this.max_cnt = max_cnt;
	}
	public int getRes_sales() {
		return res_sales;
	}
	public void setRes_sales(int res_sales) {
		this.res_sales = res_sales;
	}
	
	
	
	
	
}


