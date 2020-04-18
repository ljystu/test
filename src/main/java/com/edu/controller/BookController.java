package com.edu.controller;

import com.edu.pojo.Books;
import com.edu.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    @RequestMapping("/allBook")
    public String list(Model model) {
        List<Books> list = bookService.queryAllBook();
        model.addAttribute("list", list);
        return "admin_allBook";
    }

    @RequestMapping("/reader_allBook")
    public String reader_allBook(Model model) {
        List<Books> list = bookService.queryAllBook();
        model.addAttribute("list", list);
        return "reader_allBook";
    }

    @RequestMapping("/toAddBook")
    public String toAddPaper() {
        return "admin_addBook";
    }

    @RequestMapping("/addBook")
    public String addPaper(Books books) {
        System.out.println(books);
        bookService.addBook(books);
        return "redirect:/book/allBook";
    }

    @RequestMapping("/toUpdateBook")
    public String toUpdateBook(Model model, int id) {
        Books books = bookService.queryBookById(id);
        System.out.println(books);
        model.addAttribute("book", books);
        return "admin_updateBook";
    }

    @RequestMapping("/updateBook")
    public String updateBook(Model model, Books book) {
        System.out.println(book);
        bookService.updateBook(book);
        Books books = bookService.queryBookById(book.getBookID());
        model.addAttribute("books", books);
        return "redirect:/book/allBook";
    }

    @RequestMapping("/del/{bookId}")
    public String deleteBook(@PathVariable("bookId") int id) {
        System.out.println(id);
        bookService.deleteBookById(id);
        return "redirect:/book/allBook";
    }

    @RequestMapping("/QueryBookByName")
    public String QueryBookByName(Model model, @RequestParam(name="bookName") String name) {
        System.out.println(name);
        List<Books> list = bookService.queryBookByNanme(name);
        System.out.println(list.toString());
        model.addAttribute("list", list);
        return "admin_allBook";
    }
    @RequestMapping("adminQueryBook")
    public String QueryBook(HttpServletRequest request, HttpSession session,Model model){
        String keyword=request.getParameter("keyword");
        String searchType=request.getParameter("searchType");
        System.out.println(keyword+" "+searchType);

        if(keyword.equals("")){
            List<Books> list = bookService.queryAllBook();
            model.addAttribute("list", list);
            return "admin_allBook";
        }

        if(searchType.equals("全部")&&keyword.equals("")){
           List<Books> list=bookService.queryBook(keyword,"");
            System.out.println(list.toString());
            model.addAttribute("list", list);
            return "admin_allBook";
        }
        else{
            List<Books> list=bookService.queryBook(keyword,searchType);
            System.out.println(list.toString());
            model.addAttribute("list", list);
            return "admin_allBook";
        }
    }
    @RequestMapping("readerQueryBook")
    public String readerQueryBook(HttpServletRequest request, HttpSession session,Model model){
        String keyword=request.getParameter("keyword");
        String searchType=request.getParameter("searchType");
        System.out.println(keyword+" "+searchType);

        if(keyword==""){
            List<Books> list = bookService.queryAllBook();
            model.addAttribute("list", list);
            return "reader_allBook";
        }

        if(searchType.equals("全部")&&keyword.equals("")){
            List<Books> list=bookService.queryBook(keyword,"");
            System.out.println(list.toString());
            model.addAttribute("list", list);
            return "reader_allBook";
        }
        else{
            List<Books> list=bookService.queryBook(keyword,searchType);
            System.out.println(list.toString());
            model.addAttribute("list", list);
            return "reader_allBook";
        }
    }


    @RequestMapping("/admin_header.html")
    public ModelAndView admin_header() { return new ModelAndView("admin_header");  }

    @RequestMapping("/reader_header.html")
    public ModelAndView reader_header() {
        return new ModelAndView("reader_header");
    }

}
