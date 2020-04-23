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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        return "admin_allBorrow";
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
        Borrow borrow = borrowService.findBorrowById(id);
        int bookId = borrow.getBookId();
        Books book = borrowService.queryBookById(bookId);
        //书本数量+1
        borrowService.updateBookCounts(book.getBookID(),book.getBookCounts()+1);
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
    public void renewBorrow(int id, HttpServletResponse response) throws ParseException, IOException {
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        Borrow borrow = borrowService.findBorrowById(id);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String returnDateString = borrowService.findReturnDateById(id);
        String borrowDateString = borrowService.findBorrowDateById(id);
        Date borrowDate = formatter.parse(borrowDateString);
        Date borrowDate_31 = getNewDate(borrowDate,31);
        Date returnDate = formatter.parse(returnDateString);
        Date now = new Date();
        Date now_10 = getNewDate(now,10);
        //判断图书是否是未归还状态
        if (!borrow.getSta().equals("未归还")){
            out.print("<script language=\"javascript\">alert('图书不是未归还状态！');" +
                    "location.href='readerBorrow'</script>");
            out.flush();
            out.close();
        }
        //判断图书是否已经续借
        else if (returnDate.after(borrowDate_31)){
            out.print("<script language=\"javascript\">alert('图书已经续借过了，无法再续借');" +
                    "location.href='readerBorrow'</script>");
            out.flush();
            out.close();
        }
        //判断是否是还书日前10天或者图书是否逾期
        else if ( now_10.before(returnDate) || now.after(returnDate)){
            out.print("<script language=\"javascript\">alert('现在无法续期（还书日前10天提供续借服务）');" +
                    "location.href='readerBorrow'</script>");
            out.flush();
            out.close();
        }

        else {
            Date newReturnDate = getNewDate(returnDate, 30);
            String newReturnDateString = formatter.format(newReturnDate);
            borrowService.renewBorrow(newReturnDateString, id);
            out.print("<script language=\"javascript\">alert('您已成功续借30天，请注意只能续借一次');" +
                    "location.href='readerBorrow'</script>");
            out.flush();
            out.close();
        }
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
    public void addBorrow(Borrow borrow, int bookId,
                            HttpServletRequest request,
                            HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        String readerName = reader.getReaderName();
        //这里的readerId一定要通过readerName来查询。getReaderId会返回0
        int readerId = borrowService.findReaderIdByName(readerName);
        reader = borrowService.findReaderById(readerId);
        Books book = borrowService.queryBookById(bookId);
        String bookName = book.getBookName();
        //如果图书数量小于1则报错
        if (book.getBookCounts()<1){
            out.print("<script language=\"javascript\">alert('无馆藏图书！点击确认跳转主页');" +
                    "location.href='../book/reader_allBook'</script>");
            out.flush();
            out.close();
            //return "reader_allBook";
        }
        //单用户只能同时借阅一本书
        else if (!borrowService.findBorrowByReaderAndBookAndSta(readerId,bookId,"未归还").isEmpty()||
                !borrowService.findBorrowByReaderAndBookAndSta(readerId,bookId,"待确认").isEmpty()){
            out.print("<script language=\"javascript\">alert('您已借阅同样的图书！请确认您已归还且管理员已确认');" +
                    "location.href='../book/reader_allBook'</script>");
            out.flush();
        }
        //有逾期未归还的图书不能再借阅新书
       else if (!borrowService.findBorrowByStaAndReader("逾期", readerId).isEmpty()){
            out.print("<script language=\"javascript\">alert('您有图书逾期，请先归还！');" +
                    "location.href='../book/reader_allBook'</script>");
            out.flush();
            out.close();
        }
        //损坏未赔偿的图书不能再借阅新书
        else if (!borrowService.findBorrowByStaAndReader("损坏赔偿", readerId).isEmpty()){
            out.print("<script language=\"javascript\">alert('您有图书损坏未赔偿，请先归还！');" +
                    "location.href='../book/reader_allBook'</script>");
            out.flush();
            out.close();
        }
        //个人借书的同时最大数量为5
        else if (borrowService.findBorrowByStaAndReader("未归还",readerId).size()>4){
            out.print("<script language=\"javascript\">alert('您同一读者同时最多借阅5本书，您已达限额！');" +
                    "location.href='../book/reader_allBook'</script>");
            out.flush();
            out.close();
        }
       //没有上述情况可以正常借书
        else {
            borrowService.updateBookCounts(bookId, book.getBookCounts() - 1);
            borrow.setBookId(bookId);
            borrow.setBookName(bookName);
            borrow.setReaderId(readerId);
            Date borrowDate = new Date();
            Date returnDate = getNewDate(borrowDate, 30);
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String borrowDateString = formatter.format(borrowDate);
            String returnDateString = formatter.format(returnDate);
            borrow.setBorrowDate(borrowDateString);
            borrow.setReturnDate(returnDateString);
            borrow.setSta("未归还");
            System.out.println(borrow);
            borrowService.addReaderBooks(readerId, reader.getReaderBooks()+1);
            borrowService.addBorrow(borrow);
            out.print("<script language=\"javascript\">alert('借书成功！点击确认跳转 我的借阅');" +
                    "location.href='readerBorrow'</script>");
            out.flush();
            out.close();
        }
        //return "reader_main";
    }
    public static Date getNewDate(Date date, int i) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, +i);
        date = calendar.getTime();
        return date;
    }


    @RequestMapping("/request")
    public void request(int id, HttpServletResponse response) throws IOException {
        String sta= "待确认";
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        Borrow borrow = borrowService.findBorrowById(id);
        if(borrow.getSta().equals("未归还")||borrow.getSta().equals("逾期")) {
            borrowService.returnById(sta, id);
            out.print("<script language=\"javascript\">alert('请等待管理员确认');" +
                    "location.href='readerBorrow'</script>");
        }
        else{
            out.print("<script language=\"javascript\">alert('无效操作');" +
                    "location.href='readerBorrow'</script>");
        }
        out.flush();
        out.close();
    }

    @RequestMapping("/reparation")
    public void reparation (int id, HttpServletResponse response) throws IOException {
        String sta= "损坏赔偿";
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        Borrow borrow = borrowService.findBorrowById(id);
        if(borrow.getSta().equals("未归还")) {
            borrowService.returnById(sta, id);
            out.print("<script language=\"javascript\">alert('已成功申请损坏赔偿，管理员会在5个工作日内联系您');" +
                    "location.href='readerBorrow'</script>");
        }
        else{
            out.print("<script language=\"javascript\">alert('无效操作');" +
                    "location.href='readerBorrow'</script>");
        }
        out.flush();
        out.close();
        //return "redirect:readerBorrow";
    }

    @RequestMapping("/return")
    public String returnBook(int id) {
        String sta= "已归还";
        //System.out.println(id);
        borrowService.returnById(sta, id);
        return "redirect:allBorrow";
    }

    @RequestMapping("adminQueryBorrow")
    public String QueryBook(HttpServletRequest request, HttpSession session, Model model){
        String keyword=request.getParameter("keyword");
        String searchType=request.getParameter("searchType");
        System.out.println(keyword+" "+searchType);
        //输入空白内容
        if(keyword.equals("")){
            List<Borrow> list = borrowService.findAllBorrow();
            model.addAttribute("list", list);
            return "admin_allBorrow";
        }

        List<Borrow> list=borrowService.findBorrow(keyword,searchType);
        System.out.println(list.toString());
        model.addAttribute("list", list);
        return "admin_allBorrow";
    }



    @RequestMapping("/admin_header.html")
    public ModelAndView admin_header() { return new ModelAndView("admin_header");  }

    @RequestMapping("/reader_header.html")
    public ModelAndView reader_header() {
        return new ModelAndView("reader_header");
    }

}
