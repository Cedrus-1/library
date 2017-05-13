package com.service;

import java.util.List;


import com.bean.Reader;
import com.util.Page;

public interface ReaderService {
	
	 List<Reader> getAllReaders();
	
	 Page<Reader> getReaderByPage(int pageNum, int pageSize);
	
	 Reader getReaderByID(int id);

	Reader getReaderByName(String name);
	
	 Page<Reader> queryReader(Reader reader, int pageNum, int pageSize);
	
	 boolean updateReader(Reader reader);
	
	 boolean signIn(Reader reader);
	
	 boolean login(Reader reader);

}
