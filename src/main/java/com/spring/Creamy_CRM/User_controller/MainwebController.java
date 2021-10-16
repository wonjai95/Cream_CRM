/*
 * 작성자 : 정지은

 * 작성일 : 2021.09.15
 * 프로젝트 실행 시 제일 첫 메인화면 - 고객 화면이 될 예정
 * 
*/
package com.spring.Creamy_CRM.User_controller;

import java.io.BufferedReader;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.spring.Creamy_CRM.Host_controller.MainController;
import com.spring.Creamy_CRM.Host_service.EmployeeService;
import com.spring.Creamy_CRM.User_service.MainwebServiceImpl;
import com.spring.Creamy_CRM.User_service.PythonService;
import com.spring.Creamy_CRM.User_service.SaleService;
import com.spring.Creamy_CRM.User_service.UserReservationServiceImpl;
import com.spring.Creamy_CRM.User_service.UserReviewServiceImpl;
import com.spring.Creamy_CRM.VO.EmployeeVO;
import com.spring.Creamy_CRM.VO.KakaoPayReadyVO;
import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.util.FcmUtil;

import jdk.nashorn.internal.objects.annotations.Setter;


@Controller
public class MainwebController {
	
   private static final Logger logger = LoggerFactory.getLogger(MainController.class);
   
   public KakaoPayReadyVO kakaoPayReadyVO;
   
   @Autowired
   UserReviewServiceImpl service_review;
   
   @Autowired
   MainwebServiceImpl service;
   
   @Autowired
   UserReservationServiceImpl service_custReserve;
   
   @Autowired
   EmployeeService service_emp;
   
   @Autowired
   SaleService service_sale;
   
   //test중
   @Autowired
   PythonService service_py;
   
   
   //홈화면
   @RequestMapping("/home")
   public String home(HttpServletRequest req, Model model) {
      logger.info("url -> home");
      
//      String comp_res = req.getParameter("com_res");
//      if(comp_res == null) {
//    	  // service
//    	  return "managerbooking";
//      } else if(comp_res.equals("호실")) {
//    	 // service
//    	 return "roombooking";
//      } else {
//    	  return "";
//      }
      /*
      try {
		service_py.pytest(req, model);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		System.out.println("py_error");
		e.printStackTrace();
	}
      */
      
      return "mainweb/home";
   }
   
   //---------------------------------------------------------------------
   //내가 쓴 후기관리
   @RequestMapping("/my_review")
   public String my_review(HttpServletRequest req, Model model) {
      logger.info("url -> my_review");
      
      if(req.getSession().getAttribute("id") != null) {
         
         service_review.getMyReviewList(req, model);
         return "mainweb/review/review_mypage";
         
      }else {
         return "mainweb/login";
      }
   }
   
   //후기 상세 페이지
   @RequestMapping("/ReviewDetail")
   public String ReviewDetail(HttpServletRequest req, Model model) {
      logger.info("url-> ReviewDetail");
      
      service_review.ReviewDetail(req, model);
      
      return "mainweb/review/review_detail";
   }
   
   
   //마이페이지 - 예약관리
   @RequestMapping("/mypage_reservation")
   public String mypage_reservation(HttpServletRequest req, Model model) {
      logger.info("url -> mypage_review");
      
      service_review.getReservationList(req, model);
      
      return "mainweb/mypage/reservation_mypage";
   }
   
   //리뷰 등록
   @RequestMapping("/insertReview")
   public String insertReview(HttpServletRequest req, Model model) {
      logger.info("url -> insertReview");
      
      
      service_review.getReservationdetail(req, model);
      
      return "mainweb/mypage/insertReview";
   }
   
   //리뷰 쓰기 액션
   @RequestMapping("/insertReviewAction")
   public String insertReviewAction(HttpServletRequest req, Model model) {
      logger.info("url -> insertReviewAction");
      
      service_review.insertReviewAction(req, model);
      service_review.getReservationList(req, model);
      
      return "mainweb/mypage/reservation_mypage";
   }
   
   
   //---------------------------------------------------------------------
   
   //리뷰 메인페이지
   @RequestMapping("/review_main")
   public String review_main(HttpServletRequest req, Model model) {
      logger.info("url -> review_main");
      
      service_review.getReviewList(req, model);
      
      return "mainweb/review/review_main";
   }
   
   //리뷰 수정
      @RequestMapping("/modify_review")
      public String modify_review(HttpServletRequest req, Model model) {
         logger.info("url ->modify_review");
         
         service_review.ReviewDetail(req, model);
         
         return "mainweb/review/review_modify";
      }
      
      //리뷰 수정 처리
      @RequestMapping("/modify_reviewAction")
      public String modify_reviewAction(HttpServletRequest req, Model model) {
         logger.info("url -> modify_reviewAction");
         
         service_review.Modify_reviewAction(req, model);
         
         String pageCheck = req.getParameter("check_page");
         
         if(pageCheck.equals("my")) {
            service_review.getMyReviewList(req, model);
            
            return "mainweb/review/review_mypage";
         }else {
            
            service_review.getReviewList(req, model);
            return "mainweb/review/review_main";   
         }
         
      }
   
   
   
   //이메일 링크 체크시 홈화면으로 return -> service추가예정
   @RequestMapping("/emailChk")
   public String emailChk(HttpServletRequest req, Model model) {
      logger.info("url -> emailChk");
      
      return "mainweb/home";
   }
   
   //-------------------------------- 고객 화면 예약 페이지 --------------------------------
   // 고객 매장 선택 페이지
   @RequestMapping("/selectHost")
      public String selectHost(HttpServletRequest req, Model model) {
         logger.info("url -> selectHost");
         
         service_custReserve.selectHost(req, model);
         return "mainweb/selectHost";
   }   
   
   // 고객 매장 선택 페이지 - 검색
   @RequestMapping("/searchHostList")
   public String searchHostList(HttpServletRequest req, Model model) {
      logger.info("url -> searchHostList");
      
      service_custReserve.searchHostList(req, model);
      return "mainweb/searchHostList";
   }   
   
   
   //회원 예약 페이지
   @RequestMapping("/custBooking")
      public String custBooking(HttpServletRequest req, Model model) {
         logger.info("url -> custBooking");
         
         String comp_res = req.getParameter("comp_res");
         model.addAttribute("host_code", req.getParameter("host_code"));
         model.addAttribute("comp_address", req.getParameter("comp_address"));
         model.addAttribute("comp_res", comp_res);
         
         
         if(comp_res.equals("담당자")) {
            System.out.println("담당자 진입");
            service_custReserve.custManagerBooking(req, model);
            return "mainweb/custManagerBooking";
         } else {
            System.out.println("호실 진입");
            
            model.addAttribute("room_setting_code", req.getParameter("room_setting_code"));
            return "mainweb/custRoomBooking";
         }
        
   }   
   
   // 회원 예약 가능 시간 표시
   @RequestMapping("/bookingTimeTable")
   public String bookingTimeTable(HttpServletRequest req, Model model) {
      logger.info("url -> bookingTimeTable");
      
      service_custReserve.bookingTimeTable(req, model);
      return "mainweb/bookingTimeTable";
   }   
   
   // 회원 예약 가능한 담당자 표시
   @RequestMapping("/managerTimeTable")
   public String managerTimeTable(HttpServletRequest req, Model model) {
      logger.info("url -> managerTimeTable");
      
      service_custReserve.bookingManagerTable(req, model);
      return "mainweb/managerTimeTable";
   }
   
   // 회원 예약 가능한 호실 표시
   @RequestMapping("/bookingRoomTable")
   public String bookingRoomTable(HttpServletRequest req, Model model) {
      logger.info("url -> bookingRoomTable");
      
      service_custReserve.bookingRoomTable(req, model);
      return "mainweb/bookingRoomTable";
   }   
   
   // 회원이 선택한 호실의 상세정보
   @RequestMapping("/roomTimeTable")
   public String roomTimeTable(HttpServletRequest req, Model model) {
      logger.info("url -> roomTimeTable");
      
      service_custReserve.bookingRoomTimeTable(req, model);
//      
//      String res_date = (String) req.getAttribute("selectDate");
//      System.out.println("res_date : " + res_date);
//      model.addAttribute("res_date", res_date);
//      String room_setting_code = (String)req.getAttribute("room_setting_code");
//      System.out.println("room_setting_code : " + room_setting_code);
//      model.addAttribute("room_setting_code", room_setting_code);
      
      return "mainweb/roomDetail";
   }         
   

   // 담당자 - 회원예약 등록처리
   @RequestMapping("/insertBooking")
      public String insertBooking(HttpServletRequest req, Model model) {
         logger.info("url -> insertBooking");
         
         service.insertBooking(req, model);
         logger.info("url -> insertBooking2");
         
         return "mainweb/insertBooking";
   }   

   
   
	/*
	 * 
	 * 
	 * 
	 * // 호실 예약 처리
	 * 
	 * @RequestMapping("/insertRoomBookingAction") public String
	 * insertRoomBookingAction(HttpServletRequest req, Model model) {
	 * logger.info("url -> insertRoomBookingAction");
	 * 
	 * service_custReserve.insertRoomBookingAction(req, model); return
	 * "mainweb/insertRoomBookingAction"; }
	 * 
	 * 
	 * //회원 예약 처리 페이지
	 * 
	 * @RequestMapping("/insertBooking") public String
	 * insertBooking(HttpServletRequest req, Model model) {
	 * logger.info("url -> insertBooking");
	 * 
	 * service.insertBooking(req, model); logger.info("url -> insertBooking2");
	 * 
	 * return "mainweb/insertBooking"; }
	 * 
	 */
   
   
   
   
   
   
   //결제수단 등록
   @RequestMapping("/insertPaymentInfo")
   public String insertPaymentInfo(HttpServletRequest req, Model model) {
      logger.info("url -> insertPaymentInfo");
      
      return "mainweb/mypage/insertPaymentInfo";
   }
   
   //회원 예약내역 확인
   @RequestMapping("/showBookingDetail")
   public String showBookingDetail(HttpServletRequest req, Model model) {
      logger.info("url -> showBookingDetail");
      
      service.getBookingDetail(req, model);
      
      //service_review.getReservationList(req, model);
      return "mainweb/mypage/showBookingDetail";
   }
   
   //예약 취소
   @RequestMapping("/deleteBooking")
   public String deleteBooking(HttpServletRequest req, Model model) {
      logger.info("url -> deleteBooking");
      
      service.deleteActionByUser(req, model);
      
      return "mainweb/mypage/deleteBooking";
   }


	// ------------------- 회원 결제 페이지 (호실 예약 & 결제) ------------------------
	//결제 정보 입력 화면
   @RequestMapping("/salePage")
	public String salePage(HttpServletRequest req, Model model) {
		logger.info("url -> salePage");
		
		// 예약 시간 확인 action
		service_custReserve.chkRoomTime(req, model);
		String chkScheNull = (String) req.getSession().getAttribute("chkScheNull");
		System.out.println("chkScheNull : " + chkScheNull);
		
		// 예약 불가능
		if(chkScheNull.equals("3")) {
			model.addAttribute("insertCnt", 3);
			req.getSession().removeAttribute("chkScheNull");
		} else {
			// 회원 예약 정보 받아오기
			service.getResInfo(req, model);
		}
		
		return "mainweb/sale/salePage";
	}

	// 결제 처리
	@RequestMapping("/sale_action")
	public String sale_action(HttpServletRequest req, Model model) {
		logger.info("url -> sale_action");

		// 호실 예약 처리
		service_custReserve.insertRoomBookingAction(req, model);
		
		// 결제정보 입력해서 insert
		service_sale.insertSaleInfo(req, model);
		
		// 결제가 모두 완료 후, 안드로이드에도 푸시알림을 보내기
		String tokenId="cGH5hy_cRR-oYpPU6A9Tg4:APA91bHtnPAM057GJU8DBqRGP3YfuAo_vCRq0tW3H-2tQkGPExL6_kI8B-LiZJo70tQ5gUatZ8jyvu1eU72tvdvcJRhjNtRvVtK1uQ_jxDF5LaJQNkHPMWTm1Y4nIYHJN4HKwfzhxACe";
        String title="[호실 예약완료건]";
        String content="예약완료건이 있습니다.";
        String res_room = req.getParameter("res_room");
        
        FcmUtil FcmUtil = new FcmUtil();
        FcmUtil.send_FCM(tokenId, title, res_room + " " + content);
		
		return "mainweb/sale/sale_action";
	}
	
	
	// ------------------- 회원 결제 페이지 (담당자 예약 & 결제) ------------------------
	@RequestMapping("/salePage_m")
	public String salePage_m(HttpServletRequest req, Model model) {
		logger.info("url -> salePage_m");
		
		// 회원 예약 정보 받아오기
		service.getResInfo_m(req, model);
		
		return "mainweb/sale/salePage_m";
	}

	// 결제 처리
	@RequestMapping("/sale_m_action")
	public String sale_m_action(HttpServletRequest req, Model model) {
		logger.info("url -> sale_m_action");

		// 담당자 예약 처리
		service.insertBooking(req, model);
		
		// 결제 처리
		service_sale.insertSaleInfo(req, model);
		
		// 결제가 모두 완료 후, 안드로이드에도 푸시알림을 보내기
		String tokenId="cGH5hy_cRR-oYpPU6A9Tg4:APA91bHtnPAM057GJU8DBqRGP3YfuAo_vCRq0tW3H-2tQkGPExL6_kI8B-LiZJo70tQ5gUatZ8jyvu1eU72tvdvcJRhjNtRvVtK1uQ_jxDF5LaJQNkHPMWTm1Y4nIYHJN4HKwfzhxACe";
        String title="[담당자 예약완료건]";
        String content="담당자 예약완료건이 있습니다.";
      
        FcmUtil FcmUtil = new FcmUtil();
        FcmUtil.send_FCM(tokenId, title, content);

		return "mainweb/sale/sale_m_action";
	}
	
	// 카카오페이
	@PostMapping("/sale/kakaoPay")              
    public String kakaoPay(HttpServletRequest req, Model model) {
    	logger.info("url -> kakaoPay");   
        
        return "redirect:" + service_sale.kakaoPayReady(req, model);
                   
    }
	
	@GetMapping("/kakaoPaySuccess")                  
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, HttpServletRequest req, Model model) {
    	logger.info("url -> kakaoPaySuccess");
        logger.info("pg_token : " + pg_token);
        
        model.addAttribute("info", service_sale.kakaoPayInfo(pg_token));

        // 카카오페이 정보 입력                         
        service_sale.insertSaleInfo(req, model);
              
     	return "mainweb/sale/sale_action";
                               
    }
	 
	@RequestMapping("/kakaoPayCancel")
	public String kakaoPayCancel(HttpServletRequest req, Model model) {
		logger.info("url ==> kakaoPayCancel");
        
     	return "mainweb/sale/kakaoPayCancel";
	}
	
	@RequestMapping("/kakaoPaySuccessFail")
	public String kakaoPaySuccessFail(HttpServletRequest req, Model model) {
		logger.info("url ==> kakaoPaySuccessFail");
        
     	return "mainweb/sale/kakaoPaySuccessFail";
	}
	
   
}
	
