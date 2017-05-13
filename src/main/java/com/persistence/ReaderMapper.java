package com.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bean.Reader;

public interface ReaderMapper {
	
	 List<Reader> getAllReaders();
	
	 List<Reader> getReaderByPage(int start, int num);
	
	 int getReaderCount();
	
	 Reader getReaderByID(int id);
	
	 Reader getReaderByName(String userName);
	
	 List<Reader> queryReader(@Param("reader") Reader reader, int start, int num);
	
	 int queryReaderCount(@Param("reader") Reader reader);
	
	 int updateReader(Reader reader);
	
	 int addReader(Reader reader);
	
	 int login(String username, String password);

}
