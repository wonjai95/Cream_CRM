/*
 * 작성자 : 주수림

 * 작성일 : 2021.09.23
 * 고객 예약 화면 및 그 처리 
 * 
*/
package com.spring.Creamy_CRM.User_service;

import java.text.SimpleDateFormat;

import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.User_dao.UserReservationDAOImpl;
import com.spring.Creamy_CRM.VO.HostVO;
import com.spring.Creamy_CRM.VO.ProductVO;
import com.spring.Creamy_CRM.VO.ReservationVO;

@Service
public class UserReservationServiceImpl implements UserReservationService {

	@Autowired
	UserReservationDAOImpl dao;
	
	// 고객 매장 선택 페이지
	@Override
	public void selectHost(HttpServletRequest req, Model model) {
		ArrayList<HostVO> list = (ArrayList<HostVO>) dao.selectHost();
		System.out.println("selectHost : " + list.get(0).getComp_name());
		model.addAttribute("dtos", list);
	}
	
	// 고객 매장 선택 페이지 - 검색
	@Override
	public void searchHostList(HttpServletRequest req, Model model) {
		String keyword = req.getParameter("keyword");
		System.out.println("keyword : " + keyword);
		List<HostVO> list = dao.searchHostList(keyword);
		model.addAttribute("dtos", list);
		
	}
	
	
	// 담당자 예약 - 해당 사장님의 상품 정보 가져오기
	@Override
	public void custManagerBooking(HttpServletRequest req, Model model) {
		String host_code = req.getParameter("host_code");
		System.out.println("host_code : " + host_code);
		
		// 담당자 예약 - 해당 사장님의 상품 정보 가져오기
		List<ProductVO> dtos = dao.getProductList(host_code);
		
		model.addAttribute("dtos", dtos);
		
	}

	// 고객 예약 가능 시간 표시
	@Override
	public void bookingTimeTable(HttpServletRequest req, Model model) {
		String host_code = req.getParameter("host_code");
		System.out.println("host_code : " + host_code);
		String day = req.getParameter("day");
		String curtime = req.getParameter("time");
		String selectDate = req.getParameter("selectDate");
		System.out.println("day : " + day);
		System.out.println("curtime : " + curtime);
		System.out.println("selectDate : " + selectDate);
		
		// 해당 사장님의 해당 요일 영업시간 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("host_code", host_code);
		map.put("operating_day", day); 				// 일 ~ 토 : 0~6
		
		HostVO vo = dao.getOperatingInfo(map);
		String open_sche = vo.getOpen_sche();
		String close_sche = vo.getClose_sche();
		System.out.println("open_sche : " + open_sche);
		System.out.println("close_sche : " + close_sche);
		
		// 현재 날짜
		Date today = new Date(System.currentTimeMillis());
		SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy-MM-dd");
		String fmtToday = dateFmt.format(today);
		
		LocalTime curTimeFmt = LocalTime.parse(curtime);
		LocalTime openTimeFmt = LocalTime.parse(open_sche);
		
		LocalTime start = null;
		
		if(fmtToday.equals(selectDate)) {
			System.out.println("날짜 동일");
			
			// 현재시간(curTimeFmt)이 영업시작시간(openTimeFmt)보다 늦다면
			if(curTimeFmt.isAfter(openTimeFmt)) {
				System.out.println("현재시간(curTimeFmt)이 영업시작시간(openTimeFmt)보다 늦음");
				start = LocalTime.parse(curtime);
			} else {
				System.out.println("현재시간(curTimeFmt)이 영업시작시간(openTimeFmt)보다 빠름");
				start = LocalTime.parse(open_sche);
			}
			
		} else {
			System.out.println("날짜 동일하지 않음");
			start = LocalTime.parse(open_sche);
		}
		System.out.println("start 시간 : " + start);
		
		// 영업 시작 시간과 종료 시간을 LocalTime 형태로 변환
		ArrayList<String> dtos = new ArrayList<String>();
		LocalTime end = LocalTime.parse(close_sche);
		String timeSche = start.toString();
		String endTime = end.toString();
		System.out.println("endTime : " + endTime);
		dtos.add(timeSche);
		int i = 1;
		
		do {
			// 1시간씩 증가시켜 주기(start.plus(1, ChronoUnit.HOURS)로 하면 start 시간에 1시간만 더해짐. 누적시키기 위해 i 사용 
			// ex. start가 09:00이면 timeSche는 계속 10:00 (sum += 1이 아니라 sum + 1임) 
			timeSche = start.plus(i, ChronoUnit.HOURS).toString();
			System.out.println("timeSche : " + timeSche);
			dtos.add(timeSche);
			i++;
			
		} while(!timeSche.equals(endTime));
		
		model.addAttribute("dtos", dtos);
		model.addAttribute("selectDate", selectDate);
		
	}

	// 회원 예약 가능한 담당자 표시
	@Override
	public void bookingManagerTable(HttpServletRequest req, Model model) {
		String selectDate = req.getParameter("selectDate");
		String selectDay = req.getParameter("selectDay");
		String selectTime = req.getParameter("selectTime");
		int chkTime = Integer.parseInt(selectTime.split(":")[0]);
		String host_code = req.getParameter("host_code");
		
		System.out.println("selectDay : " + selectDay);
		System.out.println("selectTime : " + selectTime);
		System.out.println("chkTime : " + chkTime);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selectDate", selectDate);
		map.put("selectDay", selectDay);
		map.put("host_code", host_code);
		map.put("selectTime", selectTime);
		// reservation_tbl에 res_hour가 number로 들어가있기 때문에 split한 값을 사용
		map.put("res_hour", chkTime);
		
		List<HostVO> dtos = dao.getAvailableManager(map);
		for(int i=0; i<dtos.size(); i++) {
			map.put("employee_code", dtos.get(i).getEmployee_code());
			System.out.println("직원 : " + dtos.get(i).getEmployee_code());
			
			// 해당 날짜와 시간에 예약이 잡혀있는 담당자 count
			int getCnt = dao.getReservedManager(map);
			System.out.println("getCnt : " + getCnt);
			
			if(getCnt != 0) {
				System.out.println(dtos.get(i).getEmployee_code() + " 삭제");
				// 해당 날짜와 시간에 예약이 잡혀있는 담당자를 map에서 삭제
				dtos.remove(i);
			}
		}
		
		model.addAttribute("dtos", dtos);
		
	}

	// 회원 예약 가능한 호실 표시
	@Override
	public void bookingRoomTable(HttpServletRequest req, Model model) {
		String host_code = req.getParameter("host_code");
		System.out.println("host_code : " + host_code);
		String selectDate = req.getParameter("selectDate");
		System.out.println("selectDate : " + selectDate);
		List<ReservationVO> dtos = dao.getAvailableRoom(host_code);
		System.out.println("dtos : " + dtos.size());
		model.addAttribute("dtos", dtos);
		model.addAttribute("selectDate", selectDate);
		
	}

	// 호실 클릭시 영업시간과 예약 현황 표시
	@Override
	public void bookingRoomTimeTable(HttpServletRequest req, Model model) {
		String selectDate = req.getParameter("selectDate");
		String selectDay = req.getParameter("selectDay");
		String selectRoom = req.getParameter("selectRoom");
		String host_code = req.getParameter("host_code");
		
		System.out.println("selectDate : " + selectDate);
		System.out.println("room_setting_code : " + selectRoom);
		System.out.println("selectDay : " + selectDay);
		
		// 해당 사장님의 해당 요일 영업시간 = 호실 사용 가능 시간
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("host_code", host_code);
		map.put("operating_day", selectDay); 	// 일 ~ 토 : 0~6
		
		HostVO vo = dao.getOperatingInfo(map);
		
		ReservationVO roomVO = dao.getRoomInfo(selectRoom);
		
		// 해당 날짜에 해당 호실 예약 현황
		map.put("res_date", selectDate);
		map.put("room_setting_code", selectRoom);
		List<ReservationVO> resVO = dao.getBookedRoomTime(map);
		
		model.addAttribute("open_sche", vo.getOpen_sche());
		model.addAttribute("close_sche", vo.getClose_sche());
		model.addAttribute("selectDate", selectDate);
		model.addAttribute("dtos", resVO);
		model.addAttribute("roomDto", roomVO);
	}

	// 호실 예약 처리
	@Override
	public void insertRoomBookingAction(HttpServletRequest req, Model model) {
		System.out.println("service ==> insertRoomBookingAction ");
		
		String host_code = req.getParameter("host_code");
		String res_start = req.getParameter("res_start");
		String res_end = req.getParameter("res_end");
		int res_sales = Integer.parseInt(req.getParameter("res_sales"));
		int guestCount = Integer.parseInt(req.getParameter("GuestCount"));
		String res_state = "예약완료";
		String room_setting_code = req.getParameter("selectRoom");
		String res_indiv_request = req.getParameter("res_indiv_request");
		String user_id = req.getParameter("user_id");
		String str_res_date = req.getParameter("selectDate");
		System.out.println("str_res_date : " + str_res_date);
		Date res_date = Date.valueOf(str_res_date);
		
		String open_sche = req.getParameter("open_sche");
		String close_sche = req.getParameter("close_sche");
		
		int openTime = Integer.parseInt(open_sche.split(":")[0]);
		int closeTime = Integer.parseInt(close_sche.split(":")[0]);
		
		ReservationVO vo = new ReservationVO();
		vo.setHost_code(host_code);
		vo.setRes_state(res_state);
		vo.setRes_cnt(guestCount);
		vo.setRoom_setting_code(room_setting_code);
		vo.setRes_indiv_request(res_indiv_request);
		vo.setUser_id(user_id);
		vo.setRes_date(res_date);
		vo.setRes_hour(Integer.parseInt(res_start));
		vo.setRes_sales(res_sales);
		
		// 예약 성공 여부
		int insertCnt = 0;
		
		// 예약 시작 시간 >= 예약 종료시간 || 영업 시작 시간 > 예약 시작 시간 || 영업 종료 시간 < 예약 종료시간
		if(Integer.parseInt(res_start) >= Integer.parseInt(res_end) || 
				openTime > Integer.parseInt(res_start) || 
				closeTime < Integer.parseInt(res_end)) {
			insertCnt = 2;
			
		// 예약 시작 시간 < 예약 종료시간
		}  else {
			res_start = res_start + ":00";
			res_end = res_end + ":00";
			vo.setRes_start(res_start);
			vo.setRes_end(res_end);
			
			// 예약 신청 시간 가능 여부 체크를 위한 뷰 생성를 생성해서, 그 뷰와 reservation_tbl를 조인
			// => count(*) = 0이면 예약 가능
			// 예약 신청 시간 가능 여부 체크를 위한 뷰 생성 sql문
			String sql = "CREATE OR REPLACE VIEW res_timetable_view " 
							+ "AS "
							+ "SELECT * "
							+ "FROM reservation_detail_tbl "
							+ "WHERE TO_DATE('1990/01/01' || '" + res_start + "', 'YYYY/MM/dd HH24:mi') BETWEEN TO_DATE(TO_CHAR('1990/01/01' || res_start), 'YYYY/MM/dd HH24:mi') + 5/(24*60) AND TO_DATE(TO_CHAR('1990/01/01' || res_end), 'YYYY/MM/dd HH24:mi') - 5/(24*60) "
							+ "OR TO_DATE('1990/01/01' || '" + res_end + "', 'YYYY/MM/dd HH24:mi') BETWEEN TO_DATE(TO_CHAR('1990/01/01' || res_start), 'YYYY/MM/dd HH24:mi') + 5/(24*60) AND TO_DATE(TO_CHAR('1990/01/01' || res_end), 'YYYY/MM/dd HH24:mi') - 5/(24*60) "
							+ "OR TO_DATE(TO_CHAR('1990/01/01' || res_start), 'YYYY/MM/dd HH24:mi') + 5/(24*60) BETWEEN TO_DATE('1990/01/01' || '" + res_start + "', 'YYYY/MM/dd HH24:mi') AND TO_DATE('1990/01/01' || '" + res_end + "', 'YYYY/MM/dd HH24:mi') " 
							+ "OR TO_DATE(TO_CHAR('1990/01/01' || res_end), 'YYYY/MM/dd HH24:mi') - 5/(24*60) BETWEEN TO_DATE('1990/01/01' || '" + res_start + "', 'YYYY/MM/dd HH24:mi') AND TO_DATE('1990/01/01' || '" + res_end + "', 'YYYY/MM/dd HH24:mi')";
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sql", sql);
			map.put("res_date", res_date);
			map.put("room_setting_code", room_setting_code);
			// 예약 신청 시간 가능 여부 체크
			int chk = dao.chkRoomBooking(map);
			System.out.println("chk : " + chk);
			
			// chk !=0 이면 예약 불가능 => insertCnt = 3 
			// 예약 가능
			if(chk == 0) {
				System.out.println("예약 가능");
				insertCnt = dao.insertRoomBooking(vo);
			} else {
				System.out.println("예약 불가능");
				insertCnt = 3;
			}
		}
		
		model.addAttribute("insertCnt_room", insertCnt);
		
	}

	
	

	

}
