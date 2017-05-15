<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Cedrus
  Date: 2017/4/25
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN" class="ax-vertical-centered">
<head>
    <title>图书信息管理与推荐系统 | 图书推荐</title>
    <style>
        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
        .table{
            font-size:13px;
        }
    </style>
    <jsp:include page="include/commonfile.jsp"/>
</head>
<body>
<jsp:include page="include/reader_header.jsp" />

<div class="container">
    <!-- left, vertical navbar & content -->
    <div class="row">
        <jsp:include page="include/reader_sidebar.jsp"/>
        <div class="col-md-10">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default bootstrap-admin-no-table-panel">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">图书推荐</div>
                        </div>
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                            根据您的习惯，我们猜想您可能对一下书本有兴趣
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <table id="data_list" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th hidden="hidden">图书编号</th>
                            <th >图书名称</th>
                            <th>作者</th>
                            <th>出版社</th>
                            <th>分类</th>
                            <th>共借阅次数</th>
                            <th>评分</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <c:forEach var="book" items="${books}">
                            <tr>
                                <td hidden="hidden"> ${book.bookID}</td>
                                <td> ${book.bookName}</td>
                                <td> ${book.author}</td>
                                <td> ${book.publish}</td>
                                <td> ${book.bookTypeName}</td>
                                <td> ${book.borrowTimes}</td>
                                <td> ${book.rating}</td>
                                <td> <a class="btn btn-primary" href="/reader/readerBookInfoPage?bookID=${book.bookID}">查看</a></td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="include/footer.jsp"/>
</body>
</html>
