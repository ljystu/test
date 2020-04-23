package com.edu.service;

import com.edu.pojo.Borrow;
import com.edu.pojo.Reader;
import com.edu.pojo.Books;
import java.util.List;

public interface BorrowService {

   int findReaderIdByName(String name);

   boolean addBorrow(Borrow borrow);

   boolean updateBookCounts(int id, int counts);

   int updateBorrow(String sta, String now);

   int renewBorrow(String newReturnDate, int id);

   int returnById(String sta, int id);

   int addReaderBooks(int id, int books);

   Books queryBookById(int id);

   Reader findReaderById(int id);

   String findReturnDateById (int id);

   String findBorrowDateById (int id);

   Borrow findBorrowById(int id);

   List<Borrow> findBorrowByReader(String nosta, int readerId);

   List<Borrow> findBorrowByReaderAndBookAndSta(int readerId, int bookId, String sta);

   List<Borrow> findBorrowByBook(int bookId);

   //寻找所有的借阅记录
   List<Borrow> findAllBorrow();

   //按条件查询借阅记录
   List<Borrow> findBorrow(String name,String Type);

   //寻找所有状态为“待确认”的借阅记录
   List<Borrow> findRequest(String sta);

   //寻找指定状态和用户的借书记录
   List<Borrow> findBorrowByStaAndReader(String sta, int readerId);
}
