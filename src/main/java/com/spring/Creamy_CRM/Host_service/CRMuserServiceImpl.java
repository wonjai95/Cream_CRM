/*
 * 작성자 : 장현정
 * 작성일 : 2021-09-22 ~ 2021-09-23
 * 회원 관련 service interface
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.CRMuserDAOImpl;
import com.spring.Creamy_CRM.Host_dao.LoginDAOImpl;
import com.spring.Creamy_CRM.VO.userVO;

@Service
public class CRMuserServiceImpl implements CRMuserService {

	@Autowired
	CRMuserDAOImpl dao_user;

	@Autowired
	LoginDAOImpl dao_login;
	
	
	// 선택된 회원 정보 출력
	@Override
	public void getUserInfo(HttpServletRequest req, Model model) {
		System.out.println("service ==> getUserInfo");
		
		// 선택한 user_code 넘겨서 값 출력
		String user_code = req.getParameter("user_code");
		System.out.println("user_code : " + user_code);
		
		userVO vo = dao_user.getUserInfo(user_code);
		
		System.out.println("dto : " + vo);
		System.out.println("user_code : " + vo.getUser_code());
		model.addAttribute("user_code", vo.getUser_code());
		req.setAttribute("dto", vo); // 회원 정보 넘겨주기
	}
	
	// 회원 정보 리스트 출력
	@Override
	public void printUsers(HttpServletRequest req, Model model) {
		System.out.println("service ==> printUsers");
		List<userVO> list = new ArrayList<userVO>();
		
		String user_code = req.getParameter("user_code");
		System.out.println("user_code : " + user_code);
		
		list = dao_user.printUsers();
		
		System.out.println("dto : " + list);
		model.addAttribute("dto", list); // 상품 정보 넘겨주기
	}
	

	// 회원 정보 수정
	@Override
	public void modifyUser(HttpServletRequest req, Model model) {
		System.out.println("service => modifyUser");
		
		String user_code = req.getParameter("modify_code");
		String user_name = req.getParameter("modify_name");
		String user_memo = req.getParameter("modify_memo");
		String user_gender = req.getParameter("modify_gender");
		String userBirth = req.getParameter("modify_birth");
		System.out.println("userBirth : " + userBirth);
		Date user_birth = Date.valueOf(userBirth);
		
		String user_email = req.getParameter("email1") + "@" + req.getParameter("email2");
		String user_phone = req.getParameter("modifyp_hp1") + "-" + req.getParameter("modifyp_hp2") + "-" + req.getParameter("modifyp_hp3");
		
		
		String zipcode = req.getParameter("modify_zipcode");
	    String sido = req.getParameter("modify_sido");
	    String gugun = req.getParameter("modify_gugun");
	    String address= req.getParameter("modify_address");
	    
		//우편번호 insert
		Map<String, String> map_zipcode = new HashMap<String, String>();
		map_zipcode.put("zipcode", zipcode);
		map_zipcode.put("sido", sido);
		map_zipcode.put("gugun", gugun);
		
		//이미 존재하는 우편번호인지 조회
		int dupcnt = dao_login.getZipcodeCount(map_zipcode);
		System.out.println("우편번호 cnt : " + dupcnt);
		
		int insertCnt = 0;
		//우편번호가 존재하지 않으면 insert
		if(dupcnt == 0) {
			insertCnt = dao_login.insertZipcode(map_zipcode);
		}
		System.out.println("insertCnt : " + insertCnt);
		
		
		//회원 테이블 update   
		userVO vo = new userVO();
		vo.setUser_code(user_code);
		vo.setUser_name(user_name);
		vo.setUser_memo(user_memo);
		vo.setUser_gender(user_gender);
		vo.setUser_birth(user_birth);
		vo.setUser_email(user_email);
		vo.setZipcode(zipcode);
		vo.setUser_address(address);
		vo.setUser_ph(user_phone);
		
		
		int updateCnt = dao_user.updateUser(vo);
		System.out.println("updateCnt : " + updateCnt);
		
		
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("dto", vo); // 회원 상세 정보
		
	}

	// 회원별 판매 내역 출력
	@Override
	public void userSale(HttpServletRequest req, Model model) {
		System.out.println("service => userSale");
		
		// 선택한 user_name 넘겨서 값 출력
		String user_code = req.getParameter("user_code");
		System.out.println("user_name : " + user_code);
		
		List<userVO> list = new ArrayList<userVO>();
		
		list = dao_user.userSale(user_code);
		
		model.addAttribute("dto", list);
		
	}   

	// 회원 정보 삭제(user_tbl)
	@Override
	public void deleteUser(HttpServletRequest req, Model model) {
		System.out.println("service => deleteUser(user_tbl)");
		
		String user_code = req.getParameter("user_code");
		System.out.println("user_code : " + user_code);
		
		int deleteCnt = dao_user.deleteUser(user_code);
		model.addAttribute("deleteCnt", deleteCnt);
	}

	// 회원 삭제(Auth_tbl)
	@Override
	public void deleteUserAuth(HttpServletRequest req, Model model) {
		System.out.println("service => deleteUserAuth(Auth_tbl)");
		
		String user_code = req.getParameter("user_code");
		System.out.println("user_code : " + user_code);
		
		int deleteCnt = dao_user.deleteUserAuth(user_code);
		model.addAttribute("deleteCnt", deleteCnt);
		
	}


}
