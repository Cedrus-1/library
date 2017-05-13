package com.persistence;

import java.util.List;

import com.bean.BookType;

public interface BookTypeMapper {
	
	 List<BookType> getAllTypes();
	
	 List<BookType> getTypesByPage(int start, int num);
	
	 int getTypesCount();
	
	 BookType getTypeByID(int id);
	
	 int addType(BookType type);
	
	 int updateType(BookType type);
	
	 int deleteType(int id);

}
