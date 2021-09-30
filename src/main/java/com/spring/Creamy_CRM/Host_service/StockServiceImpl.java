package com.spring.Creamy_CRM.Host_service;

import java.sql.Date;
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

	// 재고실사 등록 처리
	@Override
	public void add_periodic_inven(HttpServletRequest req, Model model) {
		int indiv_inven_cnt = Integer.parseInt(req.getParameter("indiv_inven_cnt"));
		String stock_code = req.getParameter("stock_code");
		Date inven_date = new Date(System.currentTimeMillis());
		
		StockVO vo = new StockVO();
		vo.setIndiv_inven_cnt(indiv_inven_cnt);
		vo.setStock_code(stock_code);
		vo.setInven_date(inven_date);
		
		int insertCnt = dao.insertPeriodicInven(vo);
		System.out.println("insertCnt : " + insertCnt);
		
		model.addAttribute("insertCnt", insertCnt);
	}

	// 재고 실사 검색
	@Override
	public void search_periodic_inven(HttpServletRequest req, Model model) {
		String keyword = req.getParameter("keyword");
		String inven_date = req.getParameter("inven_date");
		String host_code = (String) req.getSession().getAttribute("code");
		System.out.println("keyword : " + keyword);
		System.out.println("inven_date : " + inven_date);

		// 검색 뷰 생성을 위한 sql문
		String sql = "CREATE OR REPLACE VIEW searchPeriodicInven_view " + 
						"AS " + 
						"SELECT s.stock_name, pi.* " + 
						"  FROM stock_tbl s " + 
						"  JOIN trade_tbl t " + 
						"    ON s.trade_code = t.trade_code " + 
						"  JOIN periodic_inventory pi " + 
						"    ON pi.stock_code = s.stock_code " + 
						" WHERE t.host_code = '" + host_code + "' " +
						"   AND s.stock_status = '사용중'";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("inven_date", inven_date);
		map.put("sql", sql);
		
		List<StockVO> dtos = dao.searchPeriodicInven(map);
		System.out.println("dtos : " + dtos.size());
		model.addAttribute("dtos", dtos);
		
	}

	
	

}
