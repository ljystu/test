package com.edu.controller;

import com.edu.pojo.Admin;
import com.edu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Admin")
public class AdminController {

    @Autowired
    @Qualifier("AdminService")
    private AdminService adminService;


    @RequestMapping("/login")
    public String login(Admin admin, Model model){
        Admin ad=adminService.loginAdmin(admin);
        if(ad!=null){
            return "redirect:/book/allBook";
        }else{
            return "login_error";
        }
    }

    @RequestMapping("/loginPage")
    public String loginPage(){
        return "admin_login";
    }

    @RequestMapping("/reader_register.html")
    public ModelAndView reader_register() { return new ModelAndView("reader_register"); }

    @RequestMapping("/admin_header.html")
    public ModelAndView admin_header() {
        return new ModelAndView("admin_header");
    }

    @RequestMapping("/reader_header.html")
    public ModelAndView reader_header() {
        return new ModelAndView("reader_header");
    }











}
