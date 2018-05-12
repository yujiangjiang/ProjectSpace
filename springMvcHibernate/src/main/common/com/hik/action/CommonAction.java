package com.hik.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hik.bo.User;

@RestController
public class CommonAction {

	private static final Logger log = LoggerFactory
			.getLogger(CommonAction.class);

	@RequestMapping("/login.action")
	public ModelAndView login(ModelAndView mv) {
		if (1 == 1) {
			log.info("aaaaaaa");
		}
		mv.setViewName("login");
		return mv;
	}

	@RequestMapping("/getUserInfo.action")
	public Map<String, Object> getUser() {
		User user = new User("yjj", "12345");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		result.put("user", user);
		return result;
	}

	@RequestMapping("/suc.action")
	public Map<String, Object> suc() {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		result.put("msg", "success");
		result.put("name", "yjj");
		List<String> books = new ArrayList<String>();
		books.add("java");
		books.add("C++");
		result.put("books", books);
		return result;
	}

	@RequestMapping("/ext/validate.action")
	public ModelAndView toValidate(ModelAndView mv) {
		// ModelAndView mv =new ModelAndView();
		mv.setViewName("/ext/validate");
		return mv;
	}
}
