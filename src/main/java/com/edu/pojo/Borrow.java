package com.edu.pojo;

import java.io.Serializable;

public class Borrow implements Serializable {

    private int bookBorrowId;
    private int bookId;
    private int readerId;
    private String borrowDate;
    private String returnDate;
    private String bookName;
    private Books books;
    private Reader reader;
    private String sta;

    @Override
    public String toString() {
        return "Borrow{" +
                "bookBorrowId=" + bookBorrowId +
                ", bookId='" + bookId + '\'' +
                ", bookName='" + bookName + '\'' +
                ", readerId=" + readerId + '\'' +
                ", borrowDate='" + borrowDate + '\'' +
                ", returnDate='" + returnDate + '\'' +
                ", sta='" + sta + '\'' +
                '}';
    }

    public Borrow() {
    }

    public Borrow(int bookBorrowId, int bookId, String bookName, int readerId, String borrowDate, String returnDate, String sta) {
        this.bookBorrowId = bookBorrowId;
        this.bookId = bookId;
        this.bookName = bookName;
        this.readerId = readerId;
        this.borrowDate = borrowDate;
        this.returnDate = returnDate;
        this.sta = sta;
    }

    public int getbookBorrowId() {
        return bookBorrowId;
    }

    public void setbookBorrowId(int bookBorrowId) {
        this.bookBorrowId = bookBorrowId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) { this.bookName = bookName; }

    public int getReaderId() { return readerId; }

    public void setReaderId(int readerId) {
        this.readerId = readerId;
    }

    public String getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(String borrowDate) { this.borrowDate = borrowDate; }

    public String getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(String returnDate) {
        this.returnDate = returnDate;
    }

    public String getSta() {
        return sta;
    }

    public void setSta(String sta) {
        this.sta = sta;
    }

    public Books getBooks() {
        return books;
    }

    public void setBooks(Books books) {
        this.books = books;
    }

    public Reader getReader() {
        return reader;
    }

    public void setReader(Reader reader) { this.reader = reader; }
}