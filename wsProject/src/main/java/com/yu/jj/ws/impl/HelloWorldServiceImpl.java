package com.yu.jj.ws.impl;

import javax.jws.WebService;

import com.yu.jj.vo.People;
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

	@Override
	public People getPeoples() {
		People p = new People();
		p.setName("yjj");
		p.setAge(20);
		p.setFlag(false);
		return null;
	}

	@Override
	public String getInfos(String s1, String s2) {
		// TODO Auto-generated method stub
		
		return s1+"-"+s2;
	}

	
}
