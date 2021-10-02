package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class AccountVO {
	
	// 매입매출 전표 
	private String slip_code;					// 매입매출 전표 코드
	private String host_code;					// 사장님 코드
	private String slip_type;					// 유형(복리후생비, 수수료비용, 소모품비)
	private Date slip_regDate;					// 사용일
	private int slip_money;						// 금액
	private String slip_memo;					// 메모
	
	
	// 판매관리비 테이블
	private String sga_expenses_code;			// 판관비코드
	private Date sga_regDate;					// 영수증 날짜
	private int salary;							// 직원급여
	private int welfare;						// 복리후생비
	private int expendable;						// 소모품비
	private int commission;						// 수수료비용
	private int sga_expenses_total;				// 판관비 총액
	
	
	// 영업외 손익 테이블
	private String incidental_PNL_code;			// 영업외손익코드
	private Date non_operating_loss_regDate;	// 등록일
	private int non_operating_expenses;			// 비용
	private int non_operating_profit;			// 수익
	private int corporate_tax;					// 법인세등
	private int incidental_PNL_total;			// 영업외손익총액
	
	
	public String getSlip_code() {
		return slip_code;
	}
	public void setSlip_code(String slip_code) {
		this.slip_code = slip_code;
	}
	public String getHost_code() {
		return host_code;
	}
	public void setHost_code(String host_code) {
		this.host_code = host_code;
	}
	public String getSlip_type() {
		return slip_type;
	}
	public void setSlip_type(String slip_type) {
		this.slip_type = slip_type;
	}
	public Date getSlip_regDate() {
		return slip_regDate;
	}
	public void setSlip_regDate(Date slip_regDate) {
		this.slip_regDate = slip_regDate;
	}
	public int getSlip_money() {
		return slip_money;
	}
	public void setSlip_money(int slip_money) {
		this.slip_money = slip_money;
	}
	public String getSlip_memo() {
		return slip_memo;
	}
	public void setSlip_memo(String slip_memo) {
		this.slip_memo = slip_memo;
	}
	public String getSga_expenses_code() {
		return sga_expenses_code;
	}
	public void setSga_expenses_code(String sga_expenses_code) {
		this.sga_expenses_code = sga_expenses_code;
	}
	public Date getSga_regDate() {
		return sga_regDate;
	}
	public void setSga_regDate(Date sga_regDate) {
		this.sga_regDate = sga_regDate;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getWelfare() {
		return welfare;
	}
	public void setWelfare(int welfare) {
		this.welfare = welfare;
	}
	public int getExpendable() {
		return expendable;
	}
	public void setExpendable(int expendable) {
		this.expendable = expendable;
	}
	public int getCommission() {
		return commission;
	}
	public void setCommission(int commission) {
		this.commission = commission;
	}
	public int getSga_expenses_total() {
		return sga_expenses_total;
	}
	public void setSga_expenses_total(int sga_expenses_total) {
		this.sga_expenses_total = sga_expenses_total;
	}
	public String getIncidental_PNL_code() {
		return incidental_PNL_code;
	}
	public void setIncidental_PNL_code(String incidental_PNL_code) {
		this.incidental_PNL_code = incidental_PNL_code;
	}
	public Date getNon_operating_profit_regDate() {
		return non_operating_loss_regDate;
	}
	public void setNon_operating_profit_regDate(Date non_operating_profit_regDate) {
		this.non_operating_loss_regDate = non_operating_profit_regDate;
	}
	public int getNon_operating_expenses() {
		return non_operating_expenses;
	}
	public void setNon_operating_expenses(int non_operating_expenses) {
		this.non_operating_expenses = non_operating_expenses;
	}
	public int getNon_operating_profit() {
		return non_operating_profit;
	}
	public void setNon_operating_profit(int non_operating_profit) {
		this.non_operating_profit = non_operating_profit;
	}
	public int getCorporate_tax() {
		return corporate_tax;
	}
	public void setCorporate_tax(int corporate_tax) {
		this.corporate_tax = corporate_tax;
	}
	public int getIncidental_PNL_total() {
		return incidental_PNL_total;
	}
	public void setIncidental_PNL_total(int incidental_PNL_total) {
		this.incidental_PNL_total = incidental_PNL_total;
	}
	
	
	
	
	
}
