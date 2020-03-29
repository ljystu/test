package com.edu.service;


import com.edu.dao.ReaderMapper;
import com.edu.pojo.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ReaderService")
public class ReaderServiceImpl implements ReaderService{

    @Autowired
    private ReaderMapper readerMapper;

    public Reader findReaderByName(String name){
        System.out.println("查找读者");
        return readerMapper.findReaderByName(name);
    }

    public ReaderMapper getReaderMapper() {
        return readerMapper;
    }

    public void setReaderMapper(ReaderMapper readerMapper) {
        this.readerMapper = readerMapper;
    }
}
