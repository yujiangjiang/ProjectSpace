package com.yu.jj.ws;

import javax.jws.WebMethod;
import javax.jws.WebService;

import com.yu.jj.vo.People;

@WebService
public interface HelloWorldService {

	@WebMethod
	public String sayHello(String message);
	
	@WebMethod
	public String sayBye(String bye);
	
	@WebMethod
	public People getPeoples();
	
	@WebMethod
	public String getInfos(String s1, String s2);
}
