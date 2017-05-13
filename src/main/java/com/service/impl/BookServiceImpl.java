package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Book;
import com.persistence.BookMapper;
import com.service.BookService;
import com.util.Page;

@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper bookMapper;

	@Override
	public boolean addBook(Book book) {
		List<Book> books = bookMapper.getAllBooks();
		for(Book b :books){
			if(b.getISBN().equals(book.getISBN())){
				return false;
			}
		}
		if(bookMapper.addBook(book)>0){
			return true;
		}
		return false;
	}

	@Override
	public Page<Book> getBooksBy(Book book,int pageNum, int pageSize) {
		pageNum = (pageNum>0)?pageNum:1;
		/*List<Book> books = bookMapper.getBooksBy(book.getBookName(), book.getAuthor(),
					book.getPublish(),book.getBookTypeID(),book.getTranslator(),book.getISBN(), 
					(pageNum-1)*pageSize, pageSize);*/
		List<Book> books = bookMapper.getBooksBy(book, (pageNum-1)*pageSize, pageSize);
		int counts = bookMapper.getBooksCountBy(book);
		Page<Book> result = new Page<Book>();
		result.setPageIndex(pageNum);
		result.setPageSize(pageSize);
		result.setTotalRecords(counts);
		result.setPageDatas(books);

		return result;
	}

	@Override
	public boolean updateBook(Book book) {
		List<Book> books = bookMapper.getAllBooks();
		for(Book b :books){
			if(b.getBookID()==book.getBookID()){
				continue;
			}
			if(b.getISBN().equals(book.getISBN())){
				return false;
			}
		}
		if(bookMapper.updateBook(book)>0){
			return true;
		}
		return false;
	}

	@Override
	public Book getBookByID(int bookID) {
		return bookMapper.getBookByID(bookID);
	}

	@Override
	public List<Book> getAllBooks() {
		return bookMapper.getAllBooks();
	}

}
