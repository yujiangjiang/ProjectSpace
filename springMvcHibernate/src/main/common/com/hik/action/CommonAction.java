package com.hik.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class CommonAction {
	
	private static final Logger log = LoggerFactory.getLogger(CommonAction.class);
	
	@RequestMapping("/login.action")
	public void login(ModelAndView mv){
		if(1==1){
			log.info("aaaaaaa");
		}
		mv.setViewName("login");
		
	}
}
