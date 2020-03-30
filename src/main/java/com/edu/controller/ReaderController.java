package com.edu.controller;

import com.edu.pojo.Books;
import com.edu.pojo.Reader;
import com.edu.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/Reader")
public class ReaderController {

    @Autowired
    @Qualifier("ReaderService")
    private ReaderService readerService;

    @RequestMapping("/findReaderByName")
    public String findReaderByName(Model model,@RequestParam(name="readerName")String name) {
        Reader reader = readerService.findReaderByName(name);
        System.out.println(reader);
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
            return "redirect:/book/allBook";
        }else{
            return "login_error";
        }
    }

    @RequestMapping("/admin_header.html")
    public ModelAndView admin_header() {
        return new ModelAndView("admin_header");
    }

    @RequestMapping("/reader_header.html")
    public ModelAndView reader_header() {
        return new ModelAndView("reader_header");
    }


}
