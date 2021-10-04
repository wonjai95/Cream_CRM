/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 로그인 관련 service
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.LoginDAOImpl;
import com.spring.Creamy_CRM.VO.HostVO;
import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.ZipcodeVO;
import com.spring.Creamy_CRM.VO.userVO;
import com.spring.Creamy_CRM.VO.weatherVO;
import com.spring.Creamy_CRM.util.EmailChkHandler;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDAOImpl dao_login;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//회원가입
	@Override
	public void signInAction(HttpServletRequest req, Model model) {
		String id = req.getParameter("sign_id");
		String pw = req.getParameter("sign_PWD");
		String name = req.getParameter("sign_name");
		
		int year = Integer.parseInt(req.getParameter("sign_birth1"));
		
		int age = 2021 - year;
		
		String strDate = req.getParameter("sign_birth1")+"-"+req.getParameter("sign_birth2")+"-"+req.getParameter("sign_birth3");
	    java.sql.Date date = java.sql.Date.valueOf(strDate);
	    System.out.println("생일 : "+date);
	    
	    String email = req.getParameter("sign_Email1")+"@"+req.getParameter("sign_Email2");
	    String phone = req.getParameter("sign_Phone1")+"-"+req.getParameter("sign_Phone2")+"-"+req.getParameter("sign_Phone3");
	    String zipcode = req.getParameter("sign_zipcode");
	    String sido = req.getParameter("sign_sido");
	    String gugun = req.getParameter("sign_gugun");
	    String address= req.getParameter("sign_address");
	    String gender = req.getParameter("sign_gender");
	    
		//비밀번호 암호화
		String BcryptPw = passwordEncoder.encode(pw);
		String Auth = "ROLE_USER";
				
		//이메일 인증 테이블 insert
		Map<String, String> map = new HashMap<String, String>();
		map.put("id",id);
		map.put("pw", BcryptPw);
		map.put("Auth", Auth);
		
		int cnt = dao_login.insertAuth(map);
		System.out.println("이메일 인증 테이블 insert : "+cnt);
		
		//우편번호 insert
		Map<String, String> map_zipcode = new HashMap<String, String>();
		map_zipcode.put("zipcode", zipcode);
		map_zipcode.put("sido", sido);
		map_zipcode.put("gugun", gugun);
		
		//이미 존재하는 우편번호인지 조회
		int dupcnt = dao_login.getZipcodeCount(map_zipcode);
		System.out.println("우편번호 cnt : "+dupcnt);
		
		//우편번호가 존재하지 않으면 insert
		if(dupcnt == 0) {
			int insertCnt = dao_login.insertZipcode(map_zipcode);
		}
		
		//회원 테이블 insert
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
		
		if(userinsertCnt > 0) {
			String key = EmailChkHandler.getKey();
			
			dao_login.sendMail(email, key);
		}
		
		
	}

	//회원 이름 받아오는 용도
	@Override
	public void getUserCode(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		String name = dao_login.getUserInfo(id).getUser_name();
		System.out.println("user_name : "+name);
		
		req.getSession().setAttribute("name", name);
		
	}

	//사장님 코드 받아오는 용도
	@Override
	public void getHostCode(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		String code = dao_login.getHostInfo(id).getHost_code();
		String name = dao_login.getHostInfo(id).getHost_name();
		System.out.println("user_code : "+code);
		
		req.getSession().setAttribute("code", code);
		req.getSession().setAttribute("name", name);
		
		
		
	}
	
	//회원정보 수정 페이지
	@Override
	public void modifyUserpage(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		userVO vo = dao_login.getUserInfo(id);
		ZipcodeVO zip_vo = dao_login.selectzipcode(vo.getZipcode());
		
		String[] hp = vo.getUser_ph().split("-");

		System.out.println("성별 : "+vo.getUser_gender());
		
		req.setAttribute("vo", vo);
		req.setAttribute("zipcode_vo", zip_vo);
		req.setAttribute("hp", hp);
	}

	//회원정보 수정 페이지 -> 기존 비밀번호 체크
	@Override
	public void InfopwCheck(HttpServletRequest req, Model model) {
		String pw = req.getParameter("pw");
		String newpw = req.getParameter("inputpw");
		System.out.println("새 비밀번호 : "+ newpw);
		
		boolean check = passwordEncoder.matches(newpw, pw); 
		System.out.println(check);
		
		if(check)
			model.addAttribute("check",1);
		else
			model.addAttribute("check",0);
		
	}

	//회원정보 수정
	@Override
	public void InfoModifyAction(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		String pw = req.getParameter("modify_repw");
		String name = req.getParameter("modify_name");
		
		System.out.println("변경된 비밀번호 : "+pw);
		
		String strDate = req.getParameter("modify_birth");
	    java.sql.Date date = java.sql.Date.valueOf(strDate);
	    System.out.println("생일 : "+date);
	    
	    String[] years = strDate.split("-");
	    int year = Integer.parseInt(years[0]);
	    int age = 2021 - year;
	    
	    String email = req.getParameter("email1")+"@"+req.getParameter("email2");
	    String phone = req.getParameter("modifyp_hp1")+"-"+req.getParameter("modifyp_hp2")+"-"+req.getParameter("modifyp_hp3");
	    String zipcode = req.getParameter("modify_zipcode");
	    String sido = req.getParameter("modify_sido");
	    String gugun = req.getParameter("modify_gugun");
	    String address= req.getParameter("modify_address");
	    String memo = req.getParameter("modify_memo");
	    
	    if(memo == null)
	    	memo = " ";
	    
	    String gender = req.getParameter("gender_radio");
	    System.out.println("성별 : "+gender);
	    
		//비밀번호 암호화
		String BcryptPw = passwordEncoder.encode(pw);
		
		//이메일 인증 테이블 update
		Map<String, String> map = new HashMap<String, String>();
		map.put("id",id);
		map.put("pw", BcryptPw);
		
		int cnt = dao_login.modifyPw(map);
		System.out.println("이메일 인증 테이블 update : "+cnt);
		
		//우편번호 insert
		Map<String, String> map_zipcode = new HashMap<String, String>();
		map_zipcode.put("zipcode", zipcode);
		map_zipcode.put("sido", sido);
		map_zipcode.put("gugun", gugun);
		
		//이미 존재하는 우편번호인지 조회
		int dupcnt = dao_login.getZipcodeCount(map_zipcode);
		System.out.println("우편번호 cnt : "+dupcnt);
		
		//우편번호가 존재하지 않으면 insert
		if(dupcnt == 0) {
			int insertCnt = dao_login.insertZipcode(map_zipcode);
		}
		
		//회원 테이블 update
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
		vo.setUser_memo(memo);
		
		int updateCnt = dao_login.updateUserInfo(vo);
		System.out.println("회원정보 수정 : "+updateCnt);
		
		req.setAttribute("updateCnt", updateCnt);
		
		
	}

	//사장님 회원가입
	@Override
	public void HostsignInAction(HttpServletRequest req, Model model) {
		String id = req.getParameter("sign_id");
		String pw = req.getParameter("sign_PWD");
		String name = req.getParameter("sign_name");
		
		String email = req.getParameter("sign_Email1")+"@"+req.getParameter("sign_Email2");
	    String phone = req.getParameter("sign_Phone1")+"-"+req.getParameter("sign_Phone2")+"-"+req.getParameter("sign_Phone3");
		String compname = req.getParameter("sign_compname");
		
		//비밀번호 암호화
		String BcryptPw = passwordEncoder.encode(pw);
		String Auth = "ROLE_HOST";
		
		//이메일 인증 테이블 insert
		Map<String, String> map = new HashMap<String, String>();
		map.put("id",id);
		map.put("pw", BcryptPw);
		map.put("Auth", Auth);
		
		int cnt = dao_login.insertAuth(map);
		System.out.println("이메일 인증 테이블 insert : "+cnt);
		
		//사장님 테이블 insert
		HostVO vo = new HostVO();
		vo.setHost_id(id);
		vo.setHost_pw(BcryptPw);
		vo.setHost_name(name);
		vo.setHost_email(email);
		vo.setHost_ph(phone);
		vo.setComp_name(compname);
		
		int insertCnt = dao_login.insertHost(vo);
		System.out.println("사장님 회원가입 성공 ? : "+insertCnt);
		
		req.setAttribute("insertCnt", insertCnt);
		
	}

	//아이디 중복 체크
	@Override
	public void IDDupcheck(HttpServletRequest req, Model model) {
		String id = req.getParameter("user_ID");
		System.out.println("id : "+id);
		
		int selectcnt = dao_login.DupIdcheck(id);
		System.out.println("중복확인 : "+selectcnt);
		
		model.addAttribute("selectcnt",selectcnt);
		model.addAttribute("id",id);
	}

	//host_homepage
	@Override
	public void HostmainPage(HttpServletRequest req, Model model) {
		String code = (String) req.getSession().getAttribute("code");
		
		//예약된 일정 받아오기
		List<ReservationVO> res_list = dao_login.getResListbyStore(code);
		req.setAttribute("res_list", res_list);
		
		//오늘 예약인 일정 리스트
		List<ReservationVO> res_todaylist = dao_login.getTodayResListByStore(code);
		req.setAttribute("res_today", res_todaylist);
		
		//오늘 등록한 회원 리스트
		List<userVO> res_user = dao_login.getTodayUserList();
		req.setAttribute("res_user", res_user);
		
		//날씨 크롤링
		
		String iconurl = ""; //날씨 이미지 url
		String temp = ""; //기온
		String weather = ""; //날씨
		
		int day = 0;
		//일주일간의 날씨 데이터 크롤링
		
		String URLAddress = "https://www.accuweather.com/ko/kr/geumcheon-gu/2330436/daily-weather-forecast/2330436";
		
		List<weatherVO> list = new ArrayList<weatherVO>();
		
		List<String> list_image = new ArrayList<String>();
		List<String> list_texts = new ArrayList<String>();
		
		try {
			Document doc = Jsoup.connect(URLAddress).get();
			Elements contents = doc.select(".daily-wrapper");
			Elements icons = contents.select(".weather-icon");
			list_image = icons.eachAttr("data-src");
			list_texts = contents.select(".temp").eachText();
			
			System.out.println("---------jsoup---------");
			System.out.println("list--------------");
			for(String s :list_image)
				System.out.println(s);
			System.out.println("list_text--------------");
			for(String s :list_texts)
				System.out.println(s);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		for(int i = 0; i < 7; i++) {
			weatherVO vo = new weatherVO();
			vo.setIcon(list_image.get(i));
			vo.setWeather(list_texts.get(i));
			list.add(vo);
		}
		
		req.setAttribute("weather", list);
		

		
	}

	
	
	
	
	
	
	
}//serviceimpl end




















