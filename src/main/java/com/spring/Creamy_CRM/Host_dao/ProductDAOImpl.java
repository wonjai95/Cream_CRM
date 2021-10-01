/*
 * 작성자 : 장현정
 * 작성일 : 2021-09-21
 * 상품 관련 dao
 * 
*/
package com.spring.Creamy_CRM.Host_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Creamy_CRM.VO.P_pgVO;
import com.spring.Creamy_CRM.VO.ProductGroupVO;
import com.spring.Creamy_CRM.VO.ProductVO;
import com.spring.Creamy_CRM.VO.S_tVO;
import com.spring.Creamy_CRM.VO.SaleVO;
import com.spring.Creamy_CRM.VO.StockVO;
import com.spring.Creamy_CRM.VO.TradeVO;
import com.spring.Creamy_CRM.VO.userVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SqlSession sqlSession;

	// 상품 정보 출력
	@Override
	public List<ProductVO> printProducts() {

		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.productDAO.printProducts");
	}

	// 판매 내역 출력
	@Override
	public List<SaleVO> getSaleInfo(String user_code) {

		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.productDAO.getSaleInfo", user_code);
	}

	// 그룹 개수
	@Override
	public int productGroupCnt(String host_code) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.productGroupCnt", host_code);
	}

	// 상품 개수
	@Override
	public int productCnt(String host_code) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.productCnt", host_code);
	}

	// 상품 그룹 목록
	@Override
	public List<ProductGroupVO> selectProductGroupList(String host_code) {
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.productDAO.selectProductGroupList", host_code);
	}

	// 상품 목록
	@Override
	public List<ProductVO> selectProductList(ProductVO vo) {
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.productDAO.selectProductList", vo);
	}

	// 상품그룹명 중복 확인
	@Override
	public int chkProductGroupName(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.chkProductGroupName",map);
	}

	// 상품그룹 등록
	@Override
	public int insertProductGroup(ProductGroupVO vo) {
		return sqlSession.insert("com.spring.Creamy_CRM.Host_dao.productDAO.insertProductGroup", vo);
	}

	// 상품 그룹 리스트
	@Override
	public List<ProductGroupVO> getProductGroupList(String host_code) {
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.productDAO.getProductGroupList",host_code);
	}

	// 상품 등록
	@Override
	public int insertProduct(ProductVO vo) {
		return sqlSession.insert("com.spring.Creamy_CRM.Host_dao.productDAO.insertProduct", vo);
	}

	// 상품 그룹 정보
	@Override
	public ProductGroupVO getProductGroup(ProductGroupVO vo) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.getProductGroup", vo);
	}

	// 상품 그룹 수정
	@Override
	public int updateProductGroup(ProductGroupVO vo) {
		return sqlSession.update("com.spring.Creamy_CRM.Host_dao.productDAO.updateProductGroup", vo);
	}

	// 상품 그룹 삭제
	@Override
	public int deleteProductGroup(String product_group_code) {
		return sqlSession.delete("com.spring.Creamy_CRM.Host_dao.productDAO.deleteProductGroup", product_group_code);
	}

	// 상품 상세(수정)
	@Override
	public ProductVO getProduct(String product_code) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.getProduct", product_code);
	}
	
	// 상품코드로 상품 정보 가져오기
	@Override
   public ProductVO getProductOne(String product_code) {
      return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.getProductOne", product_code);
   }

	// 상품 수정
	@Override
	public int updateProduct(ProductVO vo) {
		return sqlSession.update("com.spring.Creamy_CRM.Host_dao.productDAO.updateProduct", vo);
	}

	// 상품명 중복확인
	@Override
	public int chkProductName(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.chkProductName", map);
	}

	// 상품 삭제
	@Override
	public int deleteProduct(String product_code) {
		return sqlSession.delete("com.spring.Creamy_CRM.Host_dao.productDAO.deleteProduct", product_code);
	}

	// 거래처명 중복 확인
	@Override
	public int chkTradeName(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.chkTradeName", map);
	}

	// 거래처등록
	@Override
	public int insertTrade(TradeVO vo) {
		return sqlSession.insert("com.spring.Creamy_CRM.Host_dao.productDAO.insertTrade", vo);
	}

	// 거래처 개수
	@Override
	public int tradeCnt(String host_code) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.tradeCnt",host_code);
	}

	// 거래처 리스트
	@Override
	public List<TradeVO> selectTradeList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.productDAO.selectTradeList", map);
	}

	// 거래처 상세(수정)
	@Override
	public TradeVO getTrade(String trade_code) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.getTrade", trade_code);
	}

	// 거래처 수정
	@Override
	public int updateTrade(Map<String, Object> map) {
		return sqlSession.update("com.spring.Creamy_CRM.Host_dao.productDAO.updateTrade", map);
	}

	// 거래처 삭제
	@Override
	public int deleteTrade(String trade_code) {
		return sqlSession.delete("com.spring.Creamy_CRM.Host_dao.productDAO.deleteTrade", trade_code);
	}

	// 재고추가 페이지(거래처리스트)
	@Override
	public List<TradeVO> getTradeList(String host_code) {
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.productDAO.getTradeList",host_code);
	}

	// 재고명 중복확인
	@Override
	public int chkStockName(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.chkStockName", map);
	}

	// 재고 등록
	@Override
	public int insertStock(StockVO vo) {
		return sqlSession.insert("com.spring.Creamy_CRM.Host_dao.productDAO.insertStock", vo);
	}

	// 재고 개수
	@Override
	public int stockCnt(String host_code) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.stockCnt",host_code);
	}

	// 재고 리스트
	@Override
	public List<StockVO> selectStockList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.productDAO.selectStockList", map);
	}

	// 재고 상세 (수정)
	@Override
	public StockVO getStock(String stock_code) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.getStock", stock_code);
	}

	// 재고 수정
	@Override
	public int updateStock(StockVO vo) {
		return sqlSession.update("com.spring.Creamy_CRM.Host_dao.productDAO.updateStock", vo);
	}

	// 재고 삭제
	@Override
	public int deleteStock(String stock_code) {
		return sqlSession.delete("com.spring.Creamy_CRM.Host_dao.productDAO.deleteStock", stock_code);
	}


	
	//입출고 현황
	@Override
	public int stCnt(String host_code) {
		return sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.productDAO.stCnt", host_code);
	}
	// 입출고현황 페이징(재고+거래처)
	@Override
	public List<S_tVO> selectStList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.productDAO.selectStList", map);
	}

	/*ajax*/
	@Override
	public List<ProductVO> ajax_getProductByCode(String product_group_code) {
		return sqlSession.selectList("com.spring.Creamy_CRM.Host_dao.productDAO.ajax_getProductByCode", product_group_code);
	}

	// 결제정보 등록
	@Override
	public int addSaleInfo(userVO vo) {
		
		return sqlSession.insert("com.spring.Creamy_CRM.Host_dao.productDAO.addSaleInfo", vo);
	}

}
