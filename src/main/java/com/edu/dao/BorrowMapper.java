package com.edu.dao;


import com.edu.pojo.Borrow;
import com.edu.pojo.Reader;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BorrowMapper {

    int addBorrow(Borrow borrow);

    int updateBorrow(Borrow borrow);

    int returnById(@Param("idbookBorrow") int id);

    Borrow findBorrowById(@Param("idbookBorrow") int id);

    List<Borrow> findBorrowByReader(@Param("readerId") int readerId);

    List<Borrow> findBorrowByBook(@Param("bookId") int bookId);

    List<Borrow> findAllBorrow();

}
