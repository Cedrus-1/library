package com.persistence;

import java.util.List;

import com.bean.ReaderType;

public interface ReaderTypeMapper {
	
	 List<ReaderType> getAllTypes();
	
	 List<ReaderType> getTypesByPage(int start, int num);

	 int getTypesCount();
	
	 ReaderType getTypeByID(int id);
	
	 int addType(ReaderType type);
	
	 int updateType(ReaderType type);
	
	 int deleteType(int id);

}
