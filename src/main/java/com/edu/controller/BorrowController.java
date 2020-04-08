package com.edu.controller;

import com.edu.pojo.Borrow;
import com.edu.pojo.Reader;
import com.edu.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping("/confirmRequest")
    public String confirmRequest(int id) {
        String sta= "已归还";
        //System.out.println(id);
        borrowService.returnById(sta, id);
        return "redirect:findRequest";
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


    @RequestMapping("/addBorrow")
    public String addBorrow(Borrow borrow, HttpServletRequest request, int bookId, RedirectAttributes redirectAttributes) {
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        String name = reader.getReaderName();
        int readerId = borrowService.findReaderIdByName(name);
        borrow.setBookId(bookId);
        borrow.setReaderId(readerId);
        Date borrowDate = new Date();
        Date returnDate = getreturnDate(borrowDate);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String borrowDateString = formatter.format(borrowDate);
        String returnDateString = formatter.format(returnDate);
        borrow.setBorrowDate(borrowDateString);
        borrow.setReturnDate(returnDateString);
        borrow.setSta("未归还");
        System.out.println(borrow);
        if (borrowService.addBorrow(borrow)){
            return "redirect:readerBorrow";
        }
        else {
            redirectAttributes.addFlashAttribute("error", "借书失败，请重试");
            return "redirect:readerBorrow";
        }

    }
    public static Date getreturnDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, +30);
        date = calendar.getTime();
        return date;
    }


    @RequestMapping("/return")
    public String return1(int id) {
        String sta= "待确认";
        System.out.println(id);
        borrowService.returnById(sta, id);
        return "redirect:readerBorrow";
    }



    @RequestMapping("/admin_header.html")
    public ModelAndView admin_header() { return new ModelAndView("admin_header");  }

    @RequestMapping("/reader_header.html")
    public ModelAndView reader_header() {
        return new ModelAndView("reader_header");
    }

}
