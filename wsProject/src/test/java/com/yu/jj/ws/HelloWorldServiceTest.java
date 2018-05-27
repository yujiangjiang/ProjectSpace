package com.yu.jj.ws;

import javax.xml.ws.Endpoint;

import com.yu.jj.ws.impl.HelloWorldServiceImpl;

public class HelloWorldServiceTest {

	public static void main(String[] args){
		
		String address = "http://127.0.0.1:8180/ws/hellowordws";  
        Endpoint.publish(address, new HelloWorldServiceImpl());  
        System.out.println("web service 接口发布成功... ");  
	}
}
