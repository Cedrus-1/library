package com.service;

import java.util.List;

import com.bean.ReaderType;
import com.util.Page;

public interface ReaderTypeService {
	 List<ReaderType> getAllTypes();
	
	 Page<ReaderType> getTypesByPage(int pageNum, int pageSize);
	
	 ReaderType getTypeByID(int id);
	
	 boolean addType(ReaderType type);
	
	 boolean updateType(ReaderType type);
	
	 boolean deleteType(int id);

}
