/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 안드로이드 처리를 담당할 service
 * 나중에 안드로이드 다시 연동할 예정
 * 
*/
package com.spring.Creamy_CRM.android_service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.Creamy_CRM.Host_dao.LoginDAOImpl;
import com.spring.Creamy_CRM.VO.EmployeeVO;
import com.spring.Creamy_CRM.VO.HostVO;
import com.spring.Creamy_CRM.VO.userVO;
import com.spring.Creamy_CRM.android_DAO.Android_LoginDAOImpl;

@Service
public class Android_serviceImpl implements Android_service{

	@Autowired
	Android_LoginDAOImpl dao_Android_login;
	
	@Autowired
	BCryptPasswordEncoder bcryptPassword;
	

	@Override
	public Map<String, String> login(HttpServletRequest req) {
		System.out.println("url -> 안드로이드 로그인");
		
		// 안드로이드에서 전달한 값
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		//비밀번호 확인
		String pw = dao_Android_login.getPw(id);
		
		boolean pwcheck = bcryptPassword.matches(pwd, pw);
		System.out.println("로그인 확인? "+pwcheck);

		// 웹에서 안드로이드로 전달할 값 
		//map key에 안드로이드의 vo 변수명과 일치하면 넘어가는듯
		Map<String, String> out = new HashMap<String, String>();
		if(pwcheck) {
			String auth = dao_Android_login.getAuth(id);
			out.put("ID", id);
			out.put("authority", auth);
		} else {
			out.put("ID", null);
		}
		
		return out;
	}


	//마이페이지 - 사장&직원
	@Override
	public Map<String, Object> getInfomation(HttpServletRequest req) {

		//안드로이드에서 전달한 값
		String id = req.getParameter("id");
		System.out.println("id : " + id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		//회원정보 조회 ->사장 &직원의 경우 테이블 다르기 때문에 auth 한번더 확인해주기
		String auth = dao_Android_login.getAuth(id);
		if(auth.equals("ROLE_HOST")) {
			//사장인경우
			HostVO vo = dao_Android_login.getHostInfo(id);
			map.put("name", vo.getHost_name());
			map.put("Auth", "ROLE_HOST");
			map.put("Host", vo);
			map.put("Employee", null);
			
		}else {
			//직원인 경우
			EmployeeVO vo = dao_Android_login.getEmployeeVO(id);
			map.put("name", vo.getEmployee_name());
			map.put("Auth", "ROLE_EMP");
			map.put("Host", null);
			map.put("Employee", vo);
		
		}
		
		map.put("data3", "0");
		map.put("data4", "0");
		map.put("member", null);
		
		
		
		return map;
	}


	//마이페이지 - 고객
	@Override
	public Map<String, Object> getUserInfomation(HttpServletRequest req) {
		//안드로이드에서 전달한 값
		String id = req.getParameter("id");
		System.out.println("id : " + id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		//회원정보 조회 ->사장 &직원의 경우 테이블 다르기 때문에 auth 한번더 확인해주기
		userVO vo = dao_Android_login.getUserInfo(id);
		
		map.put("name",vo.getUser_name());
		map.put("Auth", "ROLE_USER");
		map.put("Host", null);
		map.put("Employee", null);
			
		
		map.put("data3", "0");
		map.put("data4", "0");
		map.put("member", vo);
		
		
		
		return map;
	}
	
	

}
