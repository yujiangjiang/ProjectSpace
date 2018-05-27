package com.hik.action;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hik.Client.WSClient;
import com.hik.bo.User;

@RestController
public class TestAction {

	@RequestMapping("test/rpc.action")
	public User testDocument(){
		WSClient.testDocument();
		User user=new User();
		String userName="yjj";
		String password="314130446";
		user.setUserName(userName);
		user.setPassword(password);
		return user;
	}
}
