/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 로그인 관련 service interface
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface LoginService {
	
	//회원가입
	public void signInAction(HttpServletRequest req, Model model);
	
	//사장님 회원가입
	public void HostsignInAction(HttpServletRequest req, Model model);
	
	//회원 수정페이지 -> 회원정보 받아오기
	public void modifyUserpage(HttpServletRequest req, Model model);
	
	//회원 수정페이지 -> 기존 비밀번호 맞게 입력했는지 체크
	public void InfopwCheck(HttpServletRequest req, Model model);
	
	//회원정보 수정
	public void InfoModifyAction(HttpServletRequest req, Model model);
	
	//로그인 시 세션에  회원 이름 받아오는 용
	void getUserCode(HttpServletRequest req, Model model);
	
	//로그인 시 세션에 사장님 코드 받아오는 용
	void getHostCode(HttpServletRequest req, Model model);
	
	//직원이 로그인시 세션에 코드 받아오는용
	void getEmpCode(HttpServletRequest req, Model model);
	
	//회원가입시 아이디 중복체크
	public void IDDupcheck(HttpServletRequest req, Model model);
	
	//홈화면 띄울때 가져올 정보들
	public void HostmainPage(HttpServletRequest req, Model model);
	
	//첫 로그인 시 db확인해서 외부 후기 업데이트
	public void updateOutReview(HttpServletRequest req, Model model);
	

}
