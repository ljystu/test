package com.edu.service;
import com.edu.pojo.Books;
import java.awt.print.Book;
import java.util.List;

//BookService:底下需要去实现,调用dao层
public interface BookService {
    //增加一个Book
    int addBook(Books book);
    //根据id删除一个Book
    int deleteBookById(int id);
    //更新Book
    int updateBook(Books books);
    //根据id查询,返回一个Book
    Books queryBookById(int id);
    //查询全部Book,返回list集合
    List<Books> queryAllBook();

    List<Books> queryBookByNanme(String name);

    List<Books> queryBook(String name,String Type);
}
