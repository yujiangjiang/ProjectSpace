package com.hik.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hik.bo.AjaxResponse;
import com.hik.bo.Book;
import com.hik.bo.User;
import com.hik.service.BookService;

@RestController
public class ExtAction {
	Logger log = LoggerFactory.getLogger(ExtAction.class);

	@Autowired
	private BookService bookService;

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

		AjaxResponse ar = new AjaxResponse();
		ar.setSuccess(true);
		ar.setData(data);
		return ar;
	}

	@RequestMapping("toLoadJsp.action")
	public ModelAndView toLoadJsp(ModelAndView mv) {
		mv.setViewName("ext/load");
		return mv;
	}

	@RequestMapping("toTextJsp.action")
	public ModelAndView toTextJsp(ModelAndView mv) {
		mv.setViewName("ext/text");
		return mv;
	}

	@RequestMapping("toComboBoxJsp.action")
	public ModelAndView toComboBoxJsp(ModelAndView mv) {
		mv.setViewName("ext/comboBox");
		return mv;
	}

	@RequestMapping("toColumnJsp.action")
	public ModelAndView toColumnJsp(ModelAndView mv) {
		mv.setViewName("ext/column");
		return mv;
	}

	@RequestMapping("getBooks.action")
	public AjaxResponse getBooks() {
		AjaxResponse ar = new AjaxResponse();
		ar.setSuccess(true);
		List<Map<String, Object>> data = bookService.getBookCategory();
		/*
		 * Map<String,Object> items=new HashMap<>(); items.put("id", 1);
		 * items.put("name", "aaaaaa");
		 */

		// data.add(items);
		ar.setData(data);
		return ar;
	}

	@RequestMapping("getBooksByCategory.action")
	public AjaxResponse getBookByCategoryId(Integer categoryId) {
		AjaxResponse ar = new AjaxResponse();
		ar.setSuccess(true);
		List<Book> books = bookService.getBooksBycategoryId(categoryId);
		ar.setData(books);
		return ar;
	}

	@RequestMapping("getAllBooks.action")
	public AjaxResponse getAllBooks() {
		List<Book> data = bookService.getBookList();
		AjaxResponse ar = new AjaxResponse();
		ar.setSuccess(true);
		ar.setData(data);
		return ar;
	}

	@RequestMapping("toGridRemoteJsp.action")
	public ModelAndView toGridRemoteJsp(ModelAndView mv) {
		mv.setViewName("ext/grid_remote");
		return mv;
	}

	/*
	 * @RequestMapping("getBooksByPage.action") public AjaxResponse
	 * getBooksByPage(Integer start,Integer limit){ List<Book>
	 * data=bookService.getBooksByPage(start, limit); AjaxResponse ar=new
	 * AjaxResponse(); ar.setSuccess(true); ar.setData(data);
	 * ar.setData("total", new Integer(100)); return ar; }
	 */

	@RequestMapping("getBooksByPage.action")
	public Map<String, Object> getBooksByPage(Integer start, Integer limit) {
		List<Book> data = bookService.getBooksByPage(start, limit);
		Map<String, Object> res = new HashMap<>();
		res.put("data", data);
		res.put("total", 100);
		return res;
	}
	
	@RequestMapping("toGridActionJsp.action")
	public ModelAndView toGridActionJsp(ModelAndView mv){
		mv.setViewName("ext/grid_action");
		return mv;
	}
	
	@RequestMapping("deleteBook.action")
	public List<Book> deleteBook(Integer id){
		List<Book> bookList=bookService.deleteBookById(id);
		return bookList;
	}

}
