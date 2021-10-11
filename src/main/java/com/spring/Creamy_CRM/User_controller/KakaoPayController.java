/*
 * 작성자 : 정지은

 * 작성일 : 2021.09.15
 * 프로젝트 실행 시 제일 첫 메인화면 - 고객 화면이 될 예정
 * 
*/
package com.spring.Creamy_CRM.User_controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.spring.Creamy_CRM.Host_controller.MainController;
import com.spring.Creamy_CRM.Host_service.EmployeeService;
import com.spring.Creamy_CRM.User_service.MainwebServiceImpl;
import com.spring.Creamy_CRM.User_service.SaleService;
import com.spring.Creamy_CRM.User_service.SaleServiceImpl;
import com.spring.Creamy_CRM.User_service.UserReservationServiceImpl;
import com.spring.Creamy_CRM.User_service.UserReviewServiceImpl;
import com.spring.Creamy_CRM.VO.EmployeeVO;
import com.spring.Creamy_CRM.VO.KakaoPayReadyVO;

import jdk.nashorn.internal.objects.annotations.Setter;
import lombok.extern.java.Log;

@Controller
public class KakaoPayController {
	/*
   private static final Logger logger = LoggerFactory.getLogger(KakaoPayController.class);
   
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
   
   @RequestMapping("/kakaoPay")
   public String kakaoPay(HttpServletRequest req, Model model) {
	   logger.info("url -> kakaoPay");
	   
	   return "mainweb/sale/kakaoPay";       
   }
  
   
   @GetMapping("/kakaoPay")
   public void kakaoPayGet() {
       
   }
   
   @PostMapping("/kakaoPay")
   public String kakaoPay() {
	   logger.info("kakaoPay post............................................");
       
       return "redirect:" + service_sale.kakaoPayReady();

   }
  
   @GetMapping("/kakaoPaySuccess")
   public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
	   logger.info("kakaoPaySuccess get............................................");
	   logger.info("kakaoPaySuccess pg_token : " + pg_token);
       
   }
   */
}
	
