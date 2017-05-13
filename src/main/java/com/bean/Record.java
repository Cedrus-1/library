package com.bean;

import java.util.Date;

public class Record {
	private int recordID;
	private int bookID;
	private String bookName;
	private int readerID;
	private String readerName;
	private Date borrowTime;
	private Date dueTime;
	private int isReturn;
	private String borrowOperator;
	private Date returnTime;
	private String returnOperator;
	private int rating;

	public int getRecordID() {
		return recordID;
	}

	public void setRecordID(int recordID) {
		this.recordID = recordID;
	}

	public int getBookID() {
		return bookID;
	}

	public void setBookID(int bookID) {
		this.bookID = bookID;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getReaderID() {
		return readerID;
	}

	public void setReaderID(int readerID) {
		this.readerID = readerID;
	}

	public String getReaderName() {
		return readerName;
	}

	public void setReaderName(String readerName) {
		this.readerName = readerName;
	}

	public Date getBorrowTime() {
		return borrowTime;
	}

	public void setBorrowTime(Date borrowTime) {
		this.borrowTime = borrowTime;
	}

	public Date getDueTime() {
		return dueTime;
	}

	public void setDueTime(Date dueTime) {
		this.dueTime = dueTime;
	}

	public int getIsReturn() {
		return isReturn;
	}

	public void setIsReturn(int isReturn) {
		this.isReturn = isReturn;
	}

	public String getBorrowOperator() {
		return borrowOperator;
	}

	public void setBorrowOperator(String borrowOperator) {
		this.borrowOperator = borrowOperator;
	}

	public Date getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}

	public String getReturnOperator() {
		return returnOperator;
	}

	public void setReturnOperator(String returnOperator) {
		this.returnOperator = returnOperator;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}
}
