/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 로그인 관련 dao interface
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

import com.spring.Creamy_CRM.VO.Android_AuthVO;
import com.spring.Creamy_CRM.VO.EmployeeVO;
import com.spring.Creamy_CRM.VO.HostVO;
import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.ZipcodeVO;
import com.spring.Creamy_CRM.VO.userVO;

public interface LoginDAO {
	
	//회원상세정보 
	public Map<String, Object> selectUser(String id);
	
	//이메일인증테이블 insert
	public int insertAuth(Map<String,String> map);
	
	//Auth_tbl select
	public Android_AuthVO getAuth(String id);
	
	//우편번호 유무 여부 
	public int getZipcodeCount(Map<String,String> map);
	
	//우편번호 조회
	public ZipcodeVO selectzipcode(String zipcode);
	
	//우편번호 insert
	public int insertZipcode(Map<String,String> map);
	
	//회원가입
	public int insertUserinfo(userVO vo);
	
	//로그인 체크
	public int confirmIdPwd(Map<String,String> map);
	
	//인증테이블 비밀번호 변경
	public int modifyPw(Map<String, String> map);

	//메일전송
	public void sendMail(String email, String key);
	
	//회원 정보 select
	public userVO getUserInfo(String id);
	
	//사장님 정보 select
	public HostVO getHostInfo(String id);
	
	//직원 정보 select
	public EmployeeVO getEmpInfo(String id);
	
	
	//회원 정보 update
	public int updateUserInfo(userVO vo);
	
	//회원정보 update - nowedding
	public int updateUserInfo_notWedding(userVO vo);
	
	//사장님 회원가입
	public int insertHost(HostVO vo);
	
	//아이디 중복 체크
	public int DupIdcheck(String id);
	
	
	//매장별 예약목록 받아오기
	public List<ReservationVO> getResListbyStore(String host_code);
	
	//오늘날짜의 예약목록 출력
	public List<ReservationVO> getTodayResListByStore(String host_code);
	
	//오늘 등록한 회원 이름 출력
	public List<userVO> getTodayUserList();
	
	
}




