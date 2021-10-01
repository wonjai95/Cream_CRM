/*
 * 작성자 : 장현정
 * 작성일 : 2021-09-20 ~ 2021-09-20
 * 상품 관련 dao
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

import com.spring.Creamy_CRM.VO.P_pgVO;
import com.spring.Creamy_CRM.VO.ProductGroupVO;
import com.spring.Creamy_CRM.VO.ProductVO;
import com.spring.Creamy_CRM.VO.S_tVO;
import com.spring.Creamy_CRM.VO.SaleVO;
import com.spring.Creamy_CRM.VO.StockVO;
import com.spring.Creamy_CRM.VO.TradeVO;
import com.spring.Creamy_CRM.VO.userVO;

public interface ProductDAO {

	// 상품 정보 출력
	public List<ProductVO> printProducts();
	// 판매 내역 출력
	public List<SaleVO> getSaleInfo(String user_code);
	
	/**************************************************************/
	// 그룹 개수
	int productGroupCnt(String host_code);
	// 그룹 목록
	List<ProductGroupVO> selectProductGroupList(String host_code);
	// 상품 그룹 정보
	ProductGroupVO getProductGroup(ProductGroupVO vo);
	// 상품 그룹 수정
	int updateProductGroup(ProductGroupVO vo);
	// 상품 그룹 삭제
	int deleteProductGroup(String product_group_code);
	// 상품 그룹 리스트
	List<ProductGroupVO> getProductGroupList(String host_code);
	
	// 상품 개수
	int productCnt(String host_code);
	// 상품 목록
	List<ProductVO> selectProductList(ProductVO vo);
	
	// 상품그룹 등록
	int insertProductGroup(ProductGroupVO vo);
	// 상품그룹명 중복 확인
	int chkProductGroupName(Map<String, Object> map);
	// 상품명 중복 확인
	int chkProductName(Map<String, Object> map);
	// 상품 등록
	int insertProduct(ProductVO vo);
	// 상품 상세(수정)
	ProductVO getProduct(String product_code);
	// 상품코드로 상품 정보 가져오기
	public ProductVO getProductOne(String product_code);
	// 상품 수정
	int updateProduct(ProductVO vo);
	// 상품 삭제
	int deleteProduct(String product_code);
	/**************************************************************/
	
	// 거래처명 중복확인
	int chkTradeName(Map<String, Object> map);
	// 거래처 등록
	int insertTrade(TradeVO vo);
	// 거래처 개수
	int tradeCnt(String host_code);
	// 거래처 리스트(페이징)
	List<TradeVO> selectTradeList(Map<String, Object> map);
	// 거래처 상세(수정)
	TradeVO getTrade(String trade_code);
	// 거래처 수정
	int updateTrade(Map<String, Object> map);
	// 거래처 삭제
	int deleteTrade(String trade_code);

	
	// 재고추가 페이지(거래처리스트)
	List<TradeVO> getTradeList(String host_code);
	// 재고명 중복확인
	int chkStockName(Map<String, Object> map);
	// 재고 등록
	int insertStock(StockVO vo);
	// 재고 개수
	int stockCnt(String host_code);
	// 재고 리스트
	List<StockVO> selectStockList(Map<String, Object> map);
	// 재고 상세(수정)
	StockVO getStock(String stock_code);
	// 재고 수정
	int updateStock(StockVO vo);
	// 재고 삭제
	int deleteStock(String stock_code);

	
	//입출고 현황
	int stCnt(String host_code);
	// 입출고현황 페이징(재고+거래처)
	List<S_tVO> selectStList(Map<String, Object> map);
	
	
	/*ajax*/
	List<ProductVO> ajax_getProductByCode(String product_group_code);

	// 결제정보 등록
	public int addSaleInfo(userVO vo);


}
