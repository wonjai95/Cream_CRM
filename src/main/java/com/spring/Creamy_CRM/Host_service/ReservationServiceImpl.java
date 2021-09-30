/*
 * 작성자 : 이시현
 * 작성일 : 2021-09-20 ~ 2021-09-20
 * 예약 관련 service
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.ReservationDAO;
import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.userVO;
import com.spring.Creamy_CRM.util.Page;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDAO dao;
	
	
	
//======= 예약요청 탭 =======	
	// 예약요청 목록	
	@Override
	public void requestList(HttpServletRequest req, Model model) {
		System.out.println("서비스 requestList시작합니다.");
		
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		// 페이징 (변수들)
		Page requestPage = new Page();
		requestPage.setPageSize(10);
		requestPage.setPageBlock(10);
		requestPage.setCnt(dao.getRequestCnt());
		requestPage.setCurrentPage(req.getParameter("pageNum"));
		String host_code = (String) req.getSession().getAttribute("code");
		System.out.println("host_code : " + host_code);
		String comp_res = req.getParameter("mdto.comp_res");
		System.out.println("comp_res : " + comp_res);
		
		System.out.println("==============================");
		
		List<ReservationVO> mdtos = null;
		List<ReservationVO> rdtos = null;
		//String state = "서비스 완료";

		if(requestPage.getCnt() > 0) {
			System.out.println("getCnt : " + requestPage.getCnt());
			// 5-2단계. 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("host_code", host_code);
			map.put("start", requestPage.getStart());
			map.put("end", requestPage.getEnd());
			//map.put("res_state", state);
			
//			if(req.getParameter("res_state").equals("0")) {
//				System.out.println("res_state 1 : " + req.getParameter("res_state"));
				// 1. 예약상태가 "서비스 완료"가 아닌 모든 예약요청 목록(예약완료 & 예약취소) 조회
				mdtos = dao.getRequestMngList(map);
				//System.out.print(mdtos.comp_res);
				rdtos = dao.getRequestRoomList(map);  // dtos대신 list로 매개변수 줘도 무방하다.
				
//			} else if(req.getParameter("res_state").equals("예약완료")) {
//				System.out.println("res_state 2 : " + req.getParameter("res_state"));
//				// 2. 예약상태가 "서비스 완료"가 아닌 예약요청 목록(= 예약완료) 조회
//				dtos = dao.getRequestComplete(map);
//			} else if(req.getParameter("res_state").equals("예약취소")) {
//				System.out.println("res_state 3 : " + req.getParameter("res_state"));
//				// 3. 예약상태가 "서비스 완료"가 아닌 예약요청 목록(= 예약취소) 조회
//				dtos = dao.getRequestCancel(map);
//			}			
		}
		
		//System.out.println(requestPage.getCnt());
		//System.out.println(rdtos);
		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("mdtos", mdtos);
		model.addAttribute("rdtos", rdtos);			// 리스트 = 게시글 목록
		model.addAttribute("cnt", requestPage.getCnt());			// 글 갯수
		model.addAttribute("pageNum", requestPage.getCurrentPage());	// 페이지 번호
		model.addAttribute("number", requestPage.getNumber());		// 출력용 글 번호

		if(requestPage.getCnt() > 0) {
			model.addAttribute("startPage", requestPage.getStartPage());		// 시작 페이지 
			model.addAttribute("endPage", requestPage.getEndPage());			// 마지막 페이지
			model.addAttribute("pageBlock", requestPage.getPageBlock());		// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", requestPage.getPageCount());		// 페이지 갯수
			model.addAttribute("currentPage", requestPage.getCurrentPage());	// 현재 페이지
		}
	}

	// 예약요청 검색목록
	@Override
	public void requestSearch(HttpServletRequest req, Model model) {
		
		String res_state = req.getParameter("res_state");
		System.out.println("res_state ==> " + res_state);
		
		List<ReservationVO> dtos = dao.requestSearch(res_state);
		System.out.println("dtos ==> " + dtos);
		
		model.addAttribute("dtos", dtos);
	}
	
	// 예약요청 상세 페이지
	@Override
	public void requestDetailAction(HttpServletRequest req, Model model) {
		// http://localhost:8080/Creamy_CRM/host/requestDetails?res_code=RSD123&res_detail_code=RSD123
		System.out.println("===== 예약요청 상세페이지 시작합니다 =====");
		System.out.println("===== 예약요청에 따른 회원정보 =====");
		String user_id = req.getParameter("user_id");
		System.out.println("user_id : " + user_id);
		
		userVO uservo = dao.getUserInfo(user_id);
		
		System.out.println("===== 예약요청 상세정보 =====");
		String res_code = req.getParameter("res_code");
		String res_detail_code = req.getParameter("res_detail_code");
		System.out.println("res_code : " + res_code);
		System.out.println("res_detail_code : " + res_detail_code);
		
		ReservationVO vo = dao.getRequestDetail(res_code);
		
		model.addAttribute("udto", uservo);
		model.addAttribute("dto", vo);
	}

	// 예약요청 수정처리 페이지
	@Override
	public void modifyAction(HttpServletRequest req, Model model) {
		System.out.println("modifyAction 시작합니다.");
		// 3단계. 화면으로부터 입력받은 값(= hidden값)을 받아온다.
		String res_state = req.getParameter("res_state");
		//int res_hour = Integer.parseInt(req.getParameter("res_hour"));
		//String res_room = req.getParameter("res_room");
		int res_cnt = Integer.parseInt(req.getParameter("res_cnt"));
		String employee_code = req.getParameter("employee_code");
		String res_indiv_request = req.getParameter("res_indiv_request");
		String res_memo = req.getParameter("res_memo");
		String res_code = req.getParameter("res_code");
		String res_detail_code = req.getParameter("res_detail_code");
		
		// reservationVO vo 바구니 생성
		ReservationVO vo = new ReservationVO();
		
		vo.setRes_state(res_state);
		//vo.setRes_hour(res_hour);
		//vo.setRes_room(res_room);
		vo.setRes_cnt(res_cnt);
		vo.setEmployee_code(employee_code);
		vo.setRes_indiv_request(res_indiv_request);
		vo.setRes_memo(res_memo);
		vo.setRes_code(res_code);  // update시, WHERE절에서 key를 비교하기 위해서.
		vo.setRes_detail_code(res_detail_code);  // update시, WHERE절에서 key를 비교하기 위해서.
		
		System.out.println("res_state : " + res_state);
		//System.out.println("res_hour : " + res_hour);
		//System.out.println("res_room : " + res_room);
		System.out.println("res_cnt : " + res_cnt);
		System.out.println("employee_code : " + employee_code);
		System.out.println("res_indiv_request : " + res_indiv_request);
		System.out.println("res_memo : " + res_memo);
		System.out.println("res_code : " + res_code);
		System.out.println("res_detail_code : " + res_detail_code);
		
		int updateCnt = dao.updateRequest1(vo);
		System.out.println("updateCnt : " + updateCnt);
		
		model.addAttribute("updateCnt", updateCnt);  // updateCnt = 2
	}

	// 예약요청 삭제처리 페이지
	@Override
	public void deleteAction(HttpServletRequest req, Model model) {
		System.out.println("deleteAction 시작합니다.");
		// 3단계. 화면으로부터 입력받은 값(= hidden값)을 받아온다.
		String res_state = "예약취소";
		String res_code = req.getParameter("res_code");
		
		// reservationVO vo 바구니 생성
		ReservationVO vo = new ReservationVO();
		
		vo.setRes_state(res_state);
		vo.setRes_code(res_code);  // update시, WHERE절에서 key를 비교하기 위해서.
		
		System.out.println("res_state : " + res_state);
		System.out.println("res_code : " + res_code);
		
		int deleteCnt = dao.deleteRequest(vo);
		System.out.println("deleteCnt : " + deleteCnt);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	// 서비스 완료처리 페이지
	public void completeAction(HttpServletRequest req, Model model) {
		System.out.println("completeAction 시작합니다.");
		// 3단계. 화면으로부터 입력받은 값(= hidden값)을 받아온다.
		String res_state = "서비스 완료";
		String res_code = req.getParameter("res_code");
		
		// reservationVO vo 바구니 생성
		ReservationVO vo = new ReservationVO();
		
		vo.setRes_state(res_state);
		vo.setRes_code(res_code);  // update시, WHERE절에서 key를 비교하기 위해서.
		
		System.out.println("res_state : " + res_state);
		System.out.println("res_code : " + res_code);
		
		int updateCnt = dao.completeService(vo);
		System.out.println("updateCnt : " + updateCnt);
		
		model.addAttribute("updateCnt", updateCnt);
	}
	
	
	
	
	
//======= 예약조회 탭 =======
	// 예약조회 목록
	@Override
	public void completeList(HttpServletRequest req, Model model) {
		System.out.println("서비스 completeList시작합니다.");
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		// 페이징 (변수들)
		Page completePage = new Page();
		
		completePage.setPageSize(10);
		completePage.setPageBlock(10);
		completePage.setCnt(dao.getCompleteCnt());
		completePage.setCurrentPage(req.getParameter("pageNum"));
		
		System.out.println("==============================");
		
		List<ReservationVO> cdtos = null;

		if(completePage.getCnt() > 0) {
			// 5-2단계. 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", completePage.getStart());
			map.put("end", completePage.getEnd());
			
			cdtos = dao.getCompleteList(map);  // dtos대신 list로 매개변수 줘도 무방하다.
		}
		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("cdtos", cdtos);			// 리스트 = 게시글 목록
		model.addAttribute("ccnt", completePage.getCnt());			// 글 갯수
		model.addAttribute("cpageNum", completePage.getCurrentPage());	// 페이지 번호
		model.addAttribute("cnumber", completePage.getNumber());		// 출력용 글 번호

		if(completePage.getCnt() > 0) {
			model.addAttribute("cstartPage", completePage.getStartPage());		// 시작 페이지 
			model.addAttribute("cendPage", completePage.getEndPage());			// 마지막 페이지
			model.addAttribute("cpageBlock", completePage.getPageBlock());		// 한 블럭당 페이지 갯수
			model.addAttribute("cpageCount", completePage.getPageCount());		// 페이지 갯수
			model.addAttribute("ccurrentPage", completePage.getCurrentPage());	// 현재 페이지
		}
	}

}
