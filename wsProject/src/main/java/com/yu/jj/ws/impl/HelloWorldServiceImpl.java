package com.yu.jj.ws.impl;

import javax.jws.WebService;

import com.yu.jj.ws.HelloWorldService;

@WebService
public class HelloWorldServiceImpl implements HelloWorldService{

	@Override
	public String sayHello(String message) {
		
		return "hello:"+message;
	}

	@Override
	public String sayBye(String bye) {
		
		return bye+":bye";
	}

	
}
