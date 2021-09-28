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
		int pageSize = 10;		// 한 페이지당 출력할 글의 갯수
		int pageBlock = 10;		// 한 블럭당 페이지의 갯수
		
		int cnt = 0;			// 글 갯수
		int start = 0;			// 현재(각) 페이지의 시작 글 번호
		int end = 0;			// 현재(각) 페이지의 마지막 글 번호
		int number = 0;			// 출력용 글 번호 (글 제목 & 내용이 삭제가 되어도 번호는 바로 이관/대체될 수 있도록)
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지 
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		// 5-1단계. 게시글 갯수 조회
		cnt = dao.getRequestCnt();
		System.out.println("cnt => " + cnt);
		
		pageNum = req.getParameter("pageNum");
		System.out.println("pageNum => " + pageNum);
		
		if(pageNum == null) {
			pageNum = "1";	// 첫 페이지를 1페이지로 지정한다.
			System.out.println("pageNum첫페이지 => " + pageNum);
		}
		
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		
		// 페이지 갯수 p6=(30/5) + (0 = 나머지 페이지)
		// (페이지 갯수 + 나머지)가 있으면 1페이지를 추가, 그렇지 않으면 0으로 남겨라.
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		// 현재 페이지 시작 글 번호(페이지 별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 -1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;
		
		// 현재 페이지 마지막 글 번호(페이지 별)
		// end = start +  pageSize - 1;
		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		// 출력용 글 번호
		// 예) 30 = 30 - (1 - 1) * 5;  // = 1페이지
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		
		// 마지막 페이지
		// 3 = 1 + 3 - 1
		// endPage = startPage + pageBlock - 1;
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		System.out.println("endPage : " + endPage);
		
		System.out.println("==============================");
		
		List<ReservationVO> dtos = null;
		//String state = "서비스 완료";

		if(cnt > 0) {
			// 5-2단계. 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			//map.put("res_state", state);
			
			dtos = dao.getRequestList(map);  // dtos대신 list로 매개변수 줘도 무방하다.
		}
		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos);			// 리스트 = 게시글 목록
		model.addAttribute("cnt", cnt);			// 글 갯수
		model.addAttribute("pageNum", pageNum);	// 페이지 번호
		model.addAttribute("number", number);		// 출력용 글 번호

		if(cnt > 0) {
			model.addAttribute("startPage", startPage);		// 시작 페이지 
			model.addAttribute("endPage", endPage);			// 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);		// 페이지 갯수
			model.addAttribute("currentPage", currentPage);	// 현재 페이지
		}
	}

	// 예약요청 검색목록
	@Override
	public void requestSearch(HttpServletRequest req, Model model) {
		
		String res_code = req.getParameter("res_code");
		System.out.println("res_code ==> " + res_code);
		
		List<ReservationVO> dtos = dao.requestSearch(res_code);
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
		// 3단계. 화면으로부터 입력받은 값(= hidden값, input(비밀번호)값)을 받아온다.
		String res_code = req.getParameter("res_code");
		String res_detail_code = req.getParameter("res_detail_code");
		System.out.println("res_code : " + res_code);
		System.out.println("res_detail_code : " + res_detail_code);
		
		// 5단계. 게시글 삭제 처리
		int deleteCnt = dao.deleteRequest1(res_code) + dao.deleteRequest2(res_detail_code);
		System.out.println("deleteCnt : " + deleteCnt);
	
		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("deleteCnt", deleteCnt);  // deleteCnt = 2
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
		int pageSize = 10;		// 한 페이지당 출력할 글의 갯수
		int pageBlock = 10;		// 한 블럭당 페이지의 갯수
		
		int cnt = 0;			// 글 갯수
		int start = 0;			// 현재(각) 페이지의 시작 글 번호
		int end = 0;			// 현재(각) 페이지의 마지막 글 번호
		int number = 0;			// 출력용 글 번호 (글 제목 & 내용이 삭제가 되어도 번호는 바로 이관/대체될 수 있도록)
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지 
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		// 5-1단계. 게시글 갯수 조회
		cnt = dao.getCompleteCnt();
		System.out.println("cnt => " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	// 첫 페이지를 1페이지로 지정한다.
		}
		
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		
		// 페이지 갯수 p6=(30/5) + (0 = 나머지 페이지)
		// (페이지 갯수 + 나머지)가 있으면 1페이지를 추가, 그렇지 않으면 0으로 남겨라.
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		// 현재 페이지 시작 글 번호(페이지 별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 -1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;
		
		// 현재 페이지 마지막 글 번호(페이지 별)
		// end = start +  pageSize - 1;
		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		// 출력용 글 번호
		// 예) 30 = 30 - (1 - 1) * 5;  // = 1페이지
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		
		// 마지막 페이지
		// 3 = 1 + 3 - 1
		// endPage = startPage + pageBlock - 1;
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		System.out.println("endPage : " + endPage);
		
		System.out.println("==============================");
		
		List<ReservationVO> cdtos = null;

		if(cnt > 0) {
			// 5-2단계. 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			cdtos = dao.getCompleteList(map);  // dtos대신 list로 매개변수 줘도 무방하다.
		}
		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("cdtos", cdtos);			// 리스트 = 게시글 목록
		model.addAttribute("cnt", cnt);			// 글 갯수
		model.addAttribute("pageNum", pageNum);	// 페이지 번호
		model.addAttribute("number", number);		// 출력용 글 번호

		if(cnt > 0) {
			model.addAttribute("startPage", startPage);		// 시작 페이지 
			model.addAttribute("endPage", endPage);			// 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);		// 페이지 갯수
			model.addAttribute("currentPage", currentPage);	// 현재 페이지
		}
	}

}
