package com.hik.ws.impl;

import org.springframework.stereotype.Component;

import com.hik.ws.LoginService;

@Component("loginService")
public class LoginServiceImpl implements LoginService {

	@Override
	public String login(String username, String password) {

		return username + "--->" + password;
	}

}
