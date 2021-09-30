package com.spring.Creamy_CRM.Host_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.ProductDAOImpl;
import com.spring.Creamy_CRM.Host_dao.StockDAOImpl;
import com.spring.Creamy_CRM.VO.StockVO;
import com.spring.Creamy_CRM.VO.TradeVO;
import com.spring.Creamy_CRM.util.Page;

@Service
public class StockServiceImpl implements StockService {
	
	@Autowired
	ProductDAOImpl pro_dao;
	
	@Autowired
	StockDAOImpl dao;
	
	
	// 재고관리 페이지 - 거래처관리와 재고관리
	@Override
	public void stock_manage(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		Map<String, Object> map = null;
		List<TradeVO> tradeList = null;
		List<StockVO> stockList = null;
		Page tradePage = new Page();
		Page stockPage = new Page();
		
		// 거래처 페이지
		tradePage.setCnt(pro_dao.tradeCnt(host_code));
		tradePage.setPageSize(10);
		tradePage.setPageBlock(5);
		tradePage.setCurrentPage(req.getParameter("pageNum"));

		if (tradePage.getCnt() > 0) {
			map = new HashMap<String, Object>();
			map.put("host_code", host_code);
			map.put("start", tradePage.getStart());
			map.put("end", tradePage.getEnd());
			tradeList = pro_dao.selectTradeList(map);
		}

		// 재고 페이지 
		stockPage.setCnt(pro_dao.stockCnt(host_code)); 
		stockPage.setPageSize(10);
		stockPage.setPageBlock(5);
		stockPage.setCurrentPage(req.getParameter("pageNum"));

		if (stockPage.getCnt() > 0) {
			map = new HashMap<String, Object>();
			map.put("host_code", host_code);
			map.put("start", stockPage.getStart());
			map.put("end", stockPage.getEnd());
			stockList = pro_dao.selectStockList(map);
		}
		
		model.addAttribute("stockList", stockList);
		model.addAttribute("tradeList", tradeList);
		
	}

	// 재고실사 페이지 
	@Override
	public void stock_inven(HttpServletRequest req, Model model) {
		String host_code = (String) req.getSession().getAttribute("code");
		System.out.println("host_code : " + host_code);
		
		List<StockVO> stockList = null;
		List<StockVO> invenList = null;
		
		stockList = dao.getInvenList(host_code);
		invenList = dao.getInvenLogList(host_code);
		
		model.addAttribute("dtos", stockList);
		model.addAttribute("dtos_inven", invenList);
	}
	
	
	

}
