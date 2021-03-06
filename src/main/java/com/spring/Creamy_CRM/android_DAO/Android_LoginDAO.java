package com.spring.Creamy_CRM.android_DAO;

import java.util.List;
import java.util.Map;

import com.spring.Creamy_CRM.VO.EmployeeVO;
import com.spring.Creamy_CRM.VO.HostVO;
import com.spring.Creamy_CRM.VO.IncomeStatementVO;
import com.spring.Creamy_CRM.VO.ReservationVO;
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
	
	// host_id를 이용한 host_code 가져오기
	public String getCode(String host_id);
	
	// 손익계산서 조회
	public IncomeStatementVO getSettlement(Map<String, Object> map);
	

	// 비밀번호 변경
	public int updatePW(Map<String, Object> map);

	// host_code를 이용한 comp_res 가져오기
	public String getCompRes(String host_code);
	// 관리자페이지
	// 담당자 예약 조회
	public List<ReservationVO> getManagerResList(Map<String, Object> map);
	// 호실 예약 조회
	public List<ReservationVO> getRoomResList(Map<String, Object> map);

	
	
}
