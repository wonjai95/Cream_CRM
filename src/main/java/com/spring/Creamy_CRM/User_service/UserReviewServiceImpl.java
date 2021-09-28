package com.spring.Creamy_CRM.User_service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.HashAttributeSet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.LoginDAOImpl;
import com.spring.Creamy_CRM.User_dao.UserReviewDAOImpl;
import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.ReviewVO;

@Service
public class UserReviewServiceImpl implements UserReviewService {

	@Autowired
	UserReviewDAOImpl dao_review;
	
	@Autowired
	LoginDAOImpl dao_login;
	
	//예약목록 받아오기
	@Override
	public void getReservationList(HttpServletRequest req, Model model) {
		String user_id = (String) req.getSession().getAttribute("id");
		System.out.println("id : "+ user_id);
		
		Date today = new Date(System.currentTimeMillis());
		
		List<ReservationVO> list = dao_review.getReservationList(user_id);
		System.out.println("list : " + list.size());
		req.setAttribute("list", list);
		req.setAttribute("today", today);
	}

	//한건의 예약정보 받아오기 - 안씀
	@Override
	public void getReservationdetail(HttpServletRequest req, Model model) {
		String res_code = req.getParameter("res_code");
		Date today = new Date(System.currentTimeMillis());
		
		ReservationVO vo = dao_review.getReservationDetail(res_code);
		
		req.setAttribute("today", today);
		req.setAttribute("vo", vo);
		req.setAttribute("res_code", res_code);
	}

	//review write action
	@Override
	public void insertReviewAction(HttpServletRequest req, Model model) {
		String res_code = req.getParameter("res_code");
		String id = (String) req.getSession().getAttribute("id");
		//유저 코드 들고오기
		String user_code = dao_login.getUserInfo(id).getUser_code();
		
		String title = req.getParameter("title");
		String content = req.getParameter("contents");
		int readCnt = 0;
		Date date = new Date(System.currentTimeMillis());
		int star = Integer.parseInt(req.getParameter("star"));
		String imgPath = req.getParameter("file_name");
		
		ReviewVO vo = new ReviewVO();
		vo.setUser_code(user_code);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setReadCnt(readCnt);
		vo.setRegDate(date);
		vo.setStar(star);
		vo.setReview_img(imgPath);
		vo.setRes_code(res_code);
		
		System.out.println("이미지 " +imgPath);
		System.out.println("별 " +star);
		
		
		
	  int insertcnt = dao_review.InsertReview(vo);
	  System.out.println("후기 등록 성공 : "+insertcnt);
	  
	  if(insertcnt > 0) { int modifyCnt = dao_review.modifyresCheck(res_code);
	  System.out.println("예약 수정 성공  : "+modifyCnt); }
	 
			
		
	}

	//내 리뷰 보기
	@Override
	public void getMyReviewList(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		//유저 코드 들고오기
		String user_code = dao_login.getUserInfo(id).getUser_code();
		
		List<ReviewVO> list = dao_review.getMyReviewList(user_code);
		
		req.setAttribute("list", list);
		
	}

	//전체 후기 리스트 출력
	@Override
	public void getReviewList(HttpServletRequest req, Model model) {

		List<ReviewVO> list = dao_review.getAllReviewList();
		
		req.setAttribute("list", list);
	}

	//매장별 후기 보기
	@Override
	public void getStoreReviewList(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		
		List<ReviewVO> list = dao_review.getStoreReviewList(host_code);
		String user_code = "";
		
		for(ReviewVO vo : list) {
			user_code += vo.getUser_code() + "-";
		}
		String[] user_codearr = user_code.split("-");
		
		Map<String, List<ReservationVO>> resmap = new HashMap<String, List<ReservationVO>>();
		
		for(String key : user_codearr) {
			if(resmap.containsKey(key)) {
			
			}
			else {
				List<ReservationVO> res_list = dao_review.getUserReservationlist(key);
				resmap.put(key, res_list);
			}
		}
		
		req.setAttribute("list", list);
		req.setAttribute("resmap", resmap);
		
	}

	//후기 디테일
	@Override
	public void ReviewDetail(HttpServletRequest req, Model model) {
		String review_code = req.getParameter("review_code");
		System.out.println("후기번호 : "+review_code);
		String check_page = req.getParameter("check_page");
		System.out.println("페이지 ? "+check_page);
		
		ReviewVO vo = dao_review.getReviewDetail(review_code);
		
		int readcnt = vo.getReadCnt() + 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("review_code", review_code);
		map.put("readcnt",readcnt);
		
		//조회수 증가
		dao_review.plusReadCnt(map);
		
		req.setAttribute("vo", vo);
		req.setAttribute("check_page", check_page);
		
	}

	//후기 수정 액션
	@Override
	public void Modify_reviewAction(HttpServletRequest req, Model model) {
		String review_code = req.getParameter("review_code");
		String res_code = req.getParameter("res_code");
		String id = (String) req.getSession().getAttribute("id");
		//유저 코드 들고오기
		String user_code = dao_login.getUserInfo(id).getUser_code();
		
		String title = req.getParameter("title");
		String content = req.getParameter("contents");
		Date date = new Date(System.currentTimeMillis());
		int star = Integer.parseInt(req.getParameter("star"));
		String imgPath = req.getParameter("file_name");
		
		if(imgPath.length() < 1) {
			imgPath = req.getParameter("img_url");
		}
		
		ReviewVO vo = new ReviewVO();
		vo.setReview_code(review_code);
		vo.setUser_code(user_code);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setRegDate(date);
		vo.setStar(star);
		vo.setReview_img(imgPath);
		vo.setRes_code(res_code);
		
		System.out.println("이미지 " +imgPath);
		System.out.println("별 " +star);
		
		int modifyCnt = dao_review.modify_Review(vo);
		System.out.println("후기 수정 성공 : "+modifyCnt);
		
	}


}
