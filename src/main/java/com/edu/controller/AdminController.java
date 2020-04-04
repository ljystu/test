package com.edu.controller;

import com.edu.pojo.Admin;
import com.edu.pojo.Reader;
import com.edu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Admin")
@SessionAttributes("admin")
public class AdminController {

    @Autowired
    @Qualifier("AdminService")
    private AdminService adminService;


    @RequestMapping("/login")
    public String login(Admin admin, Model model){
        Admin ad=adminService.loginAdmin(admin);
        if(ad!=null){
            model.addAttribute("admin",admin);
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

    @RequestMapping("/admin_main.html")
    public ModelAndView admin_main() {
        return new ModelAndView("admin_main");
    }

    @RequestMapping("/admin_repasswd.html")
    public ModelAndView admin_repasswd() {
        return new ModelAndView("admin_repasswd");
    }


    @RequestMapping("/admin_repasswd_do")
    public String adminRepasswdDo(HttpServletRequest request, String oldPasswd, String newPasswd, String reNewPasswd, RedirectAttributes redirectAttributes) {
        Admin admin=(Admin) request.getSession().getAttribute("admin");
        String name=admin.getAdminName();
        int id = adminService.findIdByName(name);
//        int id = admin.getAdminId();
        System.out.println(id);
        String password = adminService.getPassword(id);
        System.out.println(password);
        if(password.equals(oldPasswd)){
            if (adminService.resetPassword(id,newPasswd)){
                redirectAttributes.addFlashAttribute("succ", "管理员密码修改成功！");
                return "redirect:/Admin/admin_repasswd.html";
            }
            else {
                redirectAttributes.addFlashAttribute("error", "管理员密码修改失败！");
                return "redirect:/Admin/admin_repasswd.html";
            }
        } else {
            redirectAttributes.addFlashAttribute("error", "管理员旧密码错误！");
            return "redirect:/Admin/admin_repasswd.html";
        }
    }

    @RequestMapping("/logout.html")
    public String logout() {
        return "redirect:../";
    }













}
