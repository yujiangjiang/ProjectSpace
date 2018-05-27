package com.yu.jj.ws;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public interface HelloWorldService {

	@WebMethod
	public String sayHello(String message);
	
	@WebMethod
	public String sayBye(String bye);
}
