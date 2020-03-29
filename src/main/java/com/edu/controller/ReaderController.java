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
        return "allBook";
    }
}
