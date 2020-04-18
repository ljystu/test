package com.edu.dao;


import com.edu.pojo.Reader;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReaderMapper {

    int addReader(Reader reader);

    int updateReader(Reader reader);

    int deleteReaderById(@Param("readerId") int id);

    Reader findReaderById(@Param("readerId") int id);

    List<Reader> findReaderByName(@Param("readerName") String name);

    List<Reader> findAllReader();

    Reader loginReader(Reader reader);

    String getPassword(@Param("readerId") int id);

    int resetPassword(@Param("readerId") int id, @Param("readerPwd") String password);

    int findIdByName(@Param("readerName") String name);

    Reader findReaderInfoByReaderName(@Param("readerName") String readerName);
}
