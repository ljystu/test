package com.edu.controller;

import com.edu.pojo.Reader;
import com.edu.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/Reader")
@SessionAttributes("reader")
public class ReaderController {

    @Autowired
    @Qualifier("ReaderService")
    private ReaderService readerService;

    @RequestMapping("/findReaderByName")
    public String findReaderByName(Model model,@RequestParam(name="readerName")String name) {
        List<Reader> list = (List<Reader>) readerService.findReaderByName(name);
        System.out.println(list);
        model.addAttribute("list", list);
        return "allReader";
    }

    @RequestMapping("/allReader")
    public String getAllUser(HttpServletRequest request, Model model){
        List<Reader> reader=readerService.findAllReader();
        System.out.println(reader);
        model.addAttribute("list",reader);
        request.setAttribute("list",reader);
        return "allReader";
    }

    @RequestMapping("/login")
    public String login(Reader reader,Model model){
        Reader ad=readerService.loginReader(reader);

        if(ad!=null){
            model.addAttribute("reader",reader);
            return "redirect:/book/allBook";
        }else{
            return "login_error";
        }
    }
    @RequestMapping("/register")
    public String register() {
        return "reader_register";
    }

    @RequestMapping("/backIndex")
    public String backIndex() {
        return "redirect:../";
    }

    @RequestMapping("/admin_header.html")
    public ModelAndView admin_header() {
        return new ModelAndView("admin_header");
    }

    @RequestMapping("/reader_header.html")
    public ModelAndView reader_header() {
        return new ModelAndView("reader_header");
    }

    @RequestMapping("/toAddReader")
    public String toAddReader() {
        return "addReader";
    }

    @RequestMapping("/addReader")
    public String addReader(Reader reader) {
        System.out.println(reader);
        readerService.addReader(reader);
        return "redirect:/book/allBook";
    }
    @RequestMapping("/registerReader")
    public String registerReader(Reader reader) {
        System.out.println(reader);
        readerService.addReader(reader);
        return "redirect:/book/allBook";
    }

    @RequestMapping("/toUpdateReader")
    public String toUpdateReader(Model model, int id) {
        Reader readers = readerService.findReaderById(id);
        System.out.println(readers);
        model.addAttribute("reader", readers);
        return "updateReader";
    }

    @RequestMapping("/updateReader")
    public String updateReader(Model model, Reader reader) {
        System.out.println(reader);
        readerService.updateReader(reader);
        Reader readers = readerService.findReaderById(reader.getReaderId());
        model.addAttribute("readers", readers);
        return "redirect:/Reader/allReader";
    }

    @RequestMapping("/del/{readerId}")
    public String deleteReader(@PathVariable("readerId") int id) {
        readerService.deleteReaderById(id);
        return "redirect:/Reader/allReader";
    }




}
