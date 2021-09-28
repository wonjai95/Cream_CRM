/*
 * 작성자 : 정지은
 * 작성일 : 2021.09.15
 * Auth_tbl vo
 * 
*/
package com.spring.Creamy_CRM.VO;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class AuthVO extends User{
	private String key;
	private String authority;
	private int enabled;
	

	public AuthVO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities
			, String key, String authority
			,int enabled_auth) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	
		this.key = key;
		this.authority = authority;
		this.enabled = enabled_auth;
	}




	public String getKey() {
		return key;
	}


	public void setKey(String key) {
		this.key = key;
	}


	public String getAuthority() {
		return authority;
	}


	public void setAuthority(String authority) {
		this.authority = authority;
	}


	public int getEnabled() {
		return enabled;
	}


	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	
	
	
}
