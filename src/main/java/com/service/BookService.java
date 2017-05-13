package com.service;

import java.util.List;

import com.bean.Book;
import com.util.Page;

public interface BookService {
	Page<Book> getBooksBy(Book book, int pageNum, int pageSize);
	
	boolean addBook(Book book);
	
	boolean updateBook(Book book);

	Book getBookByID(int bookID);
	
	List<Book> getAllBooks();

}
