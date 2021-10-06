/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 안드로이드 처리를 담당할 service
 * 나중에 안드로이드 다시 연동할 예정
 * 
*/
package com.spring.Creamy_CRM.android_service;

import java.sql.Date;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.Creamy_CRM.Host_dao.EmployeeDAOImpl;
import com.spring.Creamy_CRM.Host_dao.LoginDAOImpl;
import com.spring.Creamy_CRM.VO.AttendanceVO;
import com.spring.Creamy_CRM.VO.EmployeeVO;
import com.spring.Creamy_CRM.VO.HostVO;
import com.spring.Creamy_CRM.VO.IncomeStatementVO;
import com.spring.Creamy_CRM.VO.WorkingHoursVO;
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
	
	@Autowired
	EmployeeDAOImpl dao_emp;
	

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


	// QR
	@Override
	public Map<String, Object> getQrCode(HttpServletRequest req) {
		System.out.println("getQRCode 진입");
		
		String employee_inout = req.getParameter("employee_inout");
		String temperature = req.getParameter("temperature");
		String covid_chk1 = req.getParameter("covid_chk1");
		String covid_chk2 = req.getParameter("covid_chk2");
		String covid_chk3 = req.getParameter("covid_chk3");
		String memo = req.getParameter("memo");
		String employee_id = req.getParameter("id");
		System.out.println("employee_id : " + employee_id);
		System.out.println("temperature : " + temperature);
		System.out.println("covid_chk1 : " + covid_chk1);
		System.out.println("memo : " + memo);
		
		// 해당 아이디의 employee_code 찾기
		String employee_code = dao_emp.getEmpCode(employee_id);
		System.out.println("employee_code : " + employee_code);
		
		// 날짜와 시간 
		Date attendance_date = new Date(System.currentTimeMillis());
		// 현재 시간만 출력
		String inout_time = LocalTime.now().format(DateTimeFormatter.ofPattern("HH:mm"));
		
		Calendar cal = Calendar.getInstance();
        cal.setTime(attendance_date);// nDate 기준으로 날짜 변경
        int dayNum = cal.get(Calendar.DAY_OF_WEEK); // Calendar로부터 요일상수 받음
		
		System.out.println("attendance_date : " + attendance_date);
		System.out.println("inout_time : " + inout_time);
		System.out.println("dayNum : " + dayNum);
		
		AttendanceVO vo = new AttendanceVO();
		vo.setEmployee_code(employee_code);
		vo.setAttendance_date(attendance_date);
		vo.setTemperature(temperature);
		vo.setExamination_chk1(covid_chk1);
		vo.setExamination_chk2(covid_chk2);
		vo.setExamination_chk3(covid_chk3);
		vo.setMemo(memo);
		
		int insertCnt = 0;
		int inChk = 0;
		int updateCnt = 0;
		// 출퇴근 결과 종합
		// 1 : 출근 등록 완료, 2 : 퇴근 등록 완료, 3 : 출근 등록전에 퇴근 찍음, 4 : 중복 출근 찍음, 0 : 실패
		int attendChk = 0;
		
		// 지각 여부 체크를 위해서 dao 갔다 옴
		// 해당 직원의 해당 요일의 근무시간(working_hours_tbl)에서 late_criteria와 비교해서, 늦으면 지각. 아니면 정상
		// switch case 이용해서 해당 요일의 in, out 시간과 late_criteria, early_criteria를 가져온다.
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employee_code", employee_code);

		WorkingHoursVO work_vo = dao_emp.getAttendanceDateInfo(map);
		
		
		// 출근일 경우 attendance_tbl에 바로 삽입
		if(employee_inout.equals("출근")) {
			vo.setCheck_in_time(inout_time);
			vo.setCheck_out_time("0");
			
			// 해당 요일의 출근 시간
			String schedIn = "";
			switch (dayNum) {
				case 1 : 
					schedIn = work_vo.getMon_in();
					break;
				case 2 : 
					schedIn = work_vo.getTue_in();
					break;
				case 3 : 
					schedIn = work_vo.getWed_in();
					break;
				case 4 : 
					schedIn = work_vo.getThu_in();
					break;
				case 5 :
					schedIn = work_vo.getFri_in();
					break;
				case 6 : 
					schedIn = work_vo.getSat_in();
					break;
				case 0 : 
					schedIn = work_vo.getSun_in();
					break;
			}
			
			// 출근 날짜가 아닐 때 출근할 경우
			if(schedIn.equals("") || schedIn == null || schedIn.equals("0")) {
				vo.setLateChk("0");
				
			// 정해진 날짜에 출근할 경우
			} else {
				// 지각 기준 시간
				int late = Integer.parseInt(work_vo.getLate_criteria());
				
				// 현재시간과 출근시간을 비교. 지각기준시간을 초과하면 late_early를 '지각'으로 set
				LocalTime scheTime = LocalTime.parse(schedIn);
				LocalTime curTime = LocalTime.parse(inout_time);
				
				// 정해진 출근시간 + 지각시간
				LocalTime lateChkTime = scheTime.plusMinutes(late);
				
				// 실제 출근시간이 정해진 출근시간 + 지각시간보다 늦으면 지각 처리
				if(curTime.isAfter(lateChkTime)) {
					vo.setLateChk("지각");
				} else {
					vo.setLateChk("0");
				}
			}
			
			inChk = dao_emp.chkIn(vo);
			
			// 이미 출근을 등록한 경우
			if(inChk == 1) {
				attendChk = 4;
			// 출근 정상 등록
			} else {
				insertCnt = dao_emp.insertAttendance(vo);
				System.out.println("insertCnt : " + insertCnt);
				if(insertCnt == 1) {
					attendChk = 1;
				}
			}
			
			
		// 퇴근일 경우 
		} else if(employee_inout.equals("퇴근")){
			
			// 해당 요일의 퇴근 시간
			String schedOut = "";
			switch (dayNum) {
				case 1 : 
					schedOut = work_vo.getMon_out();
					break;
				case 2 : 
					schedOut = work_vo.getTue_out();
					break;
				case 3 : 
					schedOut = work_vo.getWed_out();
					break;
				case 4 : 
					schedOut = work_vo.getThu_out();
					break;
				case 5 :
					schedOut = work_vo.getFri_out();
					break;
				case 6 : 
					schedOut = work_vo.getSat_out();
					break;
				case 0 : 
					schedOut = work_vo.getSun_out();
					break;
			}
			
			// 정해진 날짜가 아닐 때 퇴근 할 경우
			if(schedOut.equals("") || schedOut == null || schedOut.equals("0")) {
				vo.setLateChk("0");
			} else {
				// 조퇴 기준 시간
				int early = Integer.parseInt(work_vo.getLate_criteria());
				
				// 현재시간과 퇴근시간을 비교. 조퇴기준시간을 보다 빨리 퇴근시 late_early를 '조퇴'으로 set
				LocalTime scheTime = LocalTime.parse(schedOut);
				LocalTime curTime = LocalTime.parse(inout_time);
				
				// 정해진 퇴근시간 - 조퇴시간
				LocalTime lateChkTime = scheTime.minusMinutes(early);
				
				// 실제 출근시간이 정해진 퇴근시간 - 조퇴시간보다 빠르면 조퇴 처리
				if(curTime.isBefore(lateChkTime)) {
					vo.setLateChk("조퇴");
				} else {
					vo.setLateChk("0");
				}
			}
			
			// 출근을 찍었는지 먼저 체크
			inChk = dao_emp.chkIn(vo);
			
			// attendance_tbl을 update - check_out_time만 삽입
			if(inChk == 1) {
				vo.setCheck_out_time(inout_time);
				updateCnt = dao_emp.updateAttendanceOut(vo);
				System.out.println("updateCnt : " + updateCnt);
				
				if(updateCnt == 1) {
					// 퇴근 등록 정상 완료
					attendChk = 2;
				}
			} else {
				// 출근을 먼저 찍으라는 alert
				attendChk = 4;
			}
			
		}
		
		System.out.println("inChk : " + inChk);
		System.out.println("attendChk : " + attendChk);
		
		// 출퇴근 성공 여부
		// attendChk
		// 1 : 출근 등록 완료, 2 : 퇴근 등록 완료, 3 : 출근 등록전에 퇴근 찍음, 4 : 중복 출근 찍음, 0 : 실패
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("attendChk", attendChk);
		
		return returnMap;
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
