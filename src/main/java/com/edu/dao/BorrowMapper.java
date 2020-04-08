package com.edu.dao;


import com.edu.pojo.Borrow;
import com.edu.pojo.Reader;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BorrowMapper {

    boolean addBorrow(Borrow borrow);

    int updateBorrow(Borrow borrow);

    int returnById(@Param("sta") String sta, @Param("idbookBorrow") int id);

    Borrow findBorrowById(@Param("idbookBorrow") int id);

    int findReaderIdByName(@Param("readerName") String name);

    List<Borrow> findBorrowByReader(@Param("readerId") int readerId);

    List<Borrow> findBorrowByBook(@Param("bookId") int bookId);

    List<Borrow> findAllBorrow();


    //寻找状态外待确认的借阅记录
    List<Borrow> findRequest(@Param("sta") String sta);

}
