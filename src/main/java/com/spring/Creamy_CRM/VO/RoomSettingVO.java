package com.spring.Creamy_CRM.VO;

public class RoomSettingVO {

	private String room_setting_code; //호실 코드
	private String room_name;	//호실 이름
	private String host_code; //사장코드
	private String room_stat; // 호실 상태('사용가능', '사용불가능')
	private int per_price; //1인당 가격
	private int min_cnt;	//최소 인원수
	private int max_cnt;	//최대 인원수
	
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
	public String getHost_code() {
		return host_code;
	}
	public void setHost_code(String host_code) {
		this.host_code = host_code;
	}
	public String getRoom_stat() {
		return room_stat;
	}
	public void setRoom_stat(String room_stat) {
		this.room_stat = room_stat;
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
	
}
