package com.hik.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hik.bo.Book;

@Service
public class BookServiceImpl implements BookService {

	@Override
	public List<Map<String, Object>> getBookCategory() {
		// TODO Auto-generated method stub
		Map<String, Object> cate1 = new HashMap<>();
		cate1.put("id", 1);
		cate1.put("name", "java");
		Map<String, Object> cate2 = new HashMap<>();
		cate2.put("id", 2);
		cate2.put("name", "C++");

		List<Map<String, Object>> categorys = new ArrayList<>();
		categorys.add(cate1);
		categorys.add(cate2);
		return categorys;
	}

	@Override
	public List<Book> getBooksBycategoryId(Integer categoryId) {
		// TODO Auto-generated method stub
		List<Book> books = new ArrayList<>();
		if (categoryId == 1) {
			Book book1 = new Book();
			book1.setId(1);
			book1.setName("java1");
			Book book2 = new Book();
			book2.setId(2);
			book2.setName("java2");
			books.add(book1);
			books.add(book2);

		} else if (categoryId == 2) {
			Book book1 = new Book();
			book1.setId(1);
			book1.setName("C++1");
			Book book2 = new Book();
			book2.setId(2);
			book2.setName("C++2");
			books.add(book1);
			books.add(book2);
		}
		return books;
	}

	@Override
	public List<Book> getBookList() {
		// TODO Auto-generated method stub
		List<Book> bookList = new ArrayList<>();
		bookList.add(new Book(1, "java", "yjj", 12.43f));
		bookList.add(new Book(2, "C++", "yjj", 12.43f));
		bookList.add(new Book(3, "javaC", "yjj", 12.43f));
		bookList.add(new Book(4, "javaCSA", "yjj", 12.4367f));
		bookList.add(new Book(5, "javaXXX", "yjj", 12.433f));
		bookList.add(new Book(6, "javaZZ", "yjj", 234.435f));
		return bookList;
	}

	@Override
	public List<Book> getBooksByPage(Integer start, Integer limit) {
		// TODO Auto-generated method stub
		Book[] books =new Book[100];
		for(int i=0;i<100;i++){
			books[i]=new Book(i, "java"+i, "yjj", 12.43f);
		}
		int pageStart = start / limit + 1;
		List<Book> bookList = new ArrayList<>();
		for(int i=0;i<limit;i++){
			bookList.add(books[pageStart+i]);
		}
		return bookList;
	}

	@Override
	public List<Book> deleteBookById(Integer id) {
		// TODO Auto-generated method stub
		Book[] books =new Book[100];
		for(int i=0;i<100;i++){
			books[i]=new Book(i, "java"+i, "yjj", 12.43f);
		}
		List<Book> bookList=new ArrayList<>(100);
		for(int i=0;i<100;i++){
			if(id!=i){
				bookList.add(books[i]);
			}
		}
		return bookList;
	}

}
