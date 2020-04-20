package com.edu.dao;

import com.edu.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {

    boolean updateBookCounts( @Param("bookId") int id, @Param("bookCounts") int counts);

    //增加一个Book
    int addBook(Books book);

    //根据id删除一个Book
    int deleteBookById(@Param("bookId") int id);

    //更新Book
    int updateBook(Books books);

    //根据id查询,返回一个Book
    Books queryBookById(@Param("bookId") int id);

    //查询全部Book,返回list集合
    List<Books> queryAllBook();

    List<Books> queryBookByName(@Param("bookName") String name);

    List<Books> queryBook(@Param("bookId") String bookId,@Param("bookName") String bookName,
                          @Param("bookType") String bookType,@Param("bookKeyword")String bookKeyword,
                          @Param("detail")String detail,String all);
}
