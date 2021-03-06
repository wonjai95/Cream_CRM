/*
 * CRM - 상품 페이지 controller
 * 
 * 
*/
package com.spring.Creamy_CRM.Host_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.Creamy_CRM.Host_service.CRMuserService;
import com.spring.Creamy_CRM.Host_service.EmployeeService;
import com.spring.Creamy_CRM.Host_service.ProductService;

import com.spring.Creamy_CRM.VO.ProductGroupVO;
import com.spring.Creamy_CRM.VO.ProductVO;
import com.spring.Creamy_CRM.VO.userVO;


@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	ProductService service;
	
	@Autowired
	CRMuserService service_user;

 
	@ResponseBody
	@RequestMapping("/host/dddd")
	public List<ProductVO> dddd(HttpServletRequest req, Model model) {
		logger.info("url -> dddd");
		List<ProductVO> list = service.ajax_getProductByCode(req, model);
		for (int i = 0; i < list.size(); i++) {
			ProductVO vo = list.get(i);
			System.out.println(vo.getProduct_name());
		}
		return list;
	}

	@Autowired
	EmployeeService service_emp;

	
	// 상품관련요청
	@RequestMapping("/host/product")
	public String product(HttpServletRequest req, Model model) {
		logger.info("url -> product");
		service.product(req, model);
		return "host/product/product";
	}

	// 상품 그룹 페이지요청
	@RequestMapping("/host/addProductGroup")
	public String addProductGroup(HttpServletRequest req, Model model) {
		logger.info("url -> addProductGroup");
		return "host/product/addProductGroup";
	}

	// 상품 그룹 등록
	@ResponseBody
	@RequestMapping("/host/addProductGroupAction")
	public ProductGroupVO addProductGroupAction(HttpServletRequest req, Model model) {
		logger.info("url -> addProductGroupAction");
		return service.addProductGroupAction(req, model);
	}
	
	//상품 그룹 이름 중복확인
	@ResponseBody
	@RequestMapping("/host/chkGroupName")
	public int chkGroupName(HttpServletRequest req, Model model) {
		logger.info("url -> chkGroupName");
		return service.chkGroupName(req, model);
	}
	
	// 상품 그룹 수정 페이지요청
	@RequestMapping("/host/detailProductGroup")
	public String detailProductGroup(HttpServletRequest req, Model model) {
		logger.info("url -> detailProductGroup");
		service.detailProductGroup(req, model);
		return "host/product/detailProductGroup";
	}

	// 상품 그룹 수정
	@ResponseBody
	@RequestMapping("/host/modifyProductGroupAction")
	public ProductGroupVO modifyProductGroupAction(HttpServletRequest req, Model model) {
		logger.info("url -> modifyProductGroupAction");
		return service.modifyProductGroupAction(req, model);
	}

	// 상품 그룹 삭제
	@ResponseBody
	@RequestMapping("/host/deleteProductGroupAction")
	public int deleteProductGroupAction(HttpServletRequest req, Model model) {
		logger.info("url -> deleteProductGroupAction");
		return service.deleteProductGroupAction(req, model);
	}

	// 상품등록 페이지요청
	@RequestMapping("/host/addProduct")
	public String addProduct(HttpServletRequest req, Model model) {
		logger.info("url -> addProduct");
		service.addProduct(req, model);
		return "host/product/addProduct";
	}
	
	//상품명 중복확인
	@ResponseBody
	@RequestMapping("/host/chkProductName")
	public int chkProductName(HttpServletRequest req, Model model) {
		logger.info("url -> chkProductName");
		return service.chkProductName(req, model);
	}

	// 상품등록
	@ResponseBody
	@RequestMapping("/host/addProductAction")
	public ProductVO addProductAction(MultipartHttpServletRequest req, Model model) {
		logger.info("url -> addProductAction");
		return service.addProductAction(req, model);
	}

	// 상품상세(수정)
	@RequestMapping("/host/detailProduct")
	public String detailProduct(HttpServletRequest req, Model model) {
		logger.info("url -> detailProduct");
		service.detailProduct(req, model);
		return "host/product/detailProduct";
	}

	// 상품수정
	@ResponseBody
	@RequestMapping("/host/modifyProductAction")
	public ProductVO modifyProductAction(MultipartHttpServletRequest req, Model model) {
		logger.info("url -> modifyProductAction");
		return service.modifyProductAction(req, model);
	}

	// 상품삭제
	@ResponseBody
	@RequestMapping("/host/deleteProductAction")
	public int deleteProductAction(HttpServletRequest req, Model model) {
		logger.info("url -> deleteProductAction");
		return service.deleteProductAction(req, model);
	}
	
	//상품 검색
	@ResponseBody
	@RequestMapping("/host/selectProductByQuery")
	public List<ProductVO> selectProductByQuery(HttpServletRequest req, Model model) {
		logger.info("url -> selectProductByQuery");
		return service.selectProductByQuery(req, model);
	}
	

	// 거래처 추가 페이지요청
	@RequestMapping("/host/addTrade")
	public String addTrade(HttpServletRequest req, Model model) {
		logger.info("url -> addTrade");
		return "host/product/addTrade";
	}

	// 거래처 추가 페이지요청
	@RequestMapping("/host/addTradeAction")
	public String addTradeAction(HttpServletRequest req, Model model) {
		logger.info("url -> addTradeAction");
		service.addTradeAction(req, model);
		return "host/product/addTradeAction";
	}

	// 거래처 상세(수정)
	@RequestMapping("/host/detailTrade")
	public String detailTrade(HttpServletRequest req, Model model) {
		logger.info("url -> detailTrade");
		service.detailTrade(req, model);
		return "host/product/detailTrade";
	}

	// 거래처 수정
	@RequestMapping("/host/modifyTradeAction")
	public String modifyTradeAction(HttpServletRequest req, Model model) {
		logger.info("url -> modifyTradeAction");
		service.modifyTradeAction(req, model);
		return "host/product/modifyTradeAction";
	}

	// 거래처 삭제
	@RequestMapping("/host/deleteTradeAction")
	public String deleteTradeAction(HttpServletRequest req, Model model) {
		logger.info("url -> deleteTradeAction");
		service.deleteTradeAction(req, model);
		return "host/product/deleteTradeAction";
	}

	// 재고 추가 페이지요청
	@RequestMapping("/host/addStock")
	public String addStock(HttpServletRequest req, Model model) {
		logger.info("url -> addStock");
		service.addStock(req, model);
		return "host/product/addStock";
	}

	// 재고 추가
	@RequestMapping("/host/addStockAction")
	public String addStockAction(HttpServletRequest req, Model model) {
		logger.info("url -> addStockAction");
		service.addStockAction(req, model);
		return "host/product/addStockAction";
	}

	// 재고 상세(수정)
	@RequestMapping("/host/detailStock")
	public String detailStock(HttpServletRequest req, Model model) {
		logger.info("url -> detailStock");
		service.detailStock(req, model);
		return "host/product/detailStock";
	}

	// 재고 수정
	@RequestMapping("/host/modifyStockAction")
	public String modifyStockAction(HttpServletRequest req, Model model) {
		logger.info("url -> modifyStockAction");
		service.modifyStockAction(req, model);
		return "host/product/modifyStockAction";
	}

	// 재고 삭제
	@RequestMapping("/host/deleteStockAction")
	public String deleteStockAction(HttpServletRequest req, Model model) {
		logger.info("url -> deleteStockAction");
		service.deleteStockAction(req, model);
		return "host/product/deleteStockAction";
	}

	// 판매 페이지      
	@RequestMapping("/host/product_selling")         
	public String product_selling(HttpServletRequest req, Model model) {
		logger.info("url -> product_selling");

		// 회원 정보 출력(이전 페이지에서 클릭한 회원 값 넘기기)
		service_user.getUserInfo(req, model);
		System.out.println("dto_user : " + req.getAttribute("dto"));
		model.addAttribute("dto_user", req.getAttribute("dto")); // 회원 정보 넘겨주기

		// 상품 목록 출력  
		service.printProducts(req, model);
		model.addAttribute("dto_product", req.getAttribute("dto2")); // 상품 정보 넘겨주기
		
		// 결제정보 입력창에서 직원(수납자) 정보 뿌리기
		service_emp.employeeList(req, model);
		
		return "host/product/product_selling";
	}
	
	// 판매 처리
	@RequestMapping("/host/selling_action")
	public String selling_action(HttpServletRequest req, Model model) {
		logger.info("url -> product_selling");
		
		// 결제 정보 insert
		service.addSaleInfo(req, model);
		
		return "host/product/selling_action";
	}    
	
	    
	

}
