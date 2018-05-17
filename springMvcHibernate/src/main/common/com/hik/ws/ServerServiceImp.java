package com.hik.ws;

import org.springframework.stereotype.Component;

@Component("serverServiceImp")
public class ServerServiceImp implements ServerService {

	@Override
	public String sayHello(String name) {
		// TODO Auto-generated method stub
		return "你好 " + name + "!";
	}

	@Override
	public String sayWhat(String what) {
		// TODO Auto-generated method stub
		return "你好" + what;
	}

}
