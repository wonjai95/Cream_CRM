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
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.Creamy_CRM.Host_dao.CRMuserDAOImpl;
import com.spring.Creamy_CRM.VO.userVO;

@Service
public class StaticsServiceImpl implements StaticsService {

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
	
	
	
	
}
