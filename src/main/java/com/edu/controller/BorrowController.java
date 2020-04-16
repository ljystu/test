package com.edu.controller;

import com.edu.pojo.Borrow;
import com.edu.pojo.Reader;
import com.edu.pojo.Books;
import com.edu.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Date;

@Controller
@RequestMapping("/Borrow")
public class BorrowController {

    @Autowired
    @Qualifier("BorrowService")
    private BorrowService borrowService;

    @RequestMapping("/allBorrow")
    public String list(Model model) {
        String overtime = "逾期";
        Date dateNow = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String now = formatter.format(dateNow);
        borrowService.updateBorrow(overtime,now);
        List<Borrow> list = borrowService.findAllBorrow();
        model.addAttribute("list", list);
        return "admin_borrow";
    }

    @RequestMapping("/findRequest")
    public String requestList(Model model) {
        String sta = "待确认";
        List<Borrow> list = borrowService.findRequest(sta);
        model.addAttribute("list", list);
        return "admin_returnRequest";
    }

    @RequestMapping("/findReparation")
    public String findReparation(Model model) {
        String sta = "损坏赔偿";
        List<Borrow> list = borrowService.findRequest(sta);
        model.addAttribute("list", list);
        return "admin_reparation";
    }

    @RequestMapping("/confirmRequest")
    public String confirmRequest(int id) {
        String sta= "已归还";
        //System.out.println(id);
        borrowService.returnById(sta, id);
        return "redirect:findRequest";
    }

    @RequestMapping("/overReparation")
    public String overReparation(int id) {
        String sta= "已损坏赔偿";
        //System.out.println(id);
        borrowService.returnById(sta, id);
        return "redirect:findReparation";
    }

    @RequestMapping("/renewBorrow")
    public String renewBorrow(int id) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String returnDateString = borrowService.findReturnDateById(id);
        Date returnDate = formatter.parse(returnDateString);
        Date newReturnDate = getNewDate(returnDate,30);
        String newReturnDateString = formatter.format(newReturnDate);
        borrowService.renewBorrow(newReturnDateString, id);
        return "redirect:readerBorrow";
    }

    @RequestMapping("/readerBorrow")
    public String readerBorrowList(Model model, HttpServletRequest request) {
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        String readerName = reader.getReaderName();
        int readerId = borrowService.findReaderIdByName(readerName);
        String nosta = "已归还";
        String overtime = "逾期";
        Date dateNow = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String now = formatter.format(dateNow);
        borrowService.updateBorrow(overtime,now);
        List<Borrow> list = borrowService.findBorrowByReader(nosta,readerId);
        model.addAttribute("list", list);
        return "reader_allBorrow";
    }


    @RequestMapping("/addBorrow")
    public String addBorrow(Borrow borrow, int bookId,
                            HttpServletRequest request,
                            RedirectAttributes redirectAttributes,
                            HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        String readerName = reader.getReaderName();
        int readerId = borrowService.findReaderIdByName(readerName);
        Books book = borrowService.queryBookById(bookId);
        String bookName = book.getBookName();
        //如果图书数量小于1则报错
        if (book.getBookCounts()<1){
            out.print("<script language=\"javascript\">alert('借书失败！');</script>");
            return "";
        }
        borrowService.updateBookCounts(bookId, book.getBookCounts()-1);
        borrow.setBookId(bookId);
        borrow.setBookName(bookName);
        borrow.setReaderId(readerId);
        Date borrowDate = new Date();
        Date returnDate = getNewDate(borrowDate,30);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String borrowDateString = formatter.format(borrowDate);
        String returnDateString = formatter.format(returnDate);
        borrow.setBorrowDate(borrowDateString);
        borrow.setReturnDate(returnDateString);
        borrow.setSta("未归还");
        System.out.println(borrow);
        borrowService.addBorrow(borrow);
        return "redirect:readerBorrow";

    }
    public static Date getNewDate(Date date, int i) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, +i);
        date = calendar.getTime();
        return date;
    }


    @RequestMapping("/request")
    public String request(int id) {
        String sta= "待确认";
        //System.out.println(id);
        borrowService.returnById(sta, id);
        return "redirect:readerBorrow";
    }

    @RequestMapping("/reparation")
    public String reparation (int id) {
        String sta= "损坏赔偿";
        //System.out.println(id);
        borrowService.returnById(sta, id);
        return "redirect:readerBorrow";
    }

    @RequestMapping("/return")
    public String returnBook(int id) {
        String sta= "已归还";
        //System.out.println(id);
        borrowService.returnById(sta, id);
        return "redirect:allBorrow";
    }



    @RequestMapping("/admin_header.html")
    public ModelAndView admin_header() { return new ModelAndView("admin_header");  }

    @RequestMapping("/reader_header.html")
    public ModelAndView reader_header() {
        return new ModelAndView("reader_header");
    }

}
