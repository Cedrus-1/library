package com.controller;

import com.bean.Administrator;
import com.bean.Reader;
import com.bean.ReaderType;
import com.service.AdministratorService;
import com.service.ReaderService;
import com.service.ReaderTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class LoginController {
    @Autowired
    private AdministratorService administratorService;
    @Autowired
    private ReaderService readerService;
    @Autowired
    private ReaderTypeService readerTypeService;

    @RequestMapping(value = "/")
    public String index() {
        return "login";
    }

    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String username, String password, String role, RedirectAttributes attributes, HttpSession session) {
        System.out.println("username: " + username + " password: " + password + " role:" + role + " session: " + session);
        if (role == null || username == null || password == null) {
            attributes.addFlashAttribute("error", "请填写完整");
            return "redirect:/login";
        }
        if (role.equals("1")) {
            Reader reader = readerService.getReaderByName(username);
            if (reader != null && password.equals(reader.getPassword())) {
                session.setAttribute("userID", reader.getReaderID());
                session.setAttribute("username", reader.getUserName());
                session.setAttribute("type", "reader");
                session.setAttribute("login_status", "true");
                attributes.addFlashAttribute("message", "SUCCESS");
                attributes.addAttribute("readerID",reader.getReaderID());
                return "redirect:/reader/index";
            } else {
                attributes.addFlashAttribute("error", "用户名或密码不正确");
                return "redirect:/login";
            }
        } else {
            Administrator administrator = administratorService.getAdminByUserName(username);
            if (administrator == null) {
                attributes.addFlashAttribute("error", "用户名或密码不正确");
                return "redirect:/login";
            } else {
                administrator.setPassword(password);
                if (administratorService.login(administrator)) {
                    session.setAttribute("userID", administrator.getAdminID());
                    session.setAttribute("username", administrator.getUserName());
                    session.setAttribute("type", "admin");
                    session.setAttribute("login_status", "true");
                    attributes.addAttribute("adminID",administrator.getAdminID());
                    return "redirect:/admin/index";
                } else {
                    attributes.addFlashAttribute("error", "用户名或密码不正确");
                    return "redirect:/login";
                }
            }
        }
    }

    @RequestMapping(value = "/register")
    public String register() {
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(String username, String password, String phone,RedirectAttributes attributes, HttpSession session) {
        Reader reader = new Reader();
        reader.setUserName(username);
        reader.setPassword(password);
        reader.setPhone(phone);
        reader.setReaderTypeID(1);
        List types = readerTypeService.getAllTypes();
        if(types!=null && types.size()>0){
            reader.setReaderTypeID(((ReaderType)types.get(0)).getReaderTypeID());
            reader.setReaderTypeName(((ReaderType)types.get(0)).getName());
        }
        if (readerService.signIn(reader)) {
            session.setAttribute("userID", reader.getReaderID());
            session.setAttribute("username", username);
            session.setAttribute("type", "reader");
            session.setAttribute("login_status", "true");
            attributes.addFlashAttribute("message", "成功");
            return "redirect:/reader/index";
        }
        attributes.addFlashAttribute("error", "此用户名太火爆，已经被注册！");
        return "redirect:/register";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("userID");
        session.removeAttribute("username");
        session.removeAttribute("type");
        session.removeAttribute("login_status");
        return "redirect:/login";
    }

}
