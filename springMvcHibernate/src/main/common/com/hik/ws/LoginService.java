package com.hik.ws;

import javax.jws.WebParam;

public interface LoginService {

	public String login(@WebParam(name="username")String username,String password);
}
