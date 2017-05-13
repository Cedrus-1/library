package com.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.bean.*;
import com.persistence.ReaderTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enums.Message;
import com.enums.State;
import com.persistence.BookMapper;
import com.persistence.ReaderMapper;
import com.persistence.RecordMapper;
import com.service.RecordService;
import com.util.Page;

@Service
public class RecordServiceImpl implements RecordService {
	@Autowired
	private RecordMapper recordMapper;
	@Autowired
	private ReaderMapper readerMapper;
	@Autowired
	private BookMapper bookMapper;
	@Autowired
	private ReaderTypeMapper readerTypeMapper;

	@Override
	public Record getRecordByID(int id) {
		return recordMapper.getRecordByID(id);
	}

	@Override
	public List<Record> getAllRecords() {
		return recordMapper.getAllRecords();
	}

	@Override
	public List<Record> getRecordsByUserID(int userID) {
		return recordMapper.getRecordsByUserID(userID);
	}

	@Override
	public Page<Record> queryRecords(Record record,int month, int pageNum, int pageSize) {
		pageNum = (pageNum>0)?pageNum:1;
		List<Record> query = recordMapper.queryRecords(record, month,(pageNum-1)*pageSize, pageSize);
		int totalRecords = recordMapper.queryRecordsCount(record, month);
		Page<Record> result = new Page<Record>();
		result.setPageIndex(pageNum);
		result.setPageSize(pageSize);
		result.setTotalRecords(totalRecords);
		result.setPageDatas(query);
		return result;
	}

	@Override
	public Page<Record> getAlarmRecordsByPage(int pageNum, int pageSize){
		pageNum = (pageNum>0)?pageNum:1;
		List<Record> query = recordMapper.getAlarmRecordsByPage((pageNum-1)*pageSize, pageSize);
		int totalRecords = recordMapper.getAlarmRecordsCount();
		Page<Record> result = new Page<Record>();
		result.setPageIndex(pageNum);
		result.setPageSize(pageSize);
		result.setTotalRecords(totalRecords);
		result.setPageDatas(query);
		return result;
	}

	@Transactional
	@Override
	public Message borrowBook(int bookID, int readerID, String operator) {
		Record record = new Record();
		record.setBookID(bookID);
		record.setReaderID(readerID);
		Reader reader = readerMapper.getReaderByID(readerID);
		record.setReaderName(reader.getUserName());
		ReaderType readerType = readerTypeMapper.getTypeByID(reader.getReaderTypeID());
		reader.setDays(readerType.getDays());
		reader.setBooks(readerType.getBooks());
		Book book = bookMapper.getBookByID(bookID);
		record.setBookName(book.getBookName());
		Message message = new Message();
			if(book.getNowNumber()<=0){
				message.state = State.ERROR;
				message.setMessage("存货不足");
				return message;
			}
			if(reader.getBorrowBookNum()>=readerType.getBooks()){
				message.state = State.ERROR;
				message.setMessage("该用户已达到借书上限，请先归还图书！");
				return message;
			}
			reader.setBorrowBookNum(reader.getBorrowBookNum()+1);
			if(readerMapper.updateReader(reader)<=0){
				message.state = State.ERROR;
				message.setMessage("借书失败");
				return message;
			}
			book.setNowNumber(book.getNowNumber()-1);
			book.setBorrowTimes(book.getBorrowTimes()+1);
			if(bookMapper.updateBook(book)<=0){
				message.state = State.ERROR;
				message.setMessage("借书失败");
				return message;
			}
			Date now = new Date();
			Calendar calendar = Calendar.getInstance();
	        calendar.add(Calendar.DATE, reader.getDays());
	        Date dueTime = calendar.getTime();
	        record.setBorrowTime(now);
	        record.setDueTime(dueTime);
	        record.setBorrowOperator(operator);
	        if(recordMapper.addRecord(record)>0){
	        	message.state = State.SUCCESS;
				message.setMessage("借书成功");
				return message;
	        }
		message.state = State.ERROR;
		message.setMessage("借书失败");
		return message;
	}

	@Transactional
	@Override
	public Message returnBook(int recordID, String operator, int rating) {
		Record record = recordMapper.getRecordByID(recordID);
		Message message = new Message();
		if(record.getIsReturn()==1){
			message.state = State.ERROR;
			message.setMessage("该书已经还了！");
			return message;
		}
		record.setReturnOperator(operator);
		record.setRating(rating);
		Date now = new Date();
		record.setReturnTime(now);
		Book book = bookMapper.getBookByID(record.getBookID());
		float bookRating = ((book.getBorrowTimes()-book.getTotalNumber()+book.getNowNumber())*book.getRating()+rating)/(book.getBorrowTimes()-book.getTotalNumber()+book.getNowNumber()+1);
		book.setRating(bookRating);
		book.setNowNumber(book.getNowNumber()+1);
		Reader reader = readerMapper.getReaderByID(record.getReaderID());
		reader.setBorrowBookNum(reader.getBorrowBookNum()-1);
		if(readerMapper.updateReader(reader)>0 && bookMapper.updateBook(book)>0 && recordMapper.updateRecord(record)>0){
			message.state=State.SUCCESS;
			message.setMessage("还书成功！");
			return message;
		}
		message.state=State.ERROR;
		message.setMessage("还书失败");
		return message;
	}

}
