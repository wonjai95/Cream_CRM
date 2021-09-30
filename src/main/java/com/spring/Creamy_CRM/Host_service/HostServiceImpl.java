package com.spring.Creamy_CRM.Host_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.spel.ast.OpNE;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.HostDao;
import com.spring.Creamy_CRM.VO.HostVO;
import com.spring.Creamy_CRM.VO.OperatingScheVO;
import com.spring.Creamy_CRM.VO.RoomSettingVO;
import com.spring.Creamy_CRM.VO.ZipcodeVO;
import com.spring.Creamy_CRM.util.Page;

import oracle.net.aso.r;
import sun.awt.image.PNGImageDecoder.Chromaticities;
import sun.print.resources.serviceui;

@Service
public class HostServiceImpl implements HostService {

	@Autowired
	private HostDao dao;

	// 마이페이지 정보요청
	@Override
	public void getHostInfo(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		
		//내정보
		HostVO hostVo = dao.selectInfo(host_code);
		System.out.println(hostVo.getHost_code());
		
		model.addAttribute("hostVo", hostVo);
		
		//시간설정탭
		String[] days = { "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일" };
		List<String> dayList = new ArrayList<String>();
		for (int i = 0; i < days.length; i++) {
			dayList.add(days[i]);
		}
		model.addAttribute("dayList", dayList);

		OperatingScheVO[] operArray = new OperatingScheVO[WEEK];
		
		List<OperatingScheVO> list = dao.getWorkTime(host_code);
		
		if(list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				OperatingScheVO vo = list.get(i);
				int idx = Integer.parseInt(vo.getOperating_day());
				operArray[idx-1] = vo;
			}
			model.addAttribute("operArray",operArray);
		}
		
		
		
	}

	// 시간설정
	@Override
	public void setWorkTime(HttpServletRequest req, Model model) {

		String code = (String) req.getSession().getAttribute("code");

		String[] day = req.getParameterValues("day");
		String[] open = req.getParameterValues("open");
		String[] close = req.getParameterValues("close");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("host_code", code);
		OperatingScheVO vo = new OperatingScheVO();
		vo.setHost_code(code);

		int count = 0;
		String temp = "";
		String front = "";
		String back = "";
		for (int i = 0; i < day.length; i++) {
			int idx = open[i].indexOf(":");
			temp = open[i].substring(idx);
			if(!temp.equals(":00")) {
				front = open[i].substring(0,idx);
				back = open[i].substring(idx);
				back = back.replace(back, ":00");
				String startTime = front + back;
				open[i] = startTime;
				System.out.println("시작 시간 : " + open[i]);
			}
			
			idx = close[i].indexOf(":");
			temp = close[i].substring(idx);
			if(!temp.equals(":00")) {
				front = close[i].substring(0,idx);
				back = close[i].substring(idx);
				back = back.replace(back, ":00");
				String endTime = front + back;
				close[i] = endTime;
				System.out.println("끝 시간 : " + close[i]);
			}
			
			map.put("operating_day", day[i]);
			vo.setOperating_day(day[i]);
			vo.setOpen_sche(open[i]);
			vo.setClose_sche(close[i]);
			int selectCnt = dao.chkScheSet(map);
			if (selectCnt != 1) {
				count += dao.setOeratingTime(vo);
			} else {
				count += dao.altOperatingTime(vo);
			}

		}

		System.out.println(count + " 개 항목 등록 및 수정");
		model.addAttribute("count", count);
	}

	//사업자정보 등록
	@Override
	public void addCompanyAction(HttpServletRequest req, Model model) {
		String host_code = (String)req.getSession().getAttribute("code");
		String zipcode = req.getParameter("zipcode");
		ZipcodeVO zipcodeVo = null;
		
		int chkZipcode = dao.chkZipcode(zipcode);
		if (chkZipcode != 1) {
			zipcodeVo = new ZipcodeVO();
			zipcodeVo.setZipcode(zipcode);
			zipcodeVo.setSido(req.getParameter("sido"));
			zipcodeVo.setGugun(req.getParameter("gugun"));
			int insertZipcode = dao.insertZipcode(zipcodeVo);
			System.out.println("insert zipcode - " + insertZipcode);
		}
		
		HostVO vo = new HostVO();
		vo.setHost_code(host_code);
		vo.setZipcode(zipcode);
		vo.setComp_condition(req.getParameter("comp_condition"));
		vo.setComp_type(req.getParameter("comp_type"));
		vo.setComp_address(req.getParameter("comp_address"));
		vo.setComp_res(req.getParameter("comp_res"));
		int insertCnt = dao.insertCompany(vo);
		
		model.addAttribute("insertCnt",insertCnt);
	}

	//호실 이름 중복 확인
	@Override
	public int chkRoomName(HttpServletRequest req, Model model) {
		String host_code = (String)req.getSession().getAttribute("code");
		String room_name = req.getParameter("room_name");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("host_code", host_code);
		map.put("room_name", room_name);
		return dao.chkRoomName(map);
	}

	//호실 확인
	@Override
	//public RoomSettingVO addRoomAction(HttpServletRequest req, Model model) {
	public int addRoomAction(HttpServletRequest req, Model model) {
		String host_code = (String)req.getSession().getAttribute("code");
		String room_name = req.getParameter("room_name");
		String room_stat = req.getParameter("room_stat");
		String per_price = req.getParameter("per_price");
		String min_cnt = req.getParameter("min_cnt");
		String max_cnt = req.getParameter("max_cnt");
		
		RoomSettingVO vo = new RoomSettingVO();
		vo.setHost_code(host_code);
		vo.setRoom_name(room_name);
		vo.setRoom_stat(room_stat);
		vo.setPer_price(Integer.parseInt(per_price));
		vo.setMin_cnt(Integer.parseInt(min_cnt));
		vo.setMax_cnt(Integer.parseInt(max_cnt));
		
		/*
		int cnt = dao.insertRoom(vo);
		
		if(cnt == 1) {
			vo = dao.getRoom(vo);
		}else {
			vo = null;
		}
		return vo;
		*/
		return dao.insertRoom(vo);
	}

	//호실 리스트
	@Override
	public void roomList(HttpServletRequest req, Model model) {
		String host_code = (String)req.getSession().getAttribute("code");
		String room_stat = req.getParameter("room_stat");
		System.out.println("state "  + room_stat);
		if(room_stat == null || room_stat.equals("0") || req.getAttribute("setNull") != null) {
			room_stat = null;
		}
		System.out.println("pageNum " + req.getParameter("pageNum"));
		System.out.println("state2 " + room_stat);
		System.out.println("host_code " + host_code);
		Page rPage = new Page();
		RoomSettingVO vo = new RoomSettingVO();
		List<RoomSettingVO> list = new ArrayList<RoomSettingVO>();
		vo.setHost_code(host_code);
		vo.setRoom_stat(room_stat);
		
		//페이징
		int cnt = dao.roomCnt(vo);
		System.out.println("cnt : " + cnt);
		rPage.setCnt(cnt);
		rPage.setPageSize(3);
		rPage.setPageBlock(3);
		rPage.setCurrentPage(req.getParameter("pageNum"));

		if (rPage.getCnt() > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("host_code", host_code);
			map.put("room_stat", room_stat);
			map.put("start", rPage.getStart());
			map.put("end", rPage.getEnd());
			list = dao.selectRoomList(map);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("room_stat", room_stat);
		model.addAttribute("cnt", rPage.getCnt());
		model.addAttribute("startPage", rPage.getStartPage());
		model.addAttribute("endPage", rPage.getEndPage());
		model.addAttribute("pageBlock", rPage.getPageBlock());
		model.addAttribute("currentPage", rPage.getCurrentPage());
		model.addAttribute("pageCount", rPage.getPageCount());
		
	}
	
	//호실 상세(수정)
	@Override
	public void detailRoom(HttpServletRequest req, Model model) {
		String host_code = (String)req.getSession().getAttribute("code");
		String room_setting_code = req.getParameter("room_setting_code");
		RoomSettingVO vo = new RoomSettingVO();
		vo.setHost_code(host_code);
		vo.setRoom_setting_code(room_setting_code);
		vo = dao.getRoom(vo);
		model.addAttribute("vo",vo);
	}
	

}
