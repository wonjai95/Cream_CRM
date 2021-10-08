/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 후기 controller
 * 
*/
package com.spring.Creamy_CRM.Host_controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.Creamy_CRM.Host_service.LoginService;
import com.spring.Creamy_CRM.Host_service.LoginServiceImpl;
import com.spring.Creamy_CRM.User_service.UserReviewServiceImpl;

@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	UserReviewServiceImpl service_review;

	//리뷰 메인페이지
	@RequestMapping("/host/review")
	public String review(HttpServletRequest req, Model model) {
		logger.info("url -> review");
		
		service_review.getStoreReviewList(req, model);
		service_review.getOutReviewList(req, model);
		
		return "host/review/userReview_main";
	}
	
	//리뷰 검색 -AJAX
	@RequestMapping("/host/review_searchlist")
	public String review_searchlist(HttpServletRequest req, Model model) {
		logger.info("url -> review_searchlist");
		
		service_review.reviewSearchList(req, model);
		
		return "host/review/userReview";
	}

	
	//외부추적 그래프
	@RequestMapping("/host/outreview_graph")
	public String outreview_graph(HttpServletRequest req, Model model) {
		logger.info("url -> outReview_graph");
		
		service_review.getOutReveiw_GraptData(req, model);
		
		return "host/review/outReview_graph";
	}
	
	
	//새 추적 생성
	@RequestMapping("/host/newchace")
	public String newchace(HttpServletRequest req, Model model) {
		logger.info("url -> newchace");
		
		return "host/review/addoutReview";
	}
	
	//새 추적 등록 action
	@RequestMapping("/host/addoutReview_Action")
	public String addoutReview_Action(HttpServletRequest req, Model model) {
		logger.info("url -> addoutReview_Action");
		
		service_review.addOutReview(req, model);
		
		return "host/review/addoutReview_check";
	}
	
	//키워드 입력시 크롤링
	@RequestMapping("/host/keywordSearch")
	public String keywordSearch(HttpServletRequest req, Model model) {
		logger.info("url->keywordSearch");
		
		service_review.SearchKeyword(req, model);
		
		
		return "host/review/outSearchlist";
	}
	
	//후기 추적 삭제 
	@RequestMapping("/host/delete_outReview")
	public String delete_outReview(HttpServletRequest req, Model model) {
		logger.info("url -> delete_outReview");
		
		return "host/review/check_delete";
	}
	
	//후기 추적 삭제 action
	@RequestMapping("/host/delete_outReviewAction")
	public String delete_outReviewAction(HttpServletRequest req, Model model) {
		logger.info("url -> delete_outReviewAction");
		
		service_review.Delete_outReview(req, model);
		
		
		return "host/review/delete_outReviewAction";
	}
	

}
