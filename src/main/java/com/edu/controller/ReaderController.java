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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/Reader")
@SessionAttributes("reader")
public class ReaderController {

    @Autowired
    @Qualifier("ReaderService")
    private ReaderService readerService;


    private Reader getReaderInfo(int readerId, String name, String type, String sex, String note) {
        Reader reader = new Reader();
        reader.setReaderName(name);
        reader.setReaderId(readerId);
        reader.setReaderType(type);
        reader.setReaderSex(sex);
        ;
        reader.setReaderNote(note);
        return reader;
    }

    @RequestMapping("/findReaderByName")
    public String findReaderByName(Model model, @RequestParam(name = "readerName") String name) {
        List<Reader> list = (List<Reader>) readerService.findReaderByName(name);
        System.out.println(list);
        model.addAttribute("list", list);
        return "admin_allReader";
    }

    @RequestMapping("/allReader")
    public String getAllUser(HttpServletRequest request, Model model) {
        List<Reader> reader = readerService.findAllReader();
        System.out.println(reader);
        model.addAttribute("list", reader);
        request.setAttribute("list", reader);
        return "admin_allReader";
    }

    @RequestMapping("/login")
    public String login(Reader reader, Model model) {
        Reader ad = readerService.loginReader(reader);

        if (ad != null) {
            model.addAttribute("reader", reader);
            return "redirect:/book/reader_allBook";
        } else {
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

    @RequestMapping("/reader_main")
    public ModelAndView reader_main() {
        return new ModelAndView("reader_main");
    }

    @RequestMapping("/toAddReader")
    public String toAddReader() {
        return "admin_addReader";
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
        return "redirect:../";
    }

    @RequestMapping("/toUpdateReader")
    public String toUpdateReader(Model model, int id) {
        Reader readers = readerService.findReaderById(id);
        System.out.println(readers);
        model.addAttribute("reader", readers);
        return "admin_updateReader";
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


    @RequestMapping("/reader_info.html")
    public String toReaderInfo(HttpServletRequest request, Model model) {
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        Reader readerInfo = readerService.getReaderInfo(reader.getReaderName());
        model.addAttribute("readerInfo", readerInfo);
        request.setAttribute("readerInfo", readerInfo);
        return "reader_info";
    }

    @RequestMapping("readerPersonal_edit.html")
    public String readerInfoEdit(HttpServletRequest request, Model model) {
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        Reader readerInfo = readerService.getReaderInfo(reader.getReaderName());
        model.addAttribute("readerInfo", readerInfo);
        request.setAttribute("readerInfo",readerInfo);
        return "readerPersonal_edit";
    }

    @RequestMapping("readerPersonal_edit_do.html")
    public String readerInfoEditDo(HttpServletRequest request, String name, String type,String sex, String detail, RedirectAttributes redirectAttributes) {
        int readerId =  Integer.parseInt(request.getParameter("readerId"));
        Reader readerInfo = getReaderInfo(readerId, name,type,sex,detail);
        if (readerService.editReaderInfo(readerInfo)>0) {
            redirectAttributes.addFlashAttribute("succ", "读者信息修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "读者信息修改失败！");
        }
        request.setAttribute("readerInfo",readerInfo);
        return "reader_info";
    }


    @RequestMapping("/reader_repasswd.html")
    public ModelAndView reader_repasswd() {
        return new ModelAndView("reader_repasswd");
    }


    @RequestMapping("/reader_repasswd_do")
    public String readerRepasswdDo(HttpServletRequest request, String oldPasswd, String newPasswd, String reNewPasswd, RedirectAttributes redirectAttributes) {
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        String name = reader.getReaderName();
        int id = readerService.findIdByName(name);
        System.out.println(id);
        String password = readerService.getPassword(id);
        System.out.println(password);
        if (password.equals(oldPasswd)) {
            if (readerService.resetPassword(id, newPasswd)) {
                redirectAttributes.addFlashAttribute("succ", "读者密码修改成功！");
                return "redirect:/Reader/reader_repasswd.html";
            } else {
                redirectAttributes.addFlashAttribute("error", "读者密码修改失败！");
                return "redirect:/Reader/reader_repasswd.html";
            }
        } else {
            redirectAttributes.addFlashAttribute("error", "读者旧密码错误！");
            return "redirect:/Reader/reader_repasswd.html";
        }
    }

    @RequestMapping("/logout.html")
    public String logout() {
        return "redirect:../";
    }
}
