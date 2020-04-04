package com.edu.service;

import com.edu.pojo.Reader;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReaderService {

    List<Reader> findReaderByName(String name);

    int addReader(Reader reader);

    int updateReader(Reader reader);

    int deleteReaderById(int id);

    Reader findReaderById(int id);

    List<Reader> findAllReader();

    Reader loginReader(Reader reader);

    String getPassword(int id);

    boolean resetPassword(int id, String password);

    int findIdByName(String name);

    Reader getReaderInfo(String readerName);
    int editReaderInfo(Reader readerInfo) ;
}
