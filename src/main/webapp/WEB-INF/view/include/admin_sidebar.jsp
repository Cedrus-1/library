<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-md-2 bootstrap-admin-col-left content">
    <ul class="sidebar  nav navbar-collapse collapse bootstrap-admin-navbar-side">
        <li><a href="/admin/bookList"><i class="glyphicon glyphicon-chevron-right"></i> 图书管理  <br><i class="glyphicon glyphicon-chevron-right"></i>  借阅图书</a></li>
        <li><a href="/admin/bookTypeList?pageNum=1"><i class="glyphicon glyphicon-chevron-right"></i> 图书分类</a></li>
        <li><a href="/admin/borrowBookList"><i class="glyphicon glyphicon-chevron-right"></i> 借还记录 <br><i class="glyphicon glyphicon-chevron-right"></i>  归还图书</a></li>
        <li><a href="/admin/alarmList?pageNum=1"><i class="glyphicon glyphicon-chevron-right"></i> 近期应归还</a></li>
        <li><a href="/admin/adminList?pageNum=1"><i class="glyphicon glyphicon-chevron-right"></i> 管理员管理</a></li>
        <li><a href="/admin/readerList"><i class="glyphicon glyphicon-chevron-right"></i> 读者管理</a></li>
        <li><a href="/admin/readerTypeList?pageNum=1"><i class="glyphicon glyphicon-chevron-right"></i> 读者分类</a></li>
    </ul>
</div>
