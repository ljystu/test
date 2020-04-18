package com.edu.service;


import com.edu.dao.ReaderMapper;
import com.edu.pojo.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ReaderService")
public class ReaderServiceImpl implements ReaderService {

    @Autowired
    private ReaderMapper readerMapper;

    public List<Reader> findReaderByName(String name) {
        System.out.println("查找读者");
        return readerMapper.findReaderByName(name);
    }

    @Override
    public int addReader(Reader reader) {
        return readerMapper.addReader(reader);
    }

    @Override
    public int updateReader(Reader reader) {
        return readerMapper.updateReader(reader);
    }

    @Override
    public int deleteReaderById(int id) {
        return readerMapper.deleteReaderById(id);
    }

    @Override
    public Reader findReaderById(int id) {
        return readerMapper.findReaderById(id);
    }

    @Override
    public List<Reader> findAllReader() {
        return readerMapper.findAllReader();
    }

    @Override
    public Reader loginReader(Reader reader) {
        return readerMapper.loginReader(reader);
    }

    public String getPassword(int id) {
        return readerMapper.getPassword(id);
    }

    @Override
    public boolean resetPassword(int id, String password) {
        return readerMapper.resetPassword(id, password) > 0;
    }

    @Override
    public int findIdByName(String name) {
        return readerMapper.findIdByName(name);
    }

    @Override
    public Reader getReaderInfo(String readerName) {
        return readerMapper.findReaderInfoByReaderName(readerName);
    }

    @Override
    public int editReaderInfo(Reader readerInfo) {
        return readerMapper.updateReader(readerInfo);
    }

    public ReaderMapper getReaderMapper() {
        return readerMapper;
    }

    public void setReaderMapper(ReaderMapper readerMapper) {
        this.readerMapper = readerMapper;
    }
}
