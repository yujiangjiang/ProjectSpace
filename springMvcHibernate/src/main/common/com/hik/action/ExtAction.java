package com.hik.action;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hik.bo.AjaxResponse;
import com.hik.bo.User;

@RestController
public class ExtAction {
	Logger log = LoggerFactory.getLogger(ExtAction.class);

	private User user;
	private Integer bookId;

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@RequestMapping("vType.action")
	public ModelAndView toVtype(ModelAndView mv, User user) {
		if (user != null) {
			log.info("用户名：" + user.getUserName() + "密码：" + user.getPassword());
			log.info("aaaaa");
		}
		mv.setViewName("ext/vType");
		return mv;
	}

	@RequestMapping("getBookListById.action")
	public AjaxResponse getBookListById(ModelAndView mv, Integer bookId) {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("userName", "yjj");
		data.put("password", "314130");

		if (bookId == 1) {
			data.put("password", "1");
		} else if (bookId == 2) {
			data.put("password", "2");
		}
		
		AjaxResponse ar=new AjaxResponse();
		ar.setSuccess(true);
		ar.setData(data);
		return ar;
	}
	
	@RequestMapping("toLoadJsp.action")
	public ModelAndView toLoadJsp(ModelAndView mv){
		mv.setViewName("ext/load");
		return mv;
	}

}
