package com.bean;

/**
 * Created by Cedrus on 2017/4/23.
 */
public class BookType {
    private int bookTypeID;
    private String bookTypeName;
    private String description;

    public int getBookTypeID() {
        return bookTypeID;
    }

    public void setBookTypeID(int bookTypeID) {
        this.bookTypeID = bookTypeID;
    }

    public String getBookTypeName() {
        return bookTypeName;
    }

    public void setBookTypeName(String bookTypeName) {
        this.bookTypeName = bookTypeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "BookType{" +
                "bookTypeID=" + bookTypeID +
                ", bookTypeName='" + bookTypeName + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
