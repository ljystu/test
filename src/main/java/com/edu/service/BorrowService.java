package com.edu.service;

import com.edu.pojo.Borrow;

import java.util.List;

public interface BorrowService {

   int findReaderIdByName(String name);

   boolean addBorrow(Borrow borrow);

   int updateBorrow(String sta, String now);

   int renewBorrow(String newReturnDate, int id);

   int returnById(String sta, int id);

   String findBookNameByBookId(int id);

   String findReturnDateById (int id);

   Borrow findBorrowById(int id);

   List<Borrow> findBorrowByReader(String nosta, int readerId);

   List<Borrow> findBorrowByBook(int bookId);

   List<Borrow> findAllBorrow();

   //寻找所有状态为“待确认”的借阅记录
   List<Borrow> findRequest(String sta);


}
