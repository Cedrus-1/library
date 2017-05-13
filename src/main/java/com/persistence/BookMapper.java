package com.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bean.Book;

public interface BookMapper {

	List<Book> getBooksBy(@Param("book") Book book, int start, int num);
	int getBooksCountBy(@Param("book") Book book);

	List<Book> getHotBooksByBorrowTimes(int num);
	List<Book> getHotBooksByRating(int num);
	
	int addBook(Book book);
	
	int updateBook(Book book);
	
	Book getBookByID(int bookID);
	
	List<Book> getAllBooks();

}
