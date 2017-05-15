package com.controller;

import com.bean.Book;
import com.bean.BookType;
import com.bean.Reader;
import com.bean.Record;
import com.service.*;
import com.util.Page;
import com.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

/**
 * Created by Cedrus on 2017/4/22.
 */
@Controller
@RequestMapping("/reader")
public class ReaderController {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;
    @Autowired
    private BookTypeService bookTypeService;
    @Autowired
    private RecommendService recommendService;

    @Autowired
    private RecordService recordService;

    /*@RequestMapping("/index")
    public ModelAndView readerIndex(){
        ModelAndView mav = new ModelAndView("reader_index");
        return mav;
    }*/

    @RequestMapping("/info")
    public ModelAndView readerInfo(HttpSession session){
        int readerID = (int)session.getAttribute("userID");
        Reader reader = readerService.getReaderByID(readerID);
        ModelAndView mav = new ModelAndView("reader_info");
        mav.addObject("reader",reader);
        return mav;
    }

    @RequestMapping("/password")
    public ModelAndView readerPassword(){
        ModelAndView mav = new ModelAndView("reader_password");
        return mav;
    }

   @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
   public String updateInfo(String readerID,String sex, String  age, String phone ,RedirectAttributes attributes){
       Reader reader = new Reader();
       reader.setReaderID(Integer.parseInt(readerID));
       reader.setSex(Integer.parseInt(sex));
       reader.setAge(Integer.parseInt(age));
       reader.setPhone(phone);
       System.out.println(reader.toString());
       if(reader.getReaderID()!=0 ){
           if(readerService.updateReader(reader)){
               attributes.addFlashAttribute("message", "资料更新成功!");
           }else {
               attributes.addFlashAttribute("error", "资料更新失败!");
           }
       }
       return "redirect:/reader/info?readerID="+readerID;
   }

    @RequestMapping(value = "/updatePass", method = RequestMethod.POST)
    public String updatePass(String oldpass, String newpass1, String newpass2 , RedirectAttributes attributes, HttpSession session){
       int readerID = (int)session.getAttribute("userID");
       Reader reader = readerService.getReaderByID(readerID);
        if(!newpass1.equals(newpass2)){
            attributes.addFlashAttribute("error", "两次密码不相同!");
        }else{
            if(!oldpass.equals(reader.getPassword())){
                attributes.addFlashAttribute("error", "原密码错误，修改失败!");
            }else{
                reader.setPassword(newpass1);
                if(readerService.updateReader(reader)){
                    /*attributes.addFlashAttribute("message", "密码修改成功!");*/
                    session.removeAttribute("userID");
                    session.removeAttribute("type");
                    session.removeAttribute("login_status");
                    return "redirect:/login";
                }else {
                    attributes.addFlashAttribute("error", "修改失败!");
                }
            }
        }
        return "redirect:/reader/password?readerID="+readerID;
    }

    @RequestMapping(value = "/bookList")
    public ModelAndView bookReaderIndex(){
        ModelAndView mav = new ModelAndView("reader_book");
        List<BookType> types = bookTypeService.getAllTypes();
        mav.addObject("types",types);
        Book bookquery = new Book();
        int pageSize = Utils.PAGE_SIZE;
        Page<Book> page = bookService.getBooksBy(bookquery,1,pageSize);
        mav.addObject("page",page);
        mav.addObject("bookquery",bookquery);
        return mav;
    }

    @RequestMapping(value = "/queryBook")
    public ModelAndView queryBook(String bookname, String auther, String publish, int bookType, int pageNum){
        ModelAndView mav = new ModelAndView("reader_book");
        int pageSize = Utils.PAGE_SIZE;
        Book bookquery = new Book();
        bookquery.setBookName(bookname);
        bookquery.setAuthor(auther);
        bookquery.setPublish(publish);
        bookquery.setBookTypeID(bookType);
        List types = bookTypeService.getAllTypes();
        mav.addObject("types",types);
        Page<Book> page = bookService.getBooksBy(bookquery,pageNum,pageSize);
        mav.addObject("page",page);
        mav.addObject("bookquery",bookquery);
        return mav;
    }

    @RequestMapping(value = "/borrowBookList")
    public ModelAndView borrowBookList(int pageNum, int  readerID){
        ModelAndView mav = new ModelAndView("reader_borrow_list");
        Record record = new Record();
        record.setReaderID(readerID);
        int pageSize = Utils.PAGE_SIZE;
        Page<Record> page = recordService.queryRecords(record,0,pageNum,pageSize);
        mav.addObject("page",page);
        return mav;
    }

    @RequestMapping(value = "/returnBookList")
    public ModelAndView returnBookList(int pageNum, int  readerID){
        ModelAndView mav = new ModelAndView("reader_return_list");
        Record record = new Record();
        record.setReaderID(readerID);
        record.setIsReturn(1);
        int pageSize = Utils.PAGE_SIZE;
        Page<Record> page = recordService.queryRecords(record,0,pageNum,pageSize);
        mav.addObject("page",page);
        return mav;
    }

    @RequestMapping(value = "/recommendedPage")
    public ModelAndView recommendedPage(HttpSession session){
        ModelAndView mav = new ModelAndView("reader_recommended");
        int readerID = (int)session.getAttribute("userID");
        List<Book> books = recommendService.getRecommendBookByID(readerID);
        if(books.size()>10){
            books = books.subList(0,9);
        }
        mav.addObject("books",books);
        return mav;
    }

    @RequestMapping(value = "/readerBookInfoPage")
    public ModelAndView readerBookInfoPage(int bookID ){
        ModelAndView mav = new ModelAndView("reader_book_info");
        Book book = bookService.getBookByID(bookID);
        mav.addObject("book",book);
        return mav;
    }
}
