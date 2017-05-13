package com.bean;

public class ReaderType {
    private int readerTypeID;
    private String name;
    private String description;
    private int books;
    private int days;

    public int getReaderTypeID() {
        return readerTypeID;
    }

    public void setReaderTypeID(int readerTypeID) {
        this.readerTypeID = readerTypeID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
}
