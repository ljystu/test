package com.edu.service;

import com.edu.dao.BookMapper;
import com.edu.pojo.Books;
import org.springframework.stereotype.Service;

import java.util.List;

public class BookServiceImpl implements BookService {

    //调用dao层的操作，设置一个set接口，方便Spring管理
    private BookMapper bookMapper;

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    public int addBook(Books book) {
        return bookMapper.addBook(book);
    }

    public int deleteBookById(int id) {
        return bookMapper.deleteBookById(id);
    }

    public int updateBook(Books books) {
        return bookMapper.updateBook(books);
    }

    public Books queryBookById(int id) {
        return bookMapper.queryBookById(id);
    }

    public List<Books> queryAllBook() {
        return bookMapper.queryAllBook();
    }


    public List<Books> queryBookByNanme(String name) {
        return bookMapper.queryBookByName(name);
    }

    @Override
    public List<Books> queryBook(String name,String Type) {
        if(Type.equals("书籍编号"))
            return bookMapper.queryBook(name,"","","","","");
        else if(Type.equals("全部"))
            return bookMapper.queryBook("all","","","",name,"");
        else if(Type.equals("书籍名称"))
            return bookMapper.queryBook("",name,"","","","");
        else  if (Type.equals("书籍类型"))
            return bookMapper.queryBook("","",name,"","","");
        else  if (Type.equals("书籍关键字"))
            return bookMapper.queryBook("","","",name,"","");
        else
            return bookMapper.queryBook("","","","",name,"");
    }


}
