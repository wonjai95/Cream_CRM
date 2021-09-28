/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * 스프링 시큐리티 로그인 처리부분
 * Auth테이블 사용하여 로그인처리
*/
package com.spring.Creamy_CRM.AuthService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.Creamy_CRM.VO.AuthVO;

public class UserAuthenticationService implements UserDetailsService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//security-context.xml에서 주입
		public UserAuthenticationService(SqlSessionTemplate sqlSession) {
			this.sqlSession = sqlSession;
		}
		
		@Override
		public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {

			Map<String, Object> map = sqlSession.selectOne("com.spring.Creamy_CRM.Host_dao.loginDAO.selectUser",id);
			System.out.println("login check ->"+ id);
			System.out.println(map.get("ID"));
			
			
			System.out.println("pw : "+map.get("PASSWORD"));
			
			//인증실패시 인위적으로 예외 발생
			if(map == null) throw new UsernameNotFoundException(id);
			
			List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
			authority.add(new SimpleGrantedAuthority(map.get("AUTHORITY").toString()));
			
			return new AuthVO(map.get("ID").toString(), map.get("PASSWORD").toString(), 
								(Integer)Integer.valueOf(map.get("ENABLED").toString()) == 1, 
								true, true, true, authority
								,map.get("KEY").toString()
								,map.get("AUTHORITY").toString(),Integer.parseInt(map.get("ENABLED").toString()));
		}

}
