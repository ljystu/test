package com.edu.service;


import com.edu.dao.BorrowMapper;
import com.edu.dao.BookMapper;
import com.edu.dao.ReaderMapper;
import com.edu.pojo.Borrow;
import com.edu.pojo.Books;
import com.edu.pojo.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("BorrowService")
public class BorrowServiceImpl implements BorrowService{

    @Autowired
    private BorrowMapper borrowMapper;

    @Autowired
    private BookMapper bookMapper;

    @Autowired
    private ReaderMapper readerMapper;

    @Override
    public boolean addBorrow(Borrow borrow) { return borrowMapper.addBorrow(borrow); }

    @Override
    public int updateBorrow(String sta, String now) { return borrowMapper.updateBorrow(sta,now); }

    @Override
    public int renewBorrow(String newReturnDate, int id) {
        return borrowMapper.renewBorrow(newReturnDate, id);
    }

    @Override
    public int addReaderBooks(int id, int books) {
        return readerMapper.addReaderBooks(id, books);
    }

    @Override
    public int returnById(String sta, int id) { return borrowMapper.returnById(sta, id); }

    @Override
    public Borrow findBorrowById(int id) {
        return borrowMapper.findBorrowById(id);
    }

    @Override
    public List<Borrow> findBorrowByReader(String nosta, int readerId) {
        return borrowMapper.findBorrowByReader(nosta, readerId);
    }

    @Override
    public List<Borrow> findBorrowByReaderAndBookAndSta(int readerId, int bookId, String sta) {
        return borrowMapper.findBorrowByReaderAndBookAndSta(readerId, bookId,sta);
    }

    @Override
    public Books queryBookById(int id) { return bookMapper.queryBookById(id); }

    @Override
    public Reader findReaderById(int id) { return readerMapper.findReaderById(id); }

    @Override
    public boolean updateBookCounts(int id, int counts) { return bookMapper.updateBookCounts(id,counts); }

    @Override
    public String findReturnDateById(int id) { return borrowMapper.findReturnDateById(id); }

    @Override
    public String findBorrowDateById(int id) { return borrowMapper.findBorrowDateById(id); }

    @Override
    public List<Borrow> findBorrowByBook(int bookId) {
        return borrowMapper.findBorrowByBook(bookId);
    }

    @Override
    public List<Borrow> findAllBorrow() {
        return borrowMapper.findAllBorrow();
    }

    @Override
    public List<Borrow> findRequest(String sta) { return borrowMapper.findRequest(sta); }

    @Override
    public List<Borrow> findBorrowByStaAndReader(String sta, int readerId) {
        return borrowMapper.findBorrowByStaAndReader(sta,readerId);
    }

    @Override
    public List<Borrow> findBorrow(String name,String Type) {
        switch (Type) {
            case "图书编号":
                return borrowMapper.findBorrow(name, "", "");
            case "读者编号":
                return borrowMapper.findBorrow("", name, "");
            case "借阅状态":
                return borrowMapper.findBorrow("", "", name);
            default:
                return borrowMapper.findBorrow("", "", "");
        }
    }

    public BorrowMapper getBorrowMapper() {
        return borrowMapper;
    }

    public void setBorrowMapper(BorrowMapper borrowMapper) {
        this.borrowMapper = borrowMapper;
    }

    @Override
    public int findReaderIdByName(String name){ return readerMapper.findIdByName(name); }
}
