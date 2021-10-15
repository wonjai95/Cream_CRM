/*
 * 작성자 : 이시현
 * 작성일 : 2021-10-01 ~ 2021-10-03
 * 통계 관련 service
 * 
*/
package com.spring.Creamy_CRM.Host_service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.CRMuserDAOImpl;
import com.spring.Creamy_CRM.Host_dao.StaticsDAOImpl;
import com.spring.Creamy_CRM.VO.StaticVO;
import com.spring.Creamy_CRM.VO.userVO;

@Service
public class StaticsServiceImpl implements StaticsService {

	@Autowired
	StaticsDAOImpl dao_statics;
	
	@Autowired
	CRMuserDAOImpl dao_user;
	
	// 성별 통계
	@Override
	public void static_gender_ratio(HttpServletRequest req, Model model) {
		System.out.println("static_gender_ratio 시작합니다");
		List<userVO> list = new ArrayList<userVO>();
		
		list = dao_user.printUsers();
		
		float f_count = 0;
		float m_count = 0;
		for(userVO vo : list) {
			if(vo.getUser_gender().equals("M"))
				m_count +=1;
			else if(vo.getUser_gender().equals("F"))
				f_count +=1;
		}
		
		System.out.println(m_count+"/"+f_count);
		
		float sumcount = list.size();
		
		float f_ratio = (f_count / sumcount) * 100;
		float m_ratio = (m_count / sumcount) * 100;
		
		System.out.println("총 인원 수 : " + sumcount);
		System.out.println("남자 : " + m_ratio);
		System.out.println("여자 : " + f_ratio);
		
		req.setAttribute("f_ratio", f_ratio);
		req.setAttribute("m_ratio", m_ratio);
	}

	// 연령 통계
	@Override
	public void static_age_ratio(HttpServletRequest req, Model model) {
		System.out.println("static_age_ratio 시작합니다");
		List<userVO> list = new ArrayList<userVO>();
		
		list = dao_user.printUsers();
		
		float age10s_count = 0;
		float age20s_count = 0;
		float age30s_count = 0;
		float age40s_count = 0;
		float age50s_count = 0;
		float age60s_count = 0;
		float age70s_count = 0;
		float age80s_count = 0;
		
		for(userVO vo : list) {
			float AGEs = vo.getUser_age();
			
			if(AGEs >= 10 && AGEs < 20)
				age10s_count +=1;
			else if(AGEs >= 20 && AGEs < 30)
				age20s_count +=1;
			else if(AGEs >= 30 && AGEs < 40)
				age30s_count +=1;
			else if(AGEs >= 40 && AGEs < 50)
				age40s_count +=1;
			else if(AGEs >= 50 && AGEs < 60)
				age50s_count +=1;
			else if(AGEs >= 60 && AGEs < 70)
				age60s_count +=1;
			else if(AGEs >= 70 && AGEs < 80)
				age70s_count +=1;
			else if(AGEs >= 80 && AGEs < 90)
				age80s_count +=1;
		}
		
		System.out.println("=== 연령대 별 인원 수 ===");
		System.out.println("10대 : " + age10s_count +"\n20대 : " + age20s_count
						+"\n30대 : " + age30s_count +"\n40대 : " + age40s_count
						+"\n50대 : " + age50s_count +"\n60대 : " + age60s_count
						+"\n70대 : " + age70s_count +"\n80대 : " + age80s_count);
		
		float sumcount = list.size();
		
		float age10s_ratio = (age10s_count / sumcount) * 100;
		float age20s_ratio = (age20s_count / sumcount) * 100;
		float age30s_ratio = (age30s_count / sumcount) * 100;
		float age40s_ratio = (age40s_count / sumcount) * 100;
		float age50s_ratio = (age50s_count / sumcount) * 100;
		float age60s_ratio = (age60s_count / sumcount) * 100;
		float age70s_ratio = (age70s_count / sumcount) * 100;
		float age80s_ratio = (age80s_count / sumcount) * 100;
		
		System.out.println("=== 총 인원 수 : " + sumcount + " ===");
		System.out.println("=== 연령대 별 비율 ===");
		System.out.println("10대 : " + age10s_ratio +"\n20대 : " + age20s_ratio
						+"\n30대 : " + age30s_ratio +"\n40대 : " + age40s_ratio
						+"\n50대 : " + age50s_ratio +"\n60대 : " + age60s_ratio
						+"\n70대 : " + age70s_ratio +"\n80대 : " + age80s_ratio);
		
		req.setAttribute("age10s_ratio", age10s_ratio);
		req.setAttribute("age20s_ratio", age20s_ratio);
		req.setAttribute("age30s_ratio", age30s_ratio);
		req.setAttribute("age40s_ratio", age40s_ratio);
		req.setAttribute("age50s_ratio", age50s_ratio);
		req.setAttribute("age60s_ratio", age60s_ratio);
		req.setAttribute("age70s_ratio", age70s_ratio);
		req.setAttribute("age80s_ratio", age80s_ratio);
	}

	// 월별 인원 현황
	@Override
	public void static_numOfUserByMonth(HttpServletRequest req, Model model) {
		System.out.println("static_numOfUserByMonth 시작합니다");
		List<userVO> list = new ArrayList<userVO>();
		
		list = dao_user.printUsers();
		
		// 신규등록 고객
		int janJoinCnt = 0;
		int febJoinCnt = 0;
		int marJoinCnt = 0;
		int aprJoinCnt = 0;
		int mayJoinCnt = 0;
		int junJoinCnt = 0;
		int julJoinCnt = 0;
		int augJoinCnt = 0;
		int sepJoinCnt = 0;
		int octJoinCnt = 0;
		int novJoinCnt = 0;
		int decJoinCnt = 0;
		
		for(userVO vo : list) {
			
			Date month = vo.getJoin_date();
			int intMonth = month.getMonth() + 1;
			
			if(intMonth == 1) 
				janJoinCnt +=1;
			else if(intMonth == 2)
				febJoinCnt +=1;
			else if(intMonth == 3)
				marJoinCnt +=1;
			else if(intMonth == 4)
				aprJoinCnt +=1;
			else if(intMonth == 5)
				mayJoinCnt +=1;
			else if(intMonth == 6)
				junJoinCnt +=1;
			else if(intMonth == 7)
				julJoinCnt +=1;
			else if(intMonth == 8)
				augJoinCnt +=1;
			else if(intMonth == 9)
				sepJoinCnt +=1;  // => 9월달 가입자 6명이 나와야한다. (10/2 22:27 기준)
			else if(intMonth == 10)
				octJoinCnt +=1;
			else if(intMonth == 11)
				novJoinCnt +=1;
			else if(intMonth == 12)
				decJoinCnt +=1;
			}

		int sumcount = list.size();
		System.out.println("총 인원 수 : " + sumcount + "명");
		
		req.setAttribute("janJoinCnt", janJoinCnt);
		req.setAttribute("febJoinCnt", febJoinCnt);
		req.setAttribute("marJoinCnt", marJoinCnt);
		req.setAttribute("aprJoinCnt", aprJoinCnt);
		req.setAttribute("mayJoinCnt", mayJoinCnt);
		req.setAttribute("junJoinCnt", junJoinCnt);
		req.setAttribute("julJoinCnt", julJoinCnt);
		req.setAttribute("augJoinCnt", augJoinCnt);
		req.setAttribute("sepJoinCnt", sepJoinCnt);
		req.setAttribute("octJoinCnt", octJoinCnt);
		req.setAttribute("novJoinCnt", novJoinCnt);
		req.setAttribute("decJoinCnt", decJoinCnt);
		
		
		// 방문 및 예약 고객
		
		
	}

	// 담당자별 판매 현황 (리스트 목록 통계)
	@Override
	public void static_managerSales(HttpServletRequest req, Model model) {
		System.out.println("static_managerSalesList 시작합니다");
		
		String host_code = (String) req.getSession().getAttribute("code");
		System.out.println("host_code : " + host_code);
		
		List<StaticVO> dtos = dao_statics.managerSalesList(host_code);
		System.out.println("dtos 목록 : " + dtos);
		
		model.addAttribute("dtos", dtos);
		
		System.out.println(dtos.get(0).getEmployee_name());
		
		System.out.println("====================");
		
		System.out.println("static_managerSalesChart 시작합니다");
		
		String employee_code = null;
		List<StaticVO> list = null;
		for(int i=0; i<dtos.size(); i++) {
			
			employee_code = dtos.get(i).getEmployee_code();
			
			System.out.println("dtos로부터 받아온 employee_code 목록들 : " + employee_code);
		}	
		
		
		
		list = dao_statics.managerSalesChart(employee_code);
		

		
		
		//List<StaticVO> list = new ArrayList<StaticVO>();
		
		
		//String employee_code = dtos.get(0).getEmployee_code();
		//List<StaticVO> list = dao_statics.managerSalesChart(employee_code);
//		for(int i=0; i<list.size(); i++) {
//			employee_code = list.get(i).getEmployee_code();
//			list = dao_statics.managerSalesChart(employee_code);
//		}
		
		System.out.println("list 목록 : " + list + "\n" + list.size() + "\n" + list.toString());
		list.get(0).getRes_dates();
		System.out.println("list 0번째의 res_dates : " + list.get(0).getRes_dates());
		
		// 담당자별 월 판매 총액
		int janSalesSum = 0;
		int febSalesSum = 0;
		int marSalesSum = 0;
		int aprSalesSum = 0;
		int maySalesSum = 0;
		int junSalesSum = 0;
		int julSalesSum = 0;
		int augSalesSum = 0;
		int sepSalesSum = 0;
		int octSalesSum = 0;
		int novSalesSum = 0;
		int decSalesSum = 0;

		for(int i=0; i<list.size(); i++) {
			
			employee_code = list.get(i).getEmployee_code();
			System.out.println("employee_code 목록 : " + employee_code);
			
			//Date month = vo.getRes_date();
			String months = list.get(i).getRes_dates();
			String[] splitMonth = months.split("-");
			
			String year = splitMonth[0];
			String month = splitMonth[1];

//			for( int i = 0; i < splitMonth.length; i++) {
//				System.out.println("splitMonth는? " + splitMonth[i]);
//			}
			
			System.out.println("vo.getSalesSum() : " + list.get(i).getSalesSum());
			System.out.println("months : " + months);
			System.out.println("year : " + year);
			System.out.println("month : " + month);
			
			//int intMonth = month.getMonth() + 1;
			
			if(month.equals("01")) 
				list.get(i).setJanSalesSum(list.get(i).getSalesSum());		
			else if(month.equals("02"))
				febSalesSum += list.get(i).getSalesSum();
			else if(month.equals("03"))
				marSalesSum += list.get(i).getSalesSum();
			else if(month.equals("04"))
				aprSalesSum += list.get(i).getSalesSum();
			else if(month.equals("05"))
				maySalesSum += list.get(i).getSalesSum();
			else if(month.equals("06"))
				junSalesSum += list.get(i).getSalesSum();
			else if(month.equals("07"))
				julSalesSum += list.get(i).getSalesSum();
			else if(month.equals("08"))
				augSalesSum += list.get(i).getSalesSum();
			else if(month.equals("09")) {
				list.get(i).setSepSalesSum(list.get(i).getSalesSum());  // => 9월달 가입자 6명이 나와야한다. (10/2 22:27 기준)
				System.out.println("sepSalesSum : " + sepSalesSum);
			}
			else if(month.equals("10"))
				list.get(i).setOctSalesSum(list.get(i).getSalesSum());
			else if(month.equals("11"))
				novSalesSum += list.get(i).getSalesSum();
			else if(month.equals("12"))
				decSalesSum += list.get(i).getSalesSum();
			
			
			
			
			
			
			
//			int intMonth = month.getMonth() + 1;
//			
//			if(intMonth == 1) 
//				janSalesSum += vo.getJanSalesSum();			
//			else if(intMonth == 2)
//				febSalesSum += vo.getFebSalesSum();
//			else if(intMonth == 3)
//				marSalesSum += vo.getMarSalesSum();
//			else if(intMonth == 4)
//				aprSalesSum += vo.getAprSalesSum();
//			else if(intMonth == 5)
//				maySalesSum += vo.getMaySalesSum();
//			else if(intMonth == 6)
//				junSalesSum += vo.getJunSalesSum();
//			else if(intMonth == 7)
//				julSalesSum += vo.getJulSalesSum();
//			else if(intMonth == 8)
//				augSalesSum += vo.getAugSalesSum();
//			else if(intMonth == 9)
//				sepSalesSum += vo.getSepSalesSum();  // => 9월달 가입자 6명이 나와야한다. (10/2 22:27 기준)
//			else if(intMonth == 10)
//				octSalesSum += vo.getOctSalesSum();
//			else if(intMonth == 11)
//				novSalesSum += vo.getNovSalesSum();
//			else if(intMonth == 12)
//				decSalesSum += vo.getDecSalesSum();
			}

		int totalMngSalesCnt = dtos.size();
		System.out.println("전체 담당자 판매건수 : " + totalMngSalesCnt + "건");
		
		System.out.println("list 목록 : " + list);
		System.out.println("sepSalesSum 목록 : " + sepSalesSum);
		model.addAttribute("list", list);
		
		req.setAttribute("janSalesSum", janSalesSum);
		req.setAttribute("febSalesSum", febSalesSum);
		req.setAttribute("marSalesSum", marSalesSum);
		req.setAttribute("aprSalesSum", aprSalesSum);
		req.setAttribute("maySalesSum", maySalesSum);
		req.setAttribute("junSalesSum", junSalesSum);
		req.setAttribute("julSalesSum", julSalesSum);
		req.setAttribute("augSalesSum", augSalesSum);
		req.setAttribute("sepSalesSum", sepSalesSum);
		req.setAttribute("octSalesSum", octSalesSum);
		req.setAttribute("novSalesSum", novSalesSum);
		req.setAttribute("decSalesSum", decSalesSum);
		
		System.out.println("====================");
		
		
		
		
		
		
		
		
	}

	// 유형(호실)별 판매 현황(통계)
	@Override
	public void static_roomSales(HttpServletRequest req, Model model) {
		System.out.println("static_roomSalesList 시작합니다");
		
		String host_code = (String) req.getSession().getAttribute("code");
		System.out.println("host_code : " + host_code);
		
		List<StaticVO> dtos = dao_statics.roomSalesList(host_code);
		System.out.println("dtos 목록 : " + dtos);
		
		model.addAttribute("dtos", dtos);
		
		System.out.println("====================");
		
		System.out.println("static_roomSalesChart 시작합니다");
		
		
		
		
		// 호실별 월 판매 총액
		int janSalesSum = 0;
		int febSalesSum = 0;
		int marSalesSum = 0;
		int aprSalesSum = 0;
		int maySalesSum = 0;
		int junSalesSum = 0;
		int julSalesSum = 0;
		int augSalesSum = 0;
		int sepSalesSum = 0;
		int octSalesSum = 0;
		int novSalesSum = 0;
		int decSalesSum = 0;

		for(int i=0; i<dtos.size(); i++) {
			
			
			//Date month = vo.getRes_date();
			String months = dtos.get(i).getRes_dates();
			String[] splitMonth = months.split("-");
			
			String year = splitMonth[0];
			String month = splitMonth[1];

//					for( int i = 0; i < splitMonth.length; i++) {
//						System.out.println("splitMonth는? " + splitMonth[i]);
//					}
			
			System.out.println("vo.getSalesSum() : " + dtos.get(i).getSalesSum());
			System.out.println("months : " + months);
			System.out.println("year : " + year);
			System.out.println("month : " + month);
			
			//int intMonth = month.getMonth() + 1;
			
			if(month.equals("01")) 
				dtos.get(i).setJanSalesSum(dtos.get(i).getSalesSum());		
			else if(month.equals("02"))
				febSalesSum += dtos.get(i).getSalesSum();
			else if(month.equals("03"))
				marSalesSum += dtos.get(i).getSalesSum();
			else if(month.equals("04"))
				aprSalesSum += dtos.get(i).getSalesSum();
			else if(month.equals("05"))
				maySalesSum += dtos.get(i).getSalesSum();
			else if(month.equals("06"))
				junSalesSum += dtos.get(i).getSalesSum();
			else if(month.equals("07"))
				julSalesSum += dtos.get(i).getSalesSum();
			else if(month.equals("08"))
				augSalesSum += dtos.get(i).getSalesSum();
			else if(month.equals("09")) {
				dtos.get(i).setSepSalesSum(dtos.get(i).getSalesSum());  // => 9월달 가입자 6명이 나와야한다. (10/2 22:27 기준)
				System.out.println("sepSalesSum : " + sepSalesSum);
			}
			else if(month.equals("10"))
				dtos.get(i).setOctSalesSum(dtos.get(i).getSalesSum());
			else if(month.equals("11"))
				novSalesSum += dtos.get(i).getSalesSum();
			else if(month.equals("12"))
				decSalesSum += dtos.get(i).getSalesSum();
		}
		
		
		int totalRoomSalesCnt = dtos.size();
		System.out.println("전체 호실 판매건수 : " + totalRoomSalesCnt + "건");
		
		System.out.println("dtos 목록 : " + dtos);
		System.out.println("sepSalesSum 목록 : " + sepSalesSum);
		model.addAttribute("dtos", dtos);
		
		req.setAttribute("janSalesSum", janSalesSum);
		req.setAttribute("febSalesSum", febSalesSum);
		req.setAttribute("marSalesSum", marSalesSum);
		req.setAttribute("aprSalesSum", aprSalesSum);
		req.setAttribute("maySalesSum", maySalesSum);
		req.setAttribute("junSalesSum", junSalesSum);
		req.setAttribute("julSalesSum", julSalesSum);
		req.setAttribute("augSalesSum", augSalesSum);
		req.setAttribute("sepSalesSum", sepSalesSum);
		req.setAttribute("octSalesSum", octSalesSum);
		req.setAttribute("novSalesSum", novSalesSum);
		req.setAttribute("decSalesSum", decSalesSum);
		
		System.out.println("====================");
		
		
	}
	
	
	
}
