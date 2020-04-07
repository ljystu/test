package com.edu.controller;

import com.edu.pojo.Borrow;
import com.edu.pojo.Reader;
import com.edu.service.BookService;
import com.edu.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/Borrow")
public class BorrowController {

    @Autowired
    @Qualifier("BorrowService")
    private BorrowService borrowService;

    @RequestMapping("/allBorrow")
    public String list(Model model) {
        List<Borrow> list = borrowService.findAllBorrow();
        model.addAttribute("list", list);
        return "admin_borrow";
    }

    @RequestMapping("/readerBorrow")
    public String readerBorrowList(Model model, HttpServletRequest request) {
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        String name = reader.getReaderName();
        int id = borrowService.findReaderIdByName(name);
        List<Borrow> list = borrowService.findBorrowByReader(id);
        model.addAttribute("list", list);
        return "reader_borrow";
    }

    @RequestMapping("/toAddBorrow")
    public String toAddPaper() { return "addBorrow"; }

    @RequestMapping("/addBorrow")
    public String addPaper(Borrow borrow) {
        System.out.println(borrow);
        borrowService.addBorrow(borrow);
        return "redirect:/book/allBook";
    }


    @RequestMapping("/return/{borrowId}")
    public String return1(@PathVariable("borrowId") int id) {
        System.out.println(id);
        borrowService.returnById(id);
        return "redirect:/Borrow/allBorrow";
    }



    @RequestMapping("/admin_header.html")
    public ModelAndView admin_header() { return new ModelAndView("admin_header");  }

    @RequestMapping("/reader_header.html")
    public ModelAndView reader_header() {
        return new ModelAndView("reader_header");
    }

}
