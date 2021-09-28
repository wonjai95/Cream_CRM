package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class SalaryVO {

	private String salary_code;					// 급여 코드
	private String employee_code;				// 직원 코드
	private Date salary_payDate;				// 급여지급일자
	private String pay_month;					// 급여 지급 월분(9월분)
	private int salary;							// 급여(월급)
	private int income_tax;						// 소득세
	private int national_pension;				// 국민연금
	private int employment_insurance;			// 고용보험
	private int health_insurance;				// 건강보험
	private int lt_care_insurance;				// 장기요양보험
	private int deduction_total;				// 공제 합계
	private int loan_payment_amount;			// 차인지급액
	
	public String getSalary_code() {
		return salary_code;
	}
	public void setSalary_code(String salary_code) {
		this.salary_code = salary_code;
	}
	public String getEmployee_code() {
		return employee_code;
	}
	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getIncome_tax() {
		return income_tax;
	}
	public void setIncome_tax(int income_tax) {
		this.income_tax = income_tax;
	}
	public int getLoan_payment_amount() {
		return loan_payment_amount;
	}
	public void setLoan_payment_amount(int loan_payment_amount) {
		this.loan_payment_amount = loan_payment_amount;
	}
	public int getNational_pension() {
		return national_pension;
	}
	public void setNational_pension(int national_pension) {
		this.national_pension = national_pension;
	}
	public int getHealth_insurance() {
		return health_insurance;
	}
	public void setHealth_insurance(int health_insurance) {
		this.health_insurance = health_insurance;
	}
	public int getEmployment_insurance() {
		return employment_insurance;
	}
	public void setEmployment_insurance(int employment_insurance) {
		this.employment_insurance = employment_insurance;
	}
	public int getLt_care_insurance() {
		return lt_care_insurance;
	}
	public void setLt_care_insurance(int lt_care_insurance) {
		this.lt_care_insurance = lt_care_insurance;
	}
	public Date getSalary_payDate() {
		return salary_payDate;
	}
	public void setSalary_payDate(Date salary_payDate) {
		this.salary_payDate = salary_payDate;
	}
	public String getPay_month() {
		return pay_month;
	}
	public void setPay_month(String pay_month) {
		this.pay_month = pay_month;
	}
	public int getDeduction_total() {
		return deduction_total;
	}
	public void setDeduction_total(int deduction_total) {
		this.deduction_total = deduction_total;
	}
	
	
}
