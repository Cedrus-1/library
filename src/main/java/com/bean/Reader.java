package com.bean;

public class Reader {
	private int readerID;
	private int readerTypeID;
	private String userName;
	private int sex;
	private int age;
	private String password;
	private String phone;
	private String readerTypeName;
	private int books;
	private int days;
	private int borrowBookNum;

	public int getReaderID() {
		return readerID;
	}
	public void setReaderID(int readerID) {
		this.readerID = readerID;
	}
	public int getReaderTypeID() {
		return readerTypeID;
	}
	public void setReaderTypeID(int readerTypeID) {
		this.readerTypeID = readerTypeID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReaderTypeName() {
		return readerTypeName;
	}
	public void setReaderTypeName(String readerTypeName) {
		this.readerTypeName = readerTypeName;
	}
	public int getBooks() {
		return books;
	}
	public void setBooks(int books) {
		this.books = books;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public int getBorrowBookNum() {
		return borrowBookNum;
	}
	public void setBorrowBookNum(int borrowBookNum) {
		this.borrowBookNum = borrowBookNum;
	}
}
