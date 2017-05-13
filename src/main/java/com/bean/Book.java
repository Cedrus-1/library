package com.bean;

import java.util.Date;

public class Book {
    private int bookID;
    private String bookName;
    private String publish;
    private String author;
    private int bookTypeID;
    private String translator;
    private String ISBN;
    private float price;
    private Date inTime;
    private int totalNumber;
    private int nowNumber;
    private String bookTypeName;
    private String description;
    private float rating;
    private int borrowTimes;
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
    public String getPublish() {
        return publish;
    }
    public void setPublish(String publish) {
        this.publish = publish;
    }
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public int getBookTypeID() {
        return bookTypeID;
    }
    public void setBookTypeID(int bookTypeID) {
        this.bookTypeID = bookTypeID;
    }
    public String getTranslator() {
        return translator;
    }
    public void setTranslator(String translator) {
        this.translator = translator;
    }
    public String getISBN() {
        return ISBN;
    }
    public void setISBN(String iSBN) {
        ISBN = iSBN;
    }
    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }
    public Date getInTime() {
        return inTime;
    }
    public void setInTime(Date inTime) {
        this.inTime = inTime;
    }
    public int getTotalNumber() {
        return totalNumber;
    }
    public void setTotalNumber(int totalNumber) {
        this.totalNumber = totalNumber;
    }
    public int getNowNumber() {
        return nowNumber;
    }
    public void setNowNumber(int nowNumber) {
        this.nowNumber = nowNumber;
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

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public int getBorrowTimes() {
        return borrowTimes;
    }

    public void setBorrowTimes(int borrowTimes) {
        this.borrowTimes = borrowTimes;
    }

    @Override
    public String toString() {
        return "Book [bookID=" + bookID + ", bookName=" + bookName + ", publish=" + publish + ", author=" + author
                + ", bookTypeID=" + bookTypeID + ", translator=" + translator + ", ISBN=" + ISBN + ", price=" + price
                + ", inTime=" + inTime + ", totalNumber=" + totalNumber + ", nowNumber=" + nowNumber + ", bookTypeName="
                + bookTypeName + "]";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Book)) return false;

        Book book = (Book) o;

        if (getBookID() != book.getBookID()) return false;
        if (getBookTypeID() != book.getBookTypeID()) return false;
        if (Float.compare(book.getPrice(), getPrice()) != 0) return false;
        if (getTotalNumber() != book.getTotalNumber()) return false;
        if (getNowNumber() != book.getNowNumber()) return false;
        if (Float.compare(book.getRating(), getRating()) != 0) return false;
        if (getBorrowTimes() != book.getBorrowTimes()) return false;
        if (getBookName() != null ? !getBookName().equals(book.getBookName()) : book.getBookName() != null)
            return false;
        if (getPublish() != null ? !getPublish().equals(book.getPublish()) : book.getPublish() != null) return false;
        if (getAuthor() != null ? !getAuthor().equals(book.getAuthor()) : book.getAuthor() != null) return false;
        if (getTranslator() != null ? !getTranslator().equals(book.getTranslator()) : book.getTranslator() != null)
            return false;
        if (getISBN() != null ? !getISBN().equals(book.getISBN()) : book.getISBN() != null) return false;
        if (getInTime() != null ? !getInTime().equals(book.getInTime()) : book.getInTime() != null) return false;
        if (getBookTypeName() != null ? !getBookTypeName().equals(book.getBookTypeName()) : book.getBookTypeName() != null)
            return false;
        return getDescription() != null ? getDescription().equals(book.getDescription()) : book.getDescription() == null;
    }

    @Override
    public int hashCode() {
        int result = getBookID();
        result = 31 * result + (getBookName() != null ? getBookName().hashCode() : 0);
        result = 31 * result + (getPublish() != null ? getPublish().hashCode() : 0);
        result = 31 * result + (getAuthor() != null ? getAuthor().hashCode() : 0);
        result = 31 * result + getBookTypeID();
        result = 31 * result + (getTranslator() != null ? getTranslator().hashCode() : 0);
        result = 31 * result + (getISBN() != null ? getISBN().hashCode() : 0);
        result = 31 * result + (getPrice() != +0.0f ? Float.floatToIntBits(getPrice()) : 0);
        result = 31 * result + (getInTime() != null ? getInTime().hashCode() : 0);
        result = 31 * result + getTotalNumber();
        result = 31 * result + getNowNumber();
        result = 31 * result + (getBookTypeName() != null ? getBookTypeName().hashCode() : 0);
        result = 31 * result + (getDescription() != null ? getDescription().hashCode() : 0);
        result = 31 * result + (getRating() != +0.0f ? Float.floatToIntBits(getRating()) : 0);
        result = 31 * result + getBorrowTimes();
        return result;
    }
}
