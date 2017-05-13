package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Reader;
import com.bean.ReaderType;
import com.persistence.ReaderMapper;
import com.persistence.ReaderTypeMapper;
import com.service.ReaderService;
import com.util.Page;

@Service
public class ReaderServiceImpl implements ReaderService {
	@Autowired
	private ReaderMapper readerMapper;
	@Autowired
	private ReaderTypeMapper readTypeMapper;

	@Override
	public List<Reader> getAllReaders() {
		return readerMapper.getAllReaders();
	}

	@Override
	public Page<Reader> getReaderByPage(int pageNum, int pageSize) {
		pageNum = (pageNum>0)?pageNum:1;
		List<Reader> query = readerMapper.getReaderByPage((pageNum-1)*pageSize, pageSize);
		int totalRecords = readerMapper.getReaderCount();
		List<Reader> readers = new ArrayList<Reader>();
		ReaderType type = new ReaderType();
		for(Reader r:query){
			type = readTypeMapper.getTypeByID(r.getReaderTypeID());
			r.setReaderTypeName(type.getName());
			r.setBooks(type.getBooks());
			r.setDays(type.getDays());
			readers.add(r);
		}
		Page<Reader> result = new Page<Reader>();
		result.setPageIndex(pageNum);
		result.setPageSize(pageSize);
		result.setTotalRecords(totalRecords);
		result.setPageDatas(readers);
		return result;
	}


	@Override
	public Reader getReaderByID(int id) {
		Reader reader = readerMapper.getReaderByID(id);
		if(reader==null){
			return null;
		}
		ReaderType type = readTypeMapper.getTypeByID(reader.getReaderTypeID());
		reader.setBooks(type.getBooks());
		reader.setReaderTypeName(type.getName());
		reader.setDays(type.getDays());
		return reader;
	}

	@Override
	public Reader getReaderByName(String name) {
		Reader reader = readerMapper.getReaderByName(name);
		if(reader==null){
			return null;
		}
		ReaderType type = readTypeMapper.getTypeByID(reader.getReaderTypeID());
		reader.setBooks(type.getBooks());
		reader.setReaderTypeName(type.getName());
		reader.setDays(type.getDays());
		return reader;
	}

	@Override
	public Page<Reader> queryReader(Reader reader, int pageNum, int pageSize) {
		pageNum = (pageNum>0)?pageNum:1;
		List<Reader> query = readerMapper.queryReader(reader, (pageNum-1)*pageSize, pageSize);
		int totalRecords = readerMapper.queryReaderCount(reader);
		List<Reader> readers = new ArrayList<Reader>();
		ReaderType type = new ReaderType();
		for(Reader r:query){
			type = readTypeMapper.getTypeByID(r.getReaderTypeID());
			r.setReaderTypeName(type.getName());
			r.setDays(type.getDays());
			r.setBooks(type.getBooks());
			readers.add(r);
		}
		Page<Reader> result = new Page<Reader>();
		result.setPageIndex(pageNum);
		result.setPageSize(pageSize);
		result.setTotalRecords(totalRecords);
		result.setPageDatas(readers);
		return result;
	}

	@Override
	public boolean updateReader(Reader reader) {
		if(readerMapper.updateReader(reader)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean signIn(Reader reader) {
		Reader r = readerMapper.getReaderByName(reader.getUserName());
		if(r==null){
			if(readerMapper.addReader(reader)>0){
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean login(Reader reader) {
		if(readerMapper.login(reader.getUserName(), reader.getPassword())>0){
			return true;
		}
		return false;
	}

}
