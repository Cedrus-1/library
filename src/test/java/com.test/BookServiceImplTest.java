package com.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bean.Book;
import com.service.BookService;
import com.util.Page;

public class BookServiceImplTest extends BaseTest {

	@Autowired
	private BookService bookService;

	@Test
	public void testQuery() {
		Book book = new Book();
		Page<Book> query = bookService.getBooksBy(book, 1, 4);
		System.out.println(query.getTotalRecords());
		for(Book b:query.getPageDatas()){
			System.out.println(b.toString());
		}
	}
	
	@Test
	public void addTest() {
		Book book = new Book();
		book.setBookTypeID(4);
		
		
		
		
		Page<Book> query = bookService.getBooksBy(book, 1, 20);
		for(Book b:query.getPageDatas()){
			System.out.println(b.toString());
		}
	}

}
