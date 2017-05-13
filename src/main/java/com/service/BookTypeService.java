package com.service;

import java.util.List;

import com.bean.BookType;
import com.util.Page;

public interface BookTypeService {
	
	List<BookType> getAllTypes();
	
	Page<BookType> getTypesByPage(int pageNum, int pageSize);
	
	 BookType getTypeByID(int id);
	
	 boolean addType(BookType type);
	
	 boolean updateType(BookType type);
	
	 boolean deleteType(int id);

}
