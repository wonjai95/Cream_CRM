/*
 * 작성자 : 장현정
 * 작성일 : 2021-09-20 ~ 2021-09-20
 * 상품 관련 service interface
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.Creamy_CRM.VO.ProductGroupVO;
import com.spring.Creamy_CRM.VO.ProductVO;

public interface ProductService {

	// 상품 목록 출력
	public void printProducts(HttpServletRequest req, Model model);
	
	// 판매 내역 출력
	public void getSaleInfo(HttpServletRequest req, Model model);
	
	// 결제 정보 insert
	public void addSaleInfo(HttpServletRequest req, Model model);
	
	//상품
	void product(HttpServletRequest req, Model model);
	//상품그룹 등록
	void addProductGroupAction(HttpServletRequest req, Model model);
	//상품그룹 상세(수정)
	void detailProductGroup(HttpServletRequest req, Model model);
	//상품그룹 수정
	void modifyProductGroupAction(HttpServletRequest req, Model model);
	//상품그룹 삭제
	void deleteProductGroupAction(HttpServletRequest req, Model model);
	
	//상품 등록 페이지 요청 (상품그룹 데이터)
	void addProduct(HttpServletRequest req, Model model);
	//상품등록
	void addProductAction(MultipartHttpServletRequest req, Model model);
	//상품상세(수정)
	void detailProduct(HttpServletRequest req, Model model);
	//상품수정
	void modifyProductAction(MultipartHttpServletRequest req, Model model);
	//상품삭제
	void deleteProductAction(HttpServletRequest req, Model model);
	
	//거래처 등록
	void addTradeAction(HttpServletRequest req, Model model);
	//거래처 상세(수정)
	void detailTrade(HttpServletRequest req, Model model);
	//거래처 수정
	void modifyTradeAction(HttpServletRequest req, Model model);
	//거래처 삭제
	void deleteTradeAction(HttpServletRequest req, Model model);

	//재고 등록 페이지 요청(거래처 목록)
	void addStock(HttpServletRequest req, Model model);
	//재고 등록
	void addStockAction(HttpServletRequest req, Model model);
	//재고 상세(수정)
	void detailStock(HttpServletRequest req, Model model);
	//재고 상세(수정)
	void modifyStockAction(HttpServletRequest req, Model model);
	//재고 삭제
	void deleteStockAction(HttpServletRequest req, Model model);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*ajax*/
	List<ProductVO> ajax_getProductByCode(HttpServletRequest req, Model model);
	
}
