package com.spring.Creamy_CRM.User_service;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.HashAttributeSet;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.LoginDAOImpl;
import com.spring.Creamy_CRM.User_dao.UserReviewDAOImpl;
import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.ReviewVO;
import com.spring.Creamy_CRM.VO.outReviewVO;

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

	//검색 결과
	@Override
	public void reviewSearchList(HttpServletRequest req, Model model) {
		String option = req.getParameter("option");
		String keyword = req.getParameter("keyword");
		String host_code = (String) req.getSession().getAttribute("code");
		
		String res_keyword = "%"+keyword+"%";
		
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		//글제목
		if(option.equals("2")) {
			System.out.println("title 검색");
			Map<String, String> map = new HashMap<String, String>();
			map.put("host_code", host_code);
			map.put("title", res_keyword);
			
			list = dao_review.getReviewSearch_title(map);
		}
		
		//작성자
		else if(option.equals("3")) {
			System.out.println("작성자 검색 - "+res_keyword);
			Map<String, String> map = new HashMap<String, String>();
			map.put("host_code", host_code);
			map.put("name", res_keyword);
			
			list = dao_review.getReviewSearch_user(map);
			
		}
		
		//등록일
		else if(option.equals("4")) {
			System.out.println("등록일 검색 - "+res_keyword);
			Map<String, String> map = new HashMap<String, String>();
			map.put("host_code", host_code);
			map.put("date", res_keyword);
			
			list = dao_review.getReviewSearch_date(map);
		}
		
		//리스트 고객 예약내역 불러오는거..
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
	
		
	}//검색결과 end

	//키워드 입력시 크롤링
	@Override
	public void SearchKeyword(HttpServletRequest req, Model model) {

		String keyword = req.getParameter("keyword");
		System.out.println("keyword : "+keyword);
		
		String url = "https://search.naver.com/search.naver?where=view&sm=tab_jum&query="+keyword;
		
		List<String> list_url = new ArrayList<String>();
		List<String> list_title = new ArrayList<String>();
		
		Document doc;
		try {
			doc = Jsoup.connect(url).get();
			
			Elements list = doc.select("._svp_item");
			Elements urllist = list.select(".api_txt_lines");
			list_url = urllist.eachAttr("href");
			List<String> list_text = urllist.eachText();
			
			/* System.out.println(urllist); */
			
			for(int i = 0; i < list_text.size(); i++) {
				if(i %2 == 0) {
					String fulltitle = list_text.get(i);
					if(fulltitle.length() > 10) {
						String title = fulltitle.substring(0,10);
						title += "...";
						list_title.add(title);
					}else {
						list_title.add(list_text.get(i));
					}
				}
					
			}
			
			/*
			 * for(String s : list_title) System.out.println(s);
			 */
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		req.setAttribute("list_url", list_url);
		req.setAttribute("list_title", list_title);
		
		
	}

	//새 추적 등록
	@Override
	public void addOutReview(HttpServletRequest req, Model model) {
		
		String host_code = (String) req.getSession().getAttribute("code");
		
		String title = req.getParameter("post_title");
		String url = req.getParameter("post_url");
		String rank_s = req.getParameter("rank_min");
		int rank = Integer.parseInt(rank_s);
		String keyword = req.getParameter("chace_keyword");
		int max_rank = Integer.parseInt(req.getParameter("rank_level"));
		
		outReviewVO vo = new outReviewVO();
		vo.setHost_code(host_code);
		vo.setOutreview_title(title);
		vo.setOutreview_url(url);
		vo.setOutdetail_rank(rank);
		vo.setOutreview_keyword(keyword);
		vo.setOutdetail_rank(rank);
		vo.setOutreview_rankmax(max_rank);
		
		//새 추적 등록
		int insertCnt = dao_review.addOutReview(vo);
		System.out.println("새 추적 등록? :"+insertCnt);
		
		req.setAttribute("insertCnt", insertCnt);
		
	}

	//외부 리뷰 리스트 받아오기
	@Override
	public void getOutReviewList(HttpServletRequest req, Model model) {
		
		String host_code = (String) req.getSession().getAttribute("code");
		
		List<outReviewVO> list = dao_review.getOutreviewList(host_code);
		
		List<Integer> number_list = new ArrayList<Integer>();
		for(int i = 0; i < 5; i++) {
			number_list.add(i);
		}
		req.setAttribute("number_list", number_list);
		
		if(list.size() != 0) {
			//외부 리뷰 리스트 넘겨주기
			req.setAttribute("out_list", list);
			
			//현재 리뷰 리스트 개수 넘겨주기 - 5개이상 새 추적 되는거 방지
			int listsize = list.size();
			req.setAttribute("out_listsize", listsize);
			
			//첫번째 리뷰 있으면 코드번호 넘겨주기
			String first_code = list.get(0).getOutreview_code();
			req.setAttribute("out_first_code", first_code);
			
		}
		else
			System.out.println("리스트 없음");
		
		
	}

	//후기 추적 순위 그래프용 데이터
	@Override
	public void getOutReveiw_GraptData(HttpServletRequest req, Model model) {
		String code = req.getParameter("code");
		System.out.println("그래프 코드 : "+code);
		
		List<outReviewVO> graph_list = dao_review.getGraphOutreviewList(code);
		
		req.setAttribute("graph_list", graph_list);
		
		int lastindex = graph_list.size() - 1;
		
		
		//앞뒤로 2
		Date f_day = graph_list.get(0).getOutdetail_date();
		Date day = graph_list.get(lastindex).getOutdetail_date();
		
		Calendar f_cal = Calendar.getInstance();
		Calendar cal = Calendar.getInstance();
		f_cal.setTime(f_day);
		cal.setTime(day);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		f_cal.add(f_cal.DATE, -2);
		String firstday = df.format(f_cal.getTime());
		req.setAttribute("firstday", firstday);
		System.out.println(firstday);
		
		f_cal.add(f_cal.DATE, +1);
		String beforeday = df.format(f_cal.getTime());
		req.setAttribute("beforeday", beforeday);
		System.out.println(beforeday);
		
		cal.add(cal.DATE, +1);
		String nextday = df.format(cal.getTime());
		req.setAttribute("nextday", nextday);
		System.out.println(nextday);
		
		cal.add(cal.DATE, +1);
		String finalday = df.format(cal.getTime());
		req.setAttribute("finalday", finalday);
		System.out.println(finalday);
			
		
		
	}

	//추적 삭제
	@Override
	public void Delete_outReview(HttpServletRequest req, Model model) {
		String code = req.getParameter("outReview_hiddencode");
		System.out.println("삭제할 코드 : "+code);
		
		int deleteCnt = dao_review.deleteOutreview(code);
		System.out.println("외부 후기 삭제? :"+deleteCnt);
		req.setAttribute("deleteCnt", deleteCnt);
		
	}


}
