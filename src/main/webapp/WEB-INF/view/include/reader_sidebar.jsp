<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- sidebar start -->
<div class="col-md-2 bootstrap-admin-col-left content" >
    <ul class="sidebar nav navbar-collapse collapse bootstrap-admin-navbar-side">
        <li><a href="/reader/bookList"><i class="glyphicon glyphicon-chevron-right"></i> 图书查询</a></li>
        <li><a href="/reader/recommendedPage?pageNum=1"><i class="glyphicon glyphicon-chevron-right"></i> 图书推荐</a></li>
        <li><a href="/reader/borrowBookList?pageNum=1&readerID=${sessionScope.get("userID")}"><i class="glyphicon glyphicon-chevron-right"></i> 借阅记录</a></li>
        <li><a href="/reader/returnBookList?pageNum=1&readerID=${sessionScope.get("userID")}"><i class="glyphicon glyphicon-chevron-right"></i> 归还记录</a></li>
    </ul>
</div>
<!-- sidebar end -->