package com.spring.Creamy_CRM.User_service;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.spring.Creamy_CRM.Host_dao.LoginDAOImpl;
import com.spring.Creamy_CRM.Host_dao.ProductDAO;
import com.spring.Creamy_CRM.Host_dao.ProductDAOImpl;
import com.spring.Creamy_CRM.User_dao.SaleDAO;
import com.spring.Creamy_CRM.User_dao.SaleDAOImpl;
import com.spring.Creamy_CRM.VO.KakaoPayApprovalVO;
import com.spring.Creamy_CRM.VO.KakaoPayReadyVO;
import com.spring.Creamy_CRM.VO.ReservationVO;
import com.spring.Creamy_CRM.VO.userVO;

import sun.net.www.ParseUtil;

@Service
public class SaleServiceImpl implements SaleService {

	@Autowired
	SaleDAOImpl dao;
	
	@Autowired
	ProductDAOImpl dao_pro;
	
	@Autowired
	LoginDAOImpl dao_login;
	
	private static final String HOST = "https://kapi.kakao.com";
	    
	private KakaoPayReadyVO kakaoPayReadyVO;
	
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	    
	
	Date today = new Date(0);
	
	
	// 회원 - 결제(결제 정보 insert)
	@Override
	public void insertSaleInfo(HttpServletRequest req, Model model) {
		System.out.println("service ==> insertSaleInfo");

		String user_id = (String) req.getSession().getAttribute("id");
		System.out.println("user_id : " + user_id);
		
		String user_code = dao_login.getUserInfo(user_id).getUser_code();
		
		int total_payment = Integer.parseInt(req.getParameter("total_payment"));
		System.out.println("total_payment : " + total_payment);
		String payment_option = req.getParameter("payment_option");
		System.out.println("payment_option  : " + payment_option);
		
		String credit_select = req.getParameter("credit_select");
		System.out.println("credit_select : " + credit_select);
		String credit_installment = req.getParameter("credit_installment");
		System.out.println("credit_installment : " + credit_installment);
		String sale_memo = req.getParameter("sale_memo");
		String employee_code = req.getParameter("employee_code");
		String product_code = req.getParameter("product_code");
		
		userVO vo = new userVO();
		vo.setTotal_payment(total_payment);
		vo.setPayment_option(payment_option);
		vo.setCredit_select(credit_select);
		vo.setCredit_installment(credit_installment);
		
		vo.setSale_date(today);
		vo.setSale_memo(sale_memo);
		vo.setEmployee_code(employee_code);
		
		vo.setUser_id(user_id);
		vo.setUser_code(user_code);
		vo.setProduct_code(product_code);
		
		int insertCnt = dao.insertSaleInfo(vo);
		
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("dto", vo);
		System.out.println("결제 insertCnt : " + insertCnt);
		
	}


	// 카카오페이 결제 - 결제 정보 받으려면 vo 추가하기
	@Override
	public String kakaoPayReady(HttpServletRequest req, Model model) {
		
		RestTemplate restTemplate = new RestTemplate();
		 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "408871ccae74749e2d6962d6c45fa347");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        System.out.println("total_payment : " + req.getParameter("total_payment"));
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "서비스 예약");
        params.add("partner_user_id", "Creamy_CRM");
        
        if(req.getParameter("comp_res").equals("호실")) {
        	params.add("item_name", req.getParameter("res_room"));
            params.add("item_code", req.getParameter("res_code"));
        } else {
        	params.add("item_name", req.getParameter("product_name"));
            params.add("item_code", req.getParameter("product_code"));
        }
        
        params.add("total_amount", req.getParameter("total_payment"));
        params.add("quantity", "1");
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost/Creamy_CRM/kakaoPaySuccess");    
        params.add("cancel_url", "http://localhost/Creamy_CRM/kakaoPayCancel");
        params.add("fail_url", "http://localhost/Creamy_CRM/kakaoPaySuccessFail");
 
        // header와 body 붙이기     
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
        	// RestTemplate 이용 카카오페이에 데이터 보내기
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);

            System.out.println("kakaopay..getNext_redirect_pc_url");
            System.out.println(kakaoPayReadyVO.getNext_redirect_pc_url());
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
            
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        model.addAttribute("comp_res", req.getParameter("comp_res"));
        model.addAttribute("total_payment", req.getParameter("total_payment"));
        model.addAttribute("product_name", req.getParameter("product_name"));
        
        
        return "/kakaoPaySuccess";
	}
	
	
	

	// 카카오페이 결제 - 결제 정보 받으려면 vo 추가하기
	@Override
	public String kakaoPayReady2(HttpServletRequest req, Model model) {
		
		RestTemplate restTemplate = new RestTemplate();
		 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "408871ccae74749e2d6962d6c45fa347");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        System.out.println("total_payment : " + req.getParameter("total_payment"));
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "호실 예약");
        params.add("partner_user_id", "Creamy_CRM");
        params.add("item_name", req.getParameter("res_name"));
        params.add("item_code", req.getParameter("res_code"));
        params.add("total_amount", req.getParameter("total_payment"));
        params.add("quantity", "1");
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost/Creamy_CRM/kakaoPaySuccess");    
        params.add("cancel_url", "http://localhost/Creamy_CRM/kakaoPayCancel");
        params.add("fail_url", "http://localhost/Creamy_CRM/kakaoPaySuccessFail");
 
        // header와 body 붙이기     
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
        	// RestTemplate 이용 카카오페이에 데이터 보내기
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);

            System.out.println("kakaopay..getNext_redirect_pc_url");
            System.out.println(kakaoPayReadyVO.getNext_redirect_pc_url());
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
            
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        model.addAttribute("total_payment", req.getParameter("total_payment"));
        model.addAttribute("res_room", req.getParameter("res_room"));
        
        return "/kakaoPaySuccess2";
	}
	
	
	// 카카오페이 결제 승인 내용
	@Override
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
		System.out.println("service ==> kakaoPayInfo"); 
		
        RestTemplate restTemplate = new RestTemplate();
        
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "408871ccae74749e2d6962d6c45fa347");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "서비스 예약");
        params.add("partner_user_id", "Creamy_CRM");
        params.add("payment_method_type", "Kakao Pay");
        params.add("pg_token", pg_token);
              
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            System.out.println("vo?" + kakaoPayApprovalVO);
            
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }

	// 카카오페이 결제 정보 입력
	@Override
	public void insertKakaoPay(HttpServletRequest req, Model model) {
		System.out.println("service ==> insertKakaoPay");
		
		KakaoPayApprovalVO vo = new KakaoPayApprovalVO();
		vo.setTid(kakaoPayReadyVO.getTid());
		vo.setCid("TC0ONETIME");
		
		int insertCnt = dao.insertKakaoPay(vo);
		
		model.addAttribute("insertCnt", insertCnt);
		
	}


}
