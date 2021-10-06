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
import com.spring.Creamy_CRM.VO.IncomeStatementVO;
import com.spring.Creamy_CRM.VO.userVO;
import com.spring.Creamy_CRM.android_DAO.Android_LoginDAOImpl;

@Service
public class Android_serviceImpl implements Android_service{

	@Autowired
	Android_LoginDAOImpl dao_Android_login;
	
	@Autowired
	LoginDAOImpl dao_login;
	
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


	//회원가입
	@Override
	public Map<String, Object> Join(HttpServletRequest req) {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String birth = req.getParameter("birth");
		String address = req.getParameter("address");
		
		//생일(나이)
		java.sql.Date date = java.sql.Date.valueOf(birth);
		String[] years = birth.split("-");
	    int year = Integer.parseInt(years[0]);
	    int age = 2021 - year;
		
		//비밀번호 암호화
		String BcryptPw = bcryptPassword.encode(pwd);
		
		//이메일 인증 테이블 update
		Map<String, String> map = new HashMap<String, String>();
		map.put("id",id);
		map.put("pw", BcryptPw);
		map.put("Auth", "ROLE_USER");
		
		int cnt = dao_login.insertAuth(map);
		System.out.println("이메일 인증 테이블 update : "+cnt);
		
		System.out.println(birth);
		System.out.println(address);
		
		//주소 자르기
		String[] addressArr = address.split(", ");
		System.out.println(addressArr[0]);
		System.out.println(addressArr[1]);
		String zipcode = addressArr[0];
		address = addressArr[1];
		
		//우편번호 insert
		Map<String, String> map_zipcode = new HashMap<String, String>();
		map_zipcode.put("zipcode", zipcode);
		map_zipcode.put("sido", "-");
		map_zipcode.put("gugun", "-");
		
		//이미 존재하는 우편번호인지 조회
		int dupcnt = dao_login.getZipcodeCount(map_zipcode);
		System.out.println("우편번호 cnt : "+dupcnt);
		
		//우편번호가 존재하지 않으면 insert
		if(dupcnt == 0) {
			int insertCnt = dao_login.insertZipcode(map_zipcode);
		}
		
		//성별 일단 걍 박아버림
		String gender = "F";
		
		userVO vo = new userVO();
		vo.setUser_id(id);
		vo.setUser_password(BcryptPw);
		vo.setUser_name(name);
		vo.setUser_age(age);
		vo.setUser_birth(date);
		vo.setUser_email(email);
		vo.setUser_ph(phone);
		vo.setZipcode(zipcode);
		vo.setUser_address(address);
		vo.setUser_gender(gender);
		
		int userinsertCnt = dao_login.insertUserinfo(vo);
		System.out.println("회원가입 성공? : "+userinsertCnt);
		String chk = userinsertCnt == 1?"1":"0";
		System.out.println(chk);
		
		
		Map<String, Object> re_map = new HashMap<String, Object>();
		
		map.put("name",null);
		map.put("Auth", null);
		map.put("Host", null);
		map.put("Employee", null);
		map.put("data3", chk);
		map.put("data4", "0");
		map.put("member", null);
		
		return re_map;
	}
	
	// 결산 - 손익계산서 조회
	public Map<String, Object> getSettlement(HttpServletRequest req){
		String host_id = req.getParameter("host_id");
		System.out.println("host_id : " + host_id);
		
		// host_code 가져오기
		String host_code = dao_Android_login.getCode(host_id);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("host_code", host_code);
		System.out.println("host_code : " + host_code);
		
		// 손익계산서 조회
		Map<String, Object> map = new HashMap<String, Object>();
		IncomeStatementVO vo = dao_Android_login.getSettlement(map1);
		
		map.put("revenue", vo.getRevenue());
		map.put("cost_of_goods_sold", vo.getCost_of_goods_sold());
		map.put("gross_profit", vo.getGross_profit());
		map.put("operating_expensews", vo.getOperating_expensews());
		System.out.println(vo.getOperating_expensews());
		
		map.put("operating_income", vo.getOperating_income());
		map.put("non_operating_profit_loss", vo.getNon_operating_profit_loss());
		map.put("income_before_taxes", vo.getIncome_before_taxes());
		map.put("income_taxes", vo.getIncome_taxes());
		map.put("net_income", vo.getNet_income());
		
		return map;
	}
	
	

}
