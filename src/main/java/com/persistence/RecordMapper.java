package com.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bean.Record;

public interface RecordMapper {
	
	 Record getRecordByID(int id);
	
	 List<Record> getAllRecords();

	List<Record> getRecordsByUserID(int userID);
	
	 List<Record> queryRecords(@Param("record") Record record, @Param("month")int month, int start, int num);
	 int queryRecordsCount(@Param("record") Record record, @Param("month")int month);

	 List<Record> getAlarmRecordsByPage(int start, int num);
	 int getAlarmRecordsCount();
	
	 int addRecord(Record record);
	
	 int updateRecord(Record record);

}
