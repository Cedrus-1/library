package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Reader;
import com.bean.ReaderType;
import com.persistence.ReaderMapper;
import com.persistence.ReaderTypeMapper;
import com.service.ReaderTypeService;
import com.util.Page;

@Service
public class ReaderTypeServiceImpl implements ReaderTypeService {
	@Autowired
	private ReaderTypeMapper readerTypeMapper;
	@Autowired
	private ReaderMapper readerMapper;

	@Override
	public List<ReaderType> getAllTypes() {
		return readerTypeMapper.getAllTypes();
	}

	@Override
	public Page<ReaderType> getTypesByPage(int pageNum, int pageSize) {
		pageNum = (pageNum>0)?pageNum:1;
		List<ReaderType> query = readerTypeMapper.getTypesByPage((pageNum-1)*pageSize, pageSize);
		int totalRecords = readerTypeMapper.getTypesCount();
		
		Page<ReaderType> result = new Page<ReaderType>();
		result.setPageIndex(pageNum);
		result.setPageSize(pageSize);
		result.setTotalRecords(totalRecords);
		result.setPageDatas(query);
		return result;
	}

	@Override
	public ReaderType getTypeByID(int id) {
		return readerTypeMapper.getTypeByID(id);
	}

	@Override
	public boolean addType(ReaderType type) {
		List<ReaderType> types = readerTypeMapper.getAllTypes();
		for(ReaderType t : types){
			if(t.getName().equals(type)){
				return false;
			}
		}
		if(readerTypeMapper.addType(type)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateType(ReaderType type) {
		List<ReaderType> types = readerTypeMapper.getAllTypes();
		for(ReaderType b :types){
			if(b.getReaderTypeID()==type.getReaderTypeID()){
				continue;
			}
			if(b.getName().equals(type.getName())){
				return false;
			}
		}
		if(readerTypeMapper.updateType(type)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteType(int id) {
		List<Reader> readers = readerMapper.getAllReaders();
		for(Reader r:readers){
			if(r.getReaderTypeID() == id){
				return false;
			}
		}
		if(readerTypeMapper.deleteType(id)>0){
			return true;
		}
		return false;
	}

}
