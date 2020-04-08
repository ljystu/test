package com.edu.service;


import com.edu.dao.BorrowMapper;
import com.edu.pojo.Borrow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("BorrowService")
public class BorrowServiceImpl implements BorrowService{

    @Autowired
    private BorrowMapper borrowMapper;

    @Override
    public boolean addBorrow(Borrow borrow) { return borrowMapper.addBorrow(borrow); }

    @Override
    public int updateBorrow(Borrow borrow) {
        return borrowMapper.updateBorrow(borrow);
    }

    @Override
    public int returnById(String sta, int id) { return borrowMapper.returnById(sta, id); }

    @Override
    public Borrow findBorrowById(int id) {
        return borrowMapper.findBorrowById(id);
    }

    @Override
    public List<Borrow> findBorrowByReader(int readerId) {
        return borrowMapper.findBorrowByReader(readerId);
    }

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

    public BorrowMapper getBorrowMapper() {
        return borrowMapper;
    }

    public void setBorrowMapper(BorrowMapper borrowMapper) {
        this.borrowMapper = borrowMapper;
    }

    @Override
    public int findReaderIdByName(String name){ return this.borrowMapper.findReaderIdByName(name); };
}
