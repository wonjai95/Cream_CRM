/*
 * 작성자 : 장현정
 * 작성일 : 2021-09-20 ~ 2021-09-20
 * 상품 관련 service
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.Creamy_CRM.Host_dao.ProductDAOImpl;
import com.spring.Creamy_CRM.VO.P_pgVO;
import com.spring.Creamy_CRM.VO.ProductGroupVO;
import com.spring.Creamy_CRM.VO.ProductVO;
import com.spring.Creamy_CRM.VO.RoomSettingVO;
import com.spring.Creamy_CRM.VO.S_tVO;
import com.spring.Creamy_CRM.VO.SaleVO;
import com.spring.Creamy_CRM.VO.StockVO;
import com.spring.Creamy_CRM.VO.TradeVO;
import com.spring.Creamy_CRM.VO.userVO;
import com.spring.Creamy_CRM.util.Page;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAOImpl dao;

	// 상품 목록 출력
	@Override
	public void printProducts(HttpServletRequest req, Model model) {
		System.out.println("service ==> printProducts");
		List<ProductVO> list = new ArrayList<ProductVO>();

		list = dao.printProducts();

		System.out.println("dto2 : " + list);
		req.setAttribute("dto2", list); // 상품 정보 넘겨주기

	}

	// 판매 내역 출력
	@Override
	public void getSaleInfo(HttpServletRequest req, Model model) {
		System.out.println("service ==> getSaleInfo");
		List<SaleVO> list = new ArrayList<SaleVO>();

		String user_code = req.getParameter("user_code");
		System.out.println("user_code : " + user_code);

		list = dao.getSaleInfo(user_code);

		System.out.println("dto : " + list);
		req.setAttribute("dto", list); // 상품 정보 넘겨주기

	}

	// 상품
	@Override
	public void product(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		ProductVO vo = new ProductVO();
		vo.setHost_code(host_code);
		//상품그룹 목록
		List<ProductGroupVO> productGroupList = dao.selectProductGroupList(host_code);
		//상품 목록
		List<ProductVO> productList = dao.selectProductList(vo);
			
		model.addAttribute("productGroupList", productGroupList);
		model.addAttribute("productList", productList);
	}

	//그룹명 중복 확인
	@Override
	public int chkGroupName(HttpServletRequest req, Model model) {
		String host_code = (String)req.getSession().getAttribute("code");
		String product_group_name = req.getParameter("product_group_name");
		String product_group_code = req.getParameter("product_group_code");
		
		int validationChk = 0;
		if(product_group_code != null) {
			ProductGroupVO vo = new ProductGroupVO();
			vo.setProduct_group_code(product_group_code);
			vo = dao.getProductGroup(vo);
			
			if(vo.getProduct_group_name().equals(product_group_name)) {
				validationChk = 1;
			}
			
		}
		
		int selectCnt = 0;
		if(product_group_code == null || validationChk == 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("host_code", host_code);
			map.put("product_group_name", product_group_name);
			selectCnt = dao.chkProductGroupName(map);
		}
		
		return selectCnt;
	}

	// 상품그룹 등록
	@Override
	public ProductGroupVO addProductGroupAction(HttpServletRequest req, Model model) {
		String product_group_name = req.getParameter("product_group_name");
		String host_code = (String) req.getSession().getAttribute("code");
		
		ProductGroupVO vo = new ProductGroupVO();
		vo.setProduct_group_name(product_group_name);
		vo.setPg_indate(new Date(System.currentTimeMillis()));
		vo.setHost_code(host_code);
		
		int insertCnt = dao.insertProductGroup(vo);
		System.out.println(insertCnt);
		if(insertCnt != 1) {
			vo = null;
		}else {
			vo = dao.getProductGroup(vo);
		}
		return vo;	
	}

	// 상품그룹 상세
	@Override
	public void detailProductGroup(HttpServletRequest req, Model model) {
		String product_group_code = req.getParameter("product_group_code");
		ProductGroupVO vo = new ProductGroupVO();
		vo.setProduct_group_code(product_group_code);
		vo = dao.getProductGroup(vo);
		model.addAttribute("vo", vo);
	}

	// 상품그룹 수정
	@Override
	public ProductGroupVO modifyProductGroupAction(HttpServletRequest req, Model model) {
		String product_group_code = req.getParameter("product_group_code");
		String product_group_name = req.getParameter("product_group_name");
		
		ProductGroupVO vo = new ProductGroupVO();
		vo.setProduct_group_code(product_group_code);
		vo.setProduct_group_name(product_group_name);
		int updateCnt = dao.updateProductGroup(vo);
		
		if(updateCnt == 1) {
			vo = dao.getProductGroup(vo);
		}else {
			vo = null;
		}
		
		return vo;
	}

	// 상품 그룹 삭제
	@Override
	public int deleteProductGroupAction(HttpServletRequest req, Model model) {
		String product_group_code = req.getParameter("product_group_code");
		return dao.deleteProductGroup(product_group_code);
	}

	/*********************상품**************************************************/
	// 상품 등록 페이지 요청 (상품그룹 데이터)
	@Override
	public void addProduct(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		List<ProductGroupVO> list = dao.getProductGroupList(host_code);
		model.addAttribute("list", list);
	}

	// 상품등록
	@Override
	public void addProductAction(MultipartHttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		String product_name = req.getParameter("product_name");
		String product_typeOfSales = req.getParameter("product_typeOfSales");
		String product_price = req.getParameter("product_price");
		String product_rentalPeriod = req.getParameter("product_rentalPeriod");
		String product_status = req.getParameter("product_status");
		String product_content = req.getParameter("product_content");
		String product_group_code = req.getParameter("product_group_code");
		MultipartFile file = req.getFile("product_img");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product_name", product_name);
		map.put("host_code", host_code);
		int selectCnt = dao.chkProductName(map);
		ProductVO vo = null;

		if (selectCnt != 1) {
			vo = new ProductVO();
			if (file.getOriginalFilename().equals("") || file.getOriginalFilename() == null) {
				vo.setProduct_img("null");
			} else {
				vo.setProduct_img(file.getOriginalFilename());
			}

			if (product_typeOfSales.equals("서비스")) {
				vo.setProduct_rentalPeriod(0);
			} else {
				vo.setProduct_rentalPeriod(Integer.parseInt(product_rentalPeriod));
			}
			vo.setProduct_name(product_name);
			vo.setProduct_typeOfSales(product_typeOfSales);
			vo.setProduct_price(Integer.parseInt(product_price));
			vo.setProduct_indate(new Date(System.currentTimeMillis()));
			vo.setProduct_status(product_status);
			vo.setProduct_content(product_content);
			vo.setProduct_group_code(product_group_code);
			int insertCnt = dao.insertProduct(vo);

			if (insertCnt == 1) {
				if (file.getOriginalFilename().equals("") || file.getOriginalFilename() == null) {
					System.out.println("파일 이미지 선택 안함");
				} else {
					System.out.println(file.getOriginalFilename());
					String saveDir = req.getSession().getServletContext()
							.getRealPath("/resources/images/productImage/");
					System.out.println(saveDir);
					// ↓ 경로조심 자신 프로젝트 경로
					String realDir = "D:\\Dev88\\workspace\\Creamy\\src\\main\\webapp\\resources\\images\\productImage\\";
					try {
						file.transferTo(new File(saveDir + file.getOriginalFilename()));
						FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
						FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

						int i = 0;
						while ((i = fis.read()) != -1) {
							fos.write(i);
						}
						fis.close();
						fos.close();
					} catch (IOException e) {
						e.printStackTrace();
						System.out.println(e.getMessage());
					}
				}
			}
			model.addAttribute("insertCnt", insertCnt);
		} else {
			model.addAttribute("selectCnt", selectCnt);
			return;
		}

	}

	// 상품상세(수정)
	@Override
	public void detailProduct(HttpServletRequest req, Model model) {
		String product_code = req.getParameter("product_code");
		String host_code = (String) req.getSession().getAttribute("code");
		List<ProductGroupVO> list = dao.getProductGroupList(host_code);
		ProductVO vo = dao.getProduct(product_code);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
	}

	// 상품수정
	@Override
	public void modifyProductAction(MultipartHttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		String product_code = req.getParameter("product_code");
		String product_name = req.getParameter("product_name");
		String product_typeOfSales = req.getParameter("product_typeOfSales");
		String product_price = req.getParameter("product_price");
		String product_rentalPeriod = req.getParameter("product_rentalPeriod");
		String product_status = req.getParameter("product_status");
		String product_content = req.getParameter("product_content");
		String product_group_code = req.getParameter("product_group_code");
		MultipartFile file = req.getFile("product_img");
		ProductVO vo = new ProductVO();

		int selectCnt = 0;
		ProductVO getVo = dao.getProduct(product_code);
		if (!product_name.equals(getVo.getProduct_name())) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("product_name", product_name);
			map.put("host_code", host_code);
			selectCnt = dao.chkProductName(map);
		}

		if (selectCnt != 1) {
			if (file.getOriginalFilename().equals("") || file.getOriginalFilename() == null) {
				String hiddenImg = req.getParameter("hiddenImg");
				vo.setProduct_img(hiddenImg);
			} else {
				vo.setProduct_img(file.getOriginalFilename());
			}
			if (product_typeOfSales.equals("서비스")) {
				vo.setProduct_rentalPeriod(0);
			} else {
				vo.setProduct_rentalPeriod(Integer.parseInt(product_rentalPeriod));
			}

			vo.setProduct_code(product_code);
			vo.setProduct_name(product_name);
			vo.setProduct_typeOfSales(product_typeOfSales);
			vo.setProduct_price(Integer.parseInt(product_price));
			vo.setProduct_indate(new Date(System.currentTimeMillis()));
			vo.setProduct_status(product_status);
			vo.setProduct_content(product_content);
			vo.setProduct_group_code(product_group_code);

			int updateCnt = dao.updateProduct(vo);
			if (updateCnt == 1) {
				if (file.getOriginalFilename().equals("") || file.getOriginalFilename() == null) {
					System.out.println("사진선택안함(기존사진 선택)");
				} else {
					String saveDir = req.getSession().getServletContext()
							.getRealPath("/resources/images/productImage/");
					// ↓ 경로조심 자신 프로젝트 경로
					String realDir = "D:\\Dev88\\workspace\\Creamy\\src\\main\\webapp\\resources\\images\\productImage\\";
					try {
						file.transferTo(new File(saveDir + file.getOriginalFilename()));
						FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
						FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

						int i = 0;
						while ((i = fis.read()) != -1) {
							fos.write(i);
						}
						vo.setProduct_img(file.getOriginalFilename());
						fis.close();
						fos.close();
					} catch (IOException e) {
						e.printStackTrace();
						System.out.println(e.getMessage());
					}
				}
			}
			model.addAttribute("updateCnt", updateCnt);
		} else {
			model.addAttribute("selectCnt", selectCnt);
			return;
		}
	}

	// 상품 삭제
	@Override
	public void deleteProductAction(HttpServletRequest req, Model model) {
		String product_code = req.getParameter("product_code");
		ProductVO vo = dao.getProduct(product_code);
		if (vo != null) {
			int deleteCnt = dao.deleteProduct(product_code);
			model.addAttribute("deleteCnt", deleteCnt);
		}
		model.addAttribute("vo", vo);
	}

	// 거래처 등록
	@Override
	public void addTradeAction(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		String trade_name = req.getParameter("trade_name");
		TradeVO vo = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("host_code", host_code);
		map.put("trade_name", trade_name);
		int selectCnt = dao.chkTradeName(map);
		
		if (selectCnt != 1) {
			vo = new TradeVO();
			vo.setTrade_name(trade_name);
			vo.setTrade_indate(new Date(System.currentTimeMillis()));
			vo.setHost_code(host_code);
			int insertCnt = dao.insertTrade(vo);
			model.addAttribute("insertCnt", insertCnt);
		}
		model.addAttribute("selectCnt", selectCnt);
	}

	// 거래처 상세 (수정)
	@Override
	public void detailTrade(HttpServletRequest req, Model model) {
		String trade_code = req.getParameter("trade_code");
		TradeVO vo = dao.getTrade(trade_code);
		model.addAttribute("vo", vo);
	}

	// 거래처 수정
	@Override
	public void modifyTradeAction(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		String trade_code = req.getParameter("trade_code");
		String trade_name = req.getParameter("trade_name");
		TradeVO vo = dao.getTrade(trade_code);
		Map<String, Object> map = new HashMap<String, Object>();
		int selectCnt = 0;
		if (!trade_name.equals(vo.getTrade_name())) {
			map.put("host_code", host_code);
			map.put("trade_name", trade_name);
			selectCnt = dao.chkTradeName(map);
			map.clear();
		}

		if (selectCnt != 1) {
			map.put("trade_code", trade_code);
			map.put("trade_name", trade_name);
			int updateCnt = dao.updateTrade(map);
			model.addAttribute("updateCnt", updateCnt);
		}

		model.addAttribute("selectCnt", selectCnt);
	}

	// 거래처 삭제
	@Override
	public void deleteTradeAction(HttpServletRequest req, Model model) {
		String trade_code = req.getParameter("trade_code");
		TradeVO vo = dao.getTrade(trade_code);
		if (vo != null) {
			int deleteCnt = dao.deleteTrade(trade_code);
			model.addAttribute("deleteCnt", deleteCnt);
		}
		model.addAttribute("vo", vo);
	}

	// 재고 페이지 요청 (거래처 목록)
	@Override
	public void addStock(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		List<TradeVO> list = dao.getTradeList(host_code);
		model.addAttribute("list", list);
	}

	// 재고 등록
	@Override
	public void addStockAction(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		String stock_name = req.getParameter("stock_name");
		String stock_price = req.getParameter("stock_price");
		String stock_brand = req.getParameter("stock_brand");
		String stock_count = req.getParameter("stock_count");
		String stock_status = req.getParameter("stock_status");
		String trade_code = req.getParameter("trade_code");
		StockVO vo = new StockVO();
		vo.setStock_name(stock_name);
		vo.setStock_price(Integer.parseInt(stock_price));
		vo.setStock_brand(stock_brand);
		vo.setStock_cnt(Integer.parseInt(stock_count));
		vo.setStock_status(stock_status);
		vo.setTrade_code(trade_code);
		vo.setStock_indate(new Date(System.currentTimeMillis()));

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("host_code", host_code);
		map.put("stock_name", stock_name);
		int selectCnt = dao.chkStockName(map);
		
		if (selectCnt != 1) {
			int insertCnt = dao.insertStock(vo);
			model.addAttribute("insertCnt", insertCnt);
		}
		model.addAttribute("selectCnt", selectCnt);
	}

	// 재고 상세(수정)
	@Override
	public void detailStock(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		String stock_code = req.getParameter("stock_code");
		StockVO vo = dao.getStock(stock_code);
		List<TradeVO> list = dao.getTradeList(host_code);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
	}

	// 재고 수정
	@Override
	public void modifyStockAction(HttpServletRequest req, Model model) {
		String stock_code = req.getParameter("stock_code");
		String stock_name = req.getParameter("stock_name");
		String stock_price = req.getParameter("stock_price");
		String stock_count = req.getParameter("stock_count");
		String stock_brand = req.getParameter("stock_brand");
		String stock_status = req.getParameter("stock_status");
		String trade_code = req.getParameter("trade_code");
		StockVO vo = null;
		StockVO getVo = dao.getStock(stock_code);
		int selectCnt = 0;
		if (!stock_name.equals(getVo.getStock_name())) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("host_code", "host_code");
			map.put("stock_name", "stock_name");
			selectCnt = dao.chkStockName(map);
		}
		
		if (selectCnt != 1) {
			vo = new StockVO();
			vo.setStock_code(stock_code);
			vo.setStock_name(stock_name);
			vo.setStock_price(Integer.parseInt(stock_price));
			vo.setStock_cnt(Integer.parseInt(stock_count));
			vo.setStock_brand(stock_brand);
			vo.setStock_status(stock_status);
			vo.setTrade_code(trade_code);
			int updateCnt = dao.updateStock(vo);
			model.addAttribute("updateCnt", updateCnt);
		}
		model.addAttribute("selectCnt", selectCnt);
	}

	// 재고 삭제
	@Override
	public void deleteStockAction(HttpServletRequest req, Model model) {
		String stock_code = req.getParameter("stock_code");
		StockVO vo = dao.getStock(stock_code);
		if (vo != null) {
			int deleteCnt = dao.deleteStock(stock_code);
			model.addAttribute("deleteCnt", deleteCnt);
		}
		model.addAttribute("vo", vo);
	}

	
	/*ajax*/
	@Override
	public List<ProductVO> ajax_getProductByCode(HttpServletRequest req, Model model) {
		String product_group_code = req.getParameter("code");
		return dao.ajax_getProductByCode(product_group_code);
	}
	

	// 결제 정보 insert
	@Override
	public void addSaleInfo(HttpServletRequest req, Model model) {
		
		String host_code = (String) req.getSession().getAttribute("code");
		System.out.println("host_code : " + host_code);
		
		System.out.println("service ==> addSaleInfo");
		
		int total_payment = Integer.parseInt(req.getParameter("product_price_hidden"));
		System.out.println("total_payment : " + total_payment);
		String payment_option = req.getParameter("payment_option_hidden");
		System.out.println("payment_option  : " + payment_option);
		String credit_select = req.getParameter("credit_select");
		System.out.println("credit_select : " + credit_select);
		String credit_installment = req.getParameter("credit_installment");
		System.out.println("credit_installment : " + credit_installment);
		String sale_date = req.getParameter("sale_date");
		
		String sale_memo = req.getParameter("sale_memo");
		
		String user_code = req.getParameter("user_code");
		String employee_code = req.getParameter("employee_name");
		String product_code = req.getParameter("product_code");
		System.out.println("product_code : " + product_code);
		userVO vo = new userVO();
		vo.setTotal_payment(total_payment);
		vo.setPayment_option(payment_option);
		vo.setCredit_select(credit_select);
		vo.setCredit_installment(credit_installment);
		Date sDate = Date.valueOf(sale_date);
		vo.setSale_date(sDate);
		vo.setSale_memo(sale_memo);
		vo.setEmployee_code(employee_code);
		
		vo.setUser_code(user_code);
		vo.setProduct_code(product_code);
		
		int insertCnt = dao.addSaleInfo(vo);
		
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("dto", vo);
		
	}


}
