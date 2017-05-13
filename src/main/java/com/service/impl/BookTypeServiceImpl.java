package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Book;
import com.bean.BookType;
import com.persistence.BookMapper;
import com.persistence.BookTypeMapper;
import com.service.BookTypeService;
import com.util.Page;

@Service
public class BookTypeServiceImpl implements BookTypeService {
	@Autowired
	private BookTypeMapper bookTypeMapper;
	@Autowired
	private BookMapper bookMapper;

	@Override
	public List<BookType> getAllTypes() {
		return bookTypeMapper.getAllTypes();
	}

	@Override
	public Page<BookType> getTypesByPage(int pageNum, int pageSize) {
		pageNum = (pageNum>0)?pageNum:1;
		List<BookType> types = bookTypeMapper.getTypesByPage((pageNum-1)*pageSize, pageSize);
		int counts = bookTypeMapper.getTypesCount();
		Page<BookType> result = new Page<BookType>();
		result.setPageIndex(pageNum);
		result.setPageSize(pageSize);
		result.setTotalRecords(counts);
		result.setPageDatas(types);
		return result;
	}

	@Override
	public BookType getTypeByID(int id) {
		return bookTypeMapper.getTypeByID(id);
	}

	@Override
	public boolean addType(BookType type) {
		List<BookType> types = bookTypeMapper.getAllTypes();
		for(BookType booktype:types){
			if(booktype.getBookTypeName().equals(type.getBookTypeName())){
				return false;
			}
		}
		if(bookTypeMapper.addType(type)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateType(BookType type) {
		List<BookType> types = bookTypeMapper.getAllTypes();
		for(BookType booktype:types){
			if(booktype.getBookTypeID() == type.getBookTypeID())
				continue;
			if(booktype.getBookTypeName().equals(type.getBookTypeName())){
				return false;
			}
		}
		if(bookTypeMapper.updateType(type)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteType(int id) {
		List<Book> books = bookMapper.getAllBooks();
		for(Book book:books){
			if(book.getBookTypeID()==id){
				return false;
			}
		}
		if(bookTypeMapper.deleteType(id)>0){
			return true;
		}
		return false;
	}

}
