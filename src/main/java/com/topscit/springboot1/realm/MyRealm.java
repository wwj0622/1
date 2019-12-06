package com.topscit.springboot1.realm;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import com.topscit.springboot1.bean.User;
import com.topscit.springboot1.service.LoginService;

public class MyRealm extends AuthorizingRealm{

	@Resource
	private LoginService loginService;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		
		
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
      
        
		String name = (String) token.getPrincipal();
	
		User user = loginService.Select(name);
	
		if(user==null)
		{
			return null;
		}
       	 SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user, user.getPassword(),ByteSource.Util.bytes(user.getSalt()) , "Myrealm");
 	
	  	return simpleAuthenticationInfo;
	}

	
}