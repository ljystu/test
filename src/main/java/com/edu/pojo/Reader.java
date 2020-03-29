package com.edu.pojo;

import java.io.Serializable;

public class Reader implements Serializable {
    private int readerId;
    private String readerName;
    private String readerType;
    private String readerSex;
    private int readerBooks;
    private String rentDate;
    private  String readerNote;


    public int getReaderId() {
        return readerId;
    }

    public void setReaderId(int readerId) {
        this.readerId = readerId;
    }

    public String getReaderName() {
        return readerName;
    }

    public void setReaderName(String readerName) {
        this.readerName = readerName;
    }

    public String getReaderType() {
        return readerType;
    }

    public void setReaderType(String readerType) {
        this.readerType = readerType;
    }

    public String getReaderSex() {
        return readerSex;
    }

    public void setReaderSex(String readerSex) {
        this.readerSex = readerSex;
    }

    public int getReaderBooks() {
        return readerBooks;
    }

    public void setReaderBooks(int readerBooks) {
        this.readerBooks = readerBooks;
    }

    public String getRentDate() {
        return rentDate;
    }

    public void setRentDate(String rentDate) {
        this.rentDate = rentDate;
    }

    public String getReaderNote() {
        return readerNote;
    }

    public void setReaderNote(String readerNote) {
        this.readerNote = readerNote;
    }

    @Override
    public String toString() {
        return "Reader{" +
                "readerId=" + readerId +
                ", readerName='" + readerName + '\'' +
                ", readerType='" + readerType + '\'' +
                ", readerSex='" + readerSex + '\'' +
                ", readerBooks=" + readerBooks +
                ", rentDate='" + rentDate + '\'' +
                ", readerNote='" + readerNote + '\'' +
                '}';
    }
}
