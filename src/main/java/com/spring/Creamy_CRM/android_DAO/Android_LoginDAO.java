package com.spring.Creamy_CRM.android_DAO;

import java.util.Map;

import com.spring.Creamy_CRM.VO.EmployeeVO;
import com.spring.Creamy_CRM.VO.HostVO;
import com.spring.Creamy_CRM.VO.userVO;


public interface Android_LoginDAO {
	
	//로그인시 pw불러오기
	public String getPw(String id);
	
	//로그인 성공시 authentication확인
	public String getAuth(String id);
	
	//마이페이지 - 고객
	public userVO getUserInfo(String id);
	
	//마이페이지 - 사장
	public HostVO getHostInfo(String id);
	
	//마이페이지 - 직원
	public EmployeeVO getEmployeeVO(String id);
	
}
