package com.yu.jj.wsclient;

import com.yu.jj.client.HelloWorldServiceImpl;
import com.yu.jj.client.HelloWorldServiceImplService;

public class ClientTest {

	public static void main(String[] args) {
		HelloWorldServiceImplService hwService = new HelloWorldServiceImplService();
		HelloWorldServiceImpl service = hwService.getHelloWorldServiceImplPort();
		String res = service.sayHello("aaaaa");
		System.out.println(res+"==="+service.sayBye("dd"));

	}
}
