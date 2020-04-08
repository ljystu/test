package com.edu.service;

import com.edu.pojo.Borrow;

import java.util.List;

public interface BorrowService {

   int findReaderIdByName(String name);

   boolean addBorrow(Borrow borrow);

   int updateBorrow(Borrow borrow);

   int returnById(String sta, int id);

   Borrow findBorrowById(int id);

   List<Borrow> findBorrowByReader(String nosta, int readerId);

   List<Borrow> findBorrowByBook(int bookId);

   List<Borrow> findAllBorrow();

   //寻找所有状态为“待确认”的借阅记录
   List<Borrow> findRequest(String sta);


}
