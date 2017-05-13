package com.service;

import com.bean.Record;
import com.enums.Message;
import com.util.Page;

import java.util.List;

public interface RecordService {

    Record getRecordByID(int id);

    List<Record> getAllRecords();

    List<Record> getRecordsByUserID(int userID);

    Page<Record> queryRecords(Record record, int month,  int pageNum, int pageSize);

    Page<Record> getAlarmRecordsByPage( int pageNum, int pageSize);

    Message borrowBook(int bookID, int readerID, String operator);

    Message returnBook(int recordID, String operator, int rating);

}
