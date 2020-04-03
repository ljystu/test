package com.edu.service;

import com.edu.pojo.Borrow;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BorrowService {

   int addBorrow(Borrow borrow);

   int updateBorrow(Borrow borrow);

   int returnById(int id);

   Borrow findBorrowById(int id);

   List<Borrow> findBorrowByReader(int readerId);

   List<Borrow> findBorrowByBook(int bookId);

   List<Borrow> findAllBorrow();


}
