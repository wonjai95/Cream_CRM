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
import com.spring.Creamy_CRM.User_service.SaleService;
import com.spring.Creamy_CRM.User_service.UserReservationServiceImpl;
import com.spring.Creamy_CRM.User_service.UserReviewServiceImpl;
import com.spring.Creamy_CRM.VO.EmployeeVO;
import com.spring.Creamy_CRM.VO.KakaoPayReadyVO;

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
      
      String res_date = (String) req.getAttribute("selectDate");
      System.out.println("res_date : " + res_date);
      model.addAttribute("res_date", res_date);
      String room_setting_code = (String)req.getAttribute("room_setting_code");
      System.out.println("room_setting_code : " + room_setting_code);
      model.addAttribute("room_setting_code", room_setting_code);
      
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
		
		// 회원 예약 정보 받아오기
		service.getResInfo(req, model);
		
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

		return "mainweb/sale/sale_m_action";
	}


/*
	// 카카오페이 결제 
	@RequestMapping("/kakaoPay")
	public String kakaoPay() {
		logger.info("url -> kakaoPay");
		
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection serverConnection = (HttpURLConnection) address.openConnection();
			serverConnection.setRequestMethod("POST");
			serverConnection.setRequestProperty("Authorization", "KakaoAK a424cfe847491e516d2de1ca68efea92");
			serverConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			serverConnection.setDoOutput(true); // connection은 생성되면 기본적으로 input은 true, output은 기본적으로 default라서 따로 지정해줘야함.
			
			// 파라미터 심기
			String parameter = "cid=TC0ONETIME&"
								+ "partner_order_id=partner_order_id&"
								+ "partner_user_id=partner_user_id&"
								+ "item_name=초코파이&"
								+ "item_code=PRO302&"
								+ "quantity=1&"
								+ "total_amount=2200&"
								+ "vat_amount=200&"
								+ "tax_free_amount=0&"
								+ "approval_url=https://developers.kakao.com/success&"
								+ "fail_url=https://localhost/Creamy_CRM/payment/fail&"
								+ "cancel_url=https://localhost/Creamy_CRM/payment/cancel";
			
			// 파라미터 서버에 전달
			OutputStream outputStream = serverConnection.getOutputStream();
			DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
			dataOutputStream.writeBytes(parameter); // 주기 직전 손에 쥐고 있는 상태
			dataOutputStream.close(); // 자기가 가지고 있는 걸 비운다(flush) 실행할 수 있음
			
			int result = serverConnection.getResponseCode();
			
			InputStream inputStream;
			// 성공이면
			if(result == 200) { 
				inputStream = serverConnection.getInputStream();
			// 실패이면
			} else {
				inputStream = serverConnection.getErrorStream(); // 에러
			}
			
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream); // 받는 애를 읽는 애 생성
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader); // 형변환해서 읽음
			
			return bufferedReader.readLine();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "{\"result\":\"NO\"}";
	}
*/
	
	
	// 카카오페이
	@GetMapping("/kakaoPayGet")
    public void kakaoPayGet() {
		 logger.info("url -> kakaoPayGet");
    }
	
    @PostMapping("/sale/kakaoPay")
    public String kakaoPay() {
    	logger.info("url -> kakaoPay");   
        
        return "redirect:" + service_sale.kakaoPayReady();
 
    }
	
    @GetMapping("/sale/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
    	logger.info("url -> kakaoPaySuccess");
        logger.info("kakaoPaySuccess pg_token : " + pg_token);
        
        model.addAttribute("info", service_sale.kakaoPayInfo(pg_token));
        
    }
}
	
