package com.hik.service;

import java.util.List;
import java.util.Map;

import com.hik.bo.Book;


public interface BookService {

	public List<Map<String,Object>> getBookCategory();
	
	public List<Book> getBooksBycategoryId(Integer categoryId);
	
	public List<Book> getBookList();
	
	public List<Book> getBooksByPage(Integer start, Integer limit);
	
	public List<Book> deleteBookById(Integer id);
}
