package com.edu.service;

import com.edu.pojo.Borrow;
import com.edu.pojo.Reader;

import java.util.List;

public interface BorrowService {

   int findReaderIdByName(String name);

   int addBorrow(Borrow borrow);

   int updateBorrow(Borrow borrow);

   int returnById(int id);

   Borrow findBorrowById(int id);

   List<Borrow> findBorrowByReader(int readerId);

   List<Borrow> findBorrowByBook(int bookId);

   List<Borrow> findAllBorrow();


}
