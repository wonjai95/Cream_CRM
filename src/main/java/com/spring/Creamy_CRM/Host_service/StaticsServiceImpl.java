/*
 * 작성자 : 
 * 작성일 : 
 * 통계 관련 service
 * 
*/
package com.spring.Creamy_CRM.Host_service;

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
	
	@Override
	public void static_gender_ratio(HttpServletRequest req, Model model) {
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
		
		System.out.println("총인원 : "+sumcount);
		System.out.println("남자 : "+m_ratio);
		System.out.println("여자 : "+f_ratio);
		
		req.setAttribute("f_ratio", f_ratio);
		req.setAttribute("m_ratio", m_ratio);
		
		
	}

}
