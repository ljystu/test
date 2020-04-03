package com.edu.pojo;

import java.io.Serializable;

public class Borrow implements Serializable {

    private int idbookBorrow;
    private int bookId;
    private int readerId;

    private String borrowDate;
    private String returnDate;

    private String sta;
    @Override
    public String toString() {
        return "Borrow{" +
                "idbookBorrow=" + idbookBorrow +
                ", bookId='" + bookId + '\'' +
                ", readerId=" + readerId + '\'' +
                ", borrowDate='" + borrowDate + '\'' +
                ", returnDate='" + returnDate + '\'' +
                ", sta='" + sta + '\'' +
                '}';
    }
    public Borrow() {
    }

    public Borrow(int idbookBorrow, int bookID, int readerId, String borrowDate, String returnDate, String sta) {
        this.idbookBorrow = idbookBorrow;
        this.bookId = bookID;
        this.readerId = readerId;
        this.borrowDate = borrowDate;
        this.returnDate = returnDate;
        this.sta = sta;
    }


    public int getIdbookBorrow() {
        return idbookBorrow;
    }

    public void setIdbookBorrow(int idbookBorrow) {
        this.idbookBorrow = idbookBorrow;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getReaderId() { return readerId; }

    public void setReaderId(int readerId) {
        this.readerId = readerId;
    }

    public String getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(String borrowDate) {
        this.borrowDate = borrowDate;
    }

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
}