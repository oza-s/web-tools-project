package com.neu.webtools.security;

import java.util.ArrayList;
import java.util.List;

//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.neu.webtools.beans.User;
import com.neu.webtools.dao.ILoginDao;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider
{
	@Autowired
	public ILoginDao loginDao;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException
	{
		System.out.println("CustomAuthenticationProvider / authenticate ");
		Authentication auth = null;
		authentication.getDetails();
		String user1 = (String) authentication.getPrincipal();
		String name = authentication.getName();
		String password = authentication.getCredentials().toString();
		System.out.println("Username:	" + name + " and " + "Password: " + password);
		List<GrantedAuthority> grantedAuths = new ArrayList<GrantedAuthority>();
		User user = loginDao.checkUser(name, password);
		/*grantedAuths.add(new GrantedAuthorityImpl("permitAll"));*/
		if (user != null)
		{
			String role = user.getRole();
			if (role!=null)
			{
				System.out.println("Adding role :" + role.toUpperCase());
				grantedAuths.add(new GrantedAuthorityImpl(role.toUpperCase()));
			
			}
			System.out.println("CustomAuthenticationProvider / authenticate : user authenticated");
			auth = new UsernamePasswordAuthenticationToken(user, password, grantedAuths);
			return auth;
		}
		return null;
	}

	@Override
	public boolean supports(Class<?> authentication)
	{
		return true;
		//return authentication.equals(UsernamePasswordAuthenticationToken.class);

	}

}
