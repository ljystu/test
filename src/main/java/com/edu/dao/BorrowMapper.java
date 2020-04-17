package com.edu.dao;


import com.edu.pojo.Borrow;
import com.edu.pojo.Reader;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BorrowMapper {

    boolean addBorrow(Borrow borrow);

    int updateBorrow(@Param("sta") String sta, @Param("now") String now);

    int renewBorrow(@Param("newReturnDate") String newReturnDate, @Param("bookBorrowId") int id);

    int returnById(@Param("sta") String sta, @Param("bookBorrowId") int id);

    Borrow findBorrowById( @Param("bookBorrowId") int id);

    int findReaderIdByName(@Param("readerName") String name);

    List<Borrow> findBorrowByReader(@Param("nosta") String nosta, @Param("readerId") int readerId);

    String findReturnDateById(@Param("bookBorrowId") int id);

    List<Borrow> findBorrowByBook(@Param("bookId") int bookId);

    List<Borrow> findAllBorrow();

    //寻找状态外待确认的借阅记录
    List<Borrow> findRequest(@Param("sta") String sta);

}
