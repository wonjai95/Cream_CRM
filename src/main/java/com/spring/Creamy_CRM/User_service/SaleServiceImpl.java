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
import com.spring.Creamy_CRM.VO.userVO;

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


	// 카카오페이 결제
	@Override
	public String kakaoPayReady() {
		
		RestTemplate restTemplate = new RestTemplate();
		 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "a424cfe847491e516d2de1ca68efea92");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("item_name", "갤럭시S9");
        params.add("quantity", "1");
        params.add("total_amount", "2100");
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8080/Creamy_CRM/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8080/Creamy_CRM/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8080/Creamy_CRM/kakaoPaySuccessFail");
 
        // header와 body 붙이기
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
        	// RestTemplate 이용 카카오페이에 데이터 보내기
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
	}
	
	
	// 카카오페이 결제 승인 내용
	@Override
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
		 
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "a424cfe847491e516d2de1ca68efea92");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("pg_token", pg_token);
        params.add("total_amount", "2100");
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            System.out.println("" + kakaoPayApprovalVO);
          
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


}
