package com.controller;

import com.bean.Book;
import com.enums.State;
import com.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

   /* @RequestMapping(value = "/admin/book")
    ModelAndView bookAdminIndex(){
        ModelAndView mav = new ModelAndView("admin_book");
        return mav;
    }
*/






}
