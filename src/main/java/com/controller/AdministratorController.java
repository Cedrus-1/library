package com.controller;

import javax.servlet.http.HttpSession;

import com.bean.*;
import com.enums.Message;
import com.enums.State;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.util.Page;
import com.util.Utils;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdministratorController {
	@Autowired
	private AdministratorService adminService;
	@Autowired
	private BookService bookService;
	@Autowired
	private BookTypeService bookTypeService;
	@Autowired
	private ReaderService readerService;
	@Autowired
	private ReaderTypeService readerTypeService;
	@Autowired
	private RecordService recordService;


	@RequestMapping("/index")
	public ModelAndView adminIndex(){
		ModelAndView mav = new ModelAndView("admin_index");
		return mav;
	}

	@RequestMapping("/password")
	public ModelAndView readerPassword(){
		ModelAndView mav = new ModelAndView("admin_password");
		return mav;
	}

	@RequestMapping(value = "/updatePass", method = RequestMethod.POST)
	public String updatePass(String oldpass, String newpass1, String newpass2 , RedirectAttributes attributes, HttpSession session){
		int adminID = (Integer) session.getAttribute("userID");
		Administrator admin = adminService.getAdminByID(adminID);
		if(!newpass1.equals(newpass2)){
			attributes.addFlashAttribute("error", "两次密码不相同!");
		}else{
			admin.setPassword(oldpass);
			if(adminService.login(admin)){
				admin.setPassword(newpass1);
				if(adminService.updateAdmin(admin)){
					session.removeAttribute("userID");
					session.removeAttribute("type");
					session.removeAttribute("login_status");
					return "redirect:/login";
				}else {
					attributes.addFlashAttribute("error", "修改失败!");
				}
			}else{
				attributes.addFlashAttribute("error", "原密码错误，修改失败!");
			}
		}
		return "redirect:/admin/password?adminID="+adminID;
	}

	@RequestMapping(value = "/bookList")
	public ModelAndView bookReaderIndex(){
		ModelAndView mav = new ModelAndView("admin_book");
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
		ModelAndView mav = new ModelAndView("admin_book");
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

	@RequestMapping(value = "/getBookInfo")
	public ModelAndView getBookInfo(String bookID){
		ModelAndView mav = new ModelAndView("book_info");
		Book book = bookService.getBookByID(Integer.parseInt(bookID));
		mav.addObject("book",book);
		List types = bookTypeService.getAllTypes();
		mav.addObject("types",types);
		return mav;
	}

	@RequestMapping(value = "/updateBookInfo", method = RequestMethod.POST)
	public String updateBookInfo(int bookID, String bookname, String author, String publish,int bookType, String translator,
								 String ISBN, String price, int totalNumber, int nowNumber,int borrowTimes, float rating, String description, RedirectAttributes attributes){
		Book book = bookService.getBookByID(bookID);
		book.setBookName(bookname);
		book.setAuthor(author);
		book.setPublish(publish);
		book.setBookTypeID(bookType);
		book.setTranslator(translator);
		book.setISBN(ISBN);
		book.setPrice(Float.parseFloat(price));
		book.setTotalNumber(totalNumber);
		book.setNowNumber(nowNumber);
		book.setBorrowTimes(borrowTimes);
		book.setRating(rating);
		book.setDescription(description);
		if(bookService.updateBook(book)){
			attributes.addFlashAttribute("message", "资料更新成功!");
		}else {
			attributes.addFlashAttribute("error", "ISBN已存在，更新失败!");
		}
		return "redirect:/admin/getBookInfo?bookID="+bookID;
	}

	@RequestMapping(value = "/addBookPage")
	public ModelAndView addBook(){
		ModelAndView mav = new ModelAndView("book_add");
		List types = bookTypeService.getAllTypes();
		mav.addObject("types",types);
		Book book = new Book();
		mav.addObject("book",book);
		return mav;
	}

	@RequestMapping(value = "/addBook", method = RequestMethod.POST)
	public String addBook(String bookname, String author, String publish,int bookType, String translator,
								 String ISBN, String price, int totalNumber, int nowNumber ,
						  String description,RedirectAttributes attributes){
		Book book = new Book();
		book.setBookName(bookname);
		book.setAuthor(author);
		book.setPublish(publish);
		book.setBookTypeID(bookType);
		book.setTranslator(translator);
		book.setISBN(ISBN);
		book.setPrice(Float.parseFloat(price));
		book.setTotalNumber(totalNumber);
		book.setNowNumber(nowNumber);
		book.setInTime(new Date());

		book.setDescription(description);
		if(bookService.addBook(book)){
			attributes.addFlashAttribute("message", "添加图书成功!");
		}else {
			attributes.addFlashAttribute("error", "ISBN已存在，添加失败!");
		}
		return "redirect:/admin/addBookPage";
	}

	@RequestMapping(value = "/bookTypeList")
	public ModelAndView getBookTypeList(int pageNum){
		ModelAndView mav = new ModelAndView("book_type_list");
		Page<BookType> page = bookTypeService.getTypesByPage(pageNum,Utils.PAGE_SIZE);
		mav.addObject("page",page);
		return mav;
	}


	@RequestMapping(value = "/addbookTypePage")
	public ModelAndView addbookType(){
		ModelAndView mav = new ModelAndView("book_type_add");
		BookType bookType = new BookType();
		mav.addObject("bookType",bookType);
		return mav;
	}

	@RequestMapping(value = "/getBookTypeInfo")
	public ModelAndView getBookTypeInfo(int bookTypeID){
		ModelAndView mav = new ModelAndView("book_type_info");
		BookType bookType = bookTypeService.getTypeByID(bookTypeID);
		mav.addObject("bookType",bookType);
		return mav;
	}

	@RequestMapping(value = "/addbookType", method = RequestMethod.POST)
	public String addbookType(String booktypename,String description,  RedirectAttributes attributes){
		BookType bookType = new BookType();
		bookType.setBookTypeName(booktypename);
		bookType.setDescription(description);
		if(bookTypeService.addType(bookType)){
			attributes.addFlashAttribute("message", "添加图书类别成功!");
		}else {
			attributes.addFlashAttribute("error", "该类别已存在，添加失败!");
		}
		return "redirect:/admin/addbookTypePage";
	}

	@RequestMapping(value = "/updateBookType", method = RequestMethod.POST)
	public String updateBookType(int bookTypeID ,String booktypename, String description,RedirectAttributes attributes){
		BookType bookType = bookTypeService.getTypeByID(bookTypeID);
		bookType.setBookTypeName(booktypename);
		bookType.setDescription(description);
		if(bookTypeService.updateType(bookType)){
			attributes.addFlashAttribute("message", "修改图书类别成功!");
		}else {
			attributes.addFlashAttribute("error", "该类别已存在，修改失败!");
		}
		return "redirect:/admin/getBookTypeInfo?bookTypeID="+bookTypeID;
	}

	@RequestMapping(value = "/deleteBookType")
	public String deleteBookType(int bookTypeID , RedirectAttributes attributes){
		if(bookTypeService.deleteType(bookTypeID)){
			attributes.addFlashAttribute("message", "删除类别成功!");
			return "redirect:/admin/bookTypeList?pageNum=1";
		}else {
			attributes.addFlashAttribute("error", "该类别已经有图书，删除失败!");
			return "redirect:/admin/getBookTypeInfo?bookTypeID="+bookTypeID;
		}
	}

	@RequestMapping(value = "/borrowBookPage")
	public ModelAndView borrowBookPage(int bookID ){
		Book book = bookService.getBookByID(bookID);
		ModelAndView mav = new ModelAndView("borrow_book");
		mav.addObject("book",book);
		return mav;
	}

	@RequestMapping(value = "/borrowBook", method = RequestMethod.POST)
	public String borrowBook(int bookID,String readerName,HttpSession session, RedirectAttributes attributes){
		String adminName = (String) session.getAttribute("username");
		Reader reader = readerService.getReaderByName(readerName);
		if(reader==null){
			attributes.addFlashAttribute("error", "借阅人不存在，请确认之后再填!");
		}else {
			Message message = recordService.borrowBook(bookID,reader.getReaderID(),adminName);
			if(message.state.equals(State.SUCCESS)){
				attributes.addFlashAttribute("message", message.getMessage());
			}else {
				attributes.addFlashAttribute("error", message.getMessage());
			}
		}
		return "redirect:/admin/borrowBookPage?bookID="+bookID;
	}

	@RequestMapping(value = "/borrowBookList")
	public ModelAndView borrowBookList(){
		ModelAndView mav = new ModelAndView("borrow_list");
		Record record = new Record();
		int pageSize = Utils.PAGE_SIZE;
		Page<Record> page = recordService.queryRecords(record,1,1,pageSize);
		mav.addObject("page",page);
		mav.addObject("record",record);
		mav.addObject("time",1);
		return mav;
	}

	@RequestMapping(value = "/alarmList")
	public ModelAndView alarmRecords(int pageNum){
		ModelAndView mav = new ModelAndView("alarm_list");
		int pageSize = Utils.PAGE_SIZE;
		Page<Record> page = recordService.getAlarmRecordsByPage(pageNum,pageSize);
		mav.addObject("page",page);
		return mav;
	}

	@RequestMapping(value = "/queryRecordList")
	public ModelAndView queryRecordList(String readerName, String bookName, int isReturn, int time, int pageNum){
		Record record = new Record();
		record.setReaderName(readerName);
		record.setBookName(bookName);
		record.setIsReturn(isReturn);
		ModelAndView mav = new ModelAndView("borrow_list");
		int pageSize = Utils.PAGE_SIZE;
		Page<Record> page = recordService.queryRecords(record,time,pageNum,pageSize);
		mav.addObject("page",page);
		mav.addObject("record",record);
		mav.addObject("time",time);
		return mav;
	}

	@RequestMapping(value = "/returnBookPage")
	public ModelAndView returnBookPage(int recordID ){
		Record record = recordService.getRecordByID(recordID);
		ModelAndView mav = new ModelAndView("return_book");
		mav.addObject("record",record);
		return mav;
	}

	@RequestMapping(value = "/returnBook", method = RequestMethod.POST)
	public String returnBook(int recordID,int rating, HttpSession session, RedirectAttributes attributes){
		String adminName = (String) session.getAttribute("username");
		Message message = recordService.returnBook(recordID,adminName,rating);
		if(message.state.equals(State.SUCCESS)){
			attributes.addFlashAttribute("message", message.getMessage());
		}else {
			attributes.addFlashAttribute("error", message.getMessage());
		}
		return "redirect:/admin/returnBookPage?recordID="+recordID;
	}

	@RequestMapping(value = "/adminList")
	public ModelAndView adminList(int pageNum){
		ModelAndView mav = new ModelAndView("admin_list");
		int pageSize = Utils.PAGE_SIZE;
		Page<Administrator> page = adminService.getAdminsByPage(pageNum,pageSize);
		mav.addObject("page",page);
		return mav;
	}

	@RequestMapping(value = "/addAdminPage")
	public ModelAndView addAdminPage(){
		ModelAndView mav = new ModelAndView("admin_add");
		Administrator admin = new Administrator();
		mav.addObject("admin",admin);
		return mav;
	}

	@RequestMapping(value = "/addAdmin", method = RequestMethod.POST)
	public String addAdmin(String adminname, String password1,String password2, RedirectAttributes attributes){
		Administrator admin = new Administrator();
		if(adminname.isEmpty() || password1.isEmpty() || password2.isEmpty()){
			attributes.addFlashAttribute("error", "请确保每一项都不为空!");
			return "redirect:/admin/addAdminPage";
		}
		if(!password1.equals(password2)){
			attributes.addFlashAttribute("error", "两次密码不相同，添加失败!");
			return "redirect:/admin/addAdminPage";
		}
		admin.setUserName(adminname);
		admin.setPassword(password1);
		if(adminService.addAdmin(admin)){
			attributes.addFlashAttribute("message", "添加管理员成功!");
		}else {
			attributes.addFlashAttribute("error", "用户名已存在，添加失败!");
		}
		return "redirect:/admin/addAdminPage";
	}

	@RequestMapping(value = "/adminInfoPage")
	public ModelAndView adminInfoPage(int adminID){
		ModelAndView mav = new ModelAndView("admin_info");
		Administrator admin = adminService.getAdminByID(adminID);
		mav.addObject("admin",admin);
		return mav;
	}

	@RequestMapping(value = "/deleteAdmin")
	public String deleteAdmin(int adminID, RedirectAttributes attributes){
		Administrator admin = adminService.getAdminByID(adminID);
		if(adminID <=2){
			attributes.addFlashAttribute("error", "默认管理员，无法删除!");
			return "redirect:/admin/adminInfoPage?adminID="+adminID;
		}
		if(adminService.deleteAdmin(admin.getUserName())){
			attributes.addFlashAttribute("message", "删除成功!");
			return "redirect:/admin/adminList?pageNum=1";
		}else {
			attributes.addFlashAttribute("error", "删除失败!");
			return "redirect:/admin/adminInfoPage?adminID="+adminID;
		}
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public String addAdmin(int adminID, RedirectAttributes attributes){
		Administrator admin = adminService.getAdminByID(adminID);
		admin.setPassword(Utils.DEFAULT_ADMIN_PASSWORD);
		if(adminService.updateAdmin(admin)){
			attributes.addFlashAttribute("message", "重置密码成功!");
		}else {
			attributes.addFlashAttribute("error", "重置密码失败!");
		}
		return "redirect:/admin/adminInfoPage?adminID="+adminID;
	}

	@RequestMapping(value = "/readerList")
	public ModelAndView readerList(){
		ModelAndView mav = new ModelAndView("reader_list");
		int pageSize = Utils.PAGE_SIZE;
		Reader reader = new Reader();
		mav.addObject("reader",reader);
		Page<Reader> page = readerService.getReaderByPage(1,pageSize);
		mav.addObject("page",page);
		List<ReaderType> types = readerTypeService.getAllTypes();
		mav.addObject("types",types);
		return mav;
	}

	@RequestMapping(value = "/queryReader")
	public ModelAndView queryReader(String userName, int readerType,  int pageNum){
		ModelAndView mav = new ModelAndView("reader_list");
		Reader reader = new Reader();
		reader.setUserName(userName);
		reader.setReaderTypeID(readerType);
		int pageSize = Utils.PAGE_SIZE;
		Page<Reader> page = readerService.queryReader(reader,pageNum,pageSize);
		mav.addObject("reader",reader);
		mav.addObject("page",page);
		List<ReaderType> types = readerTypeService.getAllTypes();
		mav.addObject("types",types);
		return mav;
	}

	@RequestMapping(value = "/updateReaderPage")
	public ModelAndView updateReaderPage(int readerID){
		ModelAndView mav = new ModelAndView("reader_update");
		Reader reader = readerService.getReaderByID(readerID);
		mav.addObject("reader",reader);
		List<ReaderType> types = readerTypeService.getAllTypes();
		mav.addObject("types",types);
		return mav;
	}

	@RequestMapping(value = "/updateReader", method = RequestMethod.POST)
	public String updateReader(int readerID, int readerType,RedirectAttributes attributes){
		Reader reader = readerService.getReaderByID(readerID);
		reader.setReaderTypeID(readerType);
		if(readerService.updateReader(reader)){
			attributes.addFlashAttribute("message", "修改成功!");
		}else {
			attributes.addFlashAttribute("error", "修改失败!");
		}
		return "redirect:/admin/updateReaderPage?readerID="+readerID;
	}

	@RequestMapping(value = "/resetReaderPassword", method = RequestMethod.GET)
	public String resetReaderPassword(int readerID, RedirectAttributes attributes){
		Reader reader = readerService.getReaderByID(readerID);
		reader.setPassword(Utils.DEFAULT_READER_PASSWORD);
		if(readerService.updateReader(reader)){
			attributes.addFlashAttribute("message", "重置密码成功!");
		}else {
			attributes.addFlashAttribute("error", "重置密码失败!");
		}
		return "redirect:/admin/updateReaderPage?readerID="+readerID;
	}

	@RequestMapping(value = "/readerTypeList")
	public ModelAndView readerTypeList(int pageNum){
		ModelAndView mav = new ModelAndView("reader_type_list");
		int pageSize = Utils.PAGE_SIZE;
		Page<ReaderType> page = readerTypeService.getTypesByPage(pageNum,pageSize);
		mav.addObject("page",page);
		return mav;
	}

	@RequestMapping(value = "/addReaderTypePage")
	public ModelAndView addReaderTypePage(){
		ModelAndView mav = new ModelAndView("reader_type_add");
		ReaderType readerType = new ReaderType();
		mav.addObject("readerType",readerType);
		return mav;
	}

	@RequestMapping(value = "/addReaderType", method = RequestMethod.POST)
	public String addReaderType(String typeName, int books, int days, String description, RedirectAttributes attributes){
		ReaderType type = new ReaderType();
		type.setName(typeName);
		type.setBooks(books);
		type.setDays(days);
		type.setDescription(description);
		if(readerTypeService.addType(type)){
			attributes.addFlashAttribute("message", "添加图书类别成功!");
		}else {
			attributes.addFlashAttribute("error", "该类别已存在，添加失败!");
		}
		return "redirect:/admin/addReaderTypePage";
	}

	@RequestMapping(value = "/updateReaderTypePage")
	public ModelAndView updateReaderTypePage(int readerTypeID){
		ModelAndView mav = new ModelAndView("reader_type_info");
		ReaderType readerType =readerTypeService.getTypeByID(readerTypeID);
		mav.addObject("readerType",readerType);
		return mav;
	}

	@RequestMapping(value = "/updateReaderType", method = RequestMethod.POST)
	public String updateReaderType(int readerTypeID,String typeName, int books, int days, String description, RedirectAttributes attributes){
		ReaderType type = readerTypeService.getTypeByID(readerTypeID);
		type.setName(typeName);
		type.setBooks(books);
		type.setDays(days);
		type.setDescription(description);
		if(readerTypeService.updateType(type)){
			attributes.addFlashAttribute("message", "更新图书类别成功!");
		}else {
			attributes.addFlashAttribute("error", "该类别已存在，更新失败!");
		}
		return "redirect:/admin/updateReaderTypePage?readerTypeID="+readerTypeID;
	}

	@RequestMapping(value = "/deleteReaderType")
	public String deleteReaderType(int readerTypeID,RedirectAttributes attributes){
		ReaderType type = readerTypeService.getTypeByID(readerTypeID);
		if(readerTypeService.deleteType(readerTypeID)){
			attributes.addFlashAttribute("message", "删除图书类别成功!");
			return "redirect:/admin/readerTypeList?pageNum=1";
		}else {
			attributes.addFlashAttribute("error", "该类别已存在，更新失败!");
			return "redirect:/admin/updateReaderTypePage?readerTypeID="+readerTypeID;
		}
	}
}

