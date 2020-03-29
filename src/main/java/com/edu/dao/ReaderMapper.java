package com.edu.dao;


import com.edu.pojo.Reader;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface ReaderMapper {


    @Select("select * from readers where readerName = #{readerName}")
    Reader findReaderByName(@Param("readerName")String name);
}
