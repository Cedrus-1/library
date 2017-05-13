<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理系统 | 借阅记录</title>
    <jsp:include page="include/commonfile.jsp"/>
    <style>
        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
        .table{
            font-size:13px;
        }
    </style>
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
                            <div class="text-muted bootstrap-admin-box-title">查询</div>
                        </div>
                        </div>
                    </div>
                </div>
            <div class="row">
                <div class="col-lg-12">
                    <table id="data_list" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th hidden="hidden">记录编号</th>
                            <th>借阅图书</th>
                            <th>借阅用户</th>
                            <th>是否归还</th>
                            <th>借阅管理员</th>
                            <th>借阅时间</th>
                            <th>应归还时间</th>
                            <th>归还管理员</th>
                            <th>归还时间</th>
                        </tr>
                        </thead>
                        <c:forEach var="item" items="${page.pageDatas}">
                            <tr>
                                <td hidden="hidden"> ${item.recordID}</td>
                                <td> ${item.bookName}</td>
                                <td> ${item.readerName}</td>
                                <td>
                                    <c:if test="${item.isReturn==0}">
                                    未归还
                                    </c:if>
                                    <c:if test="${item.isReturn==1}">
                                        已归还
                                    </c:if>
                                </td>
                                <td> ${item.borrowOperator}</td>
                                <td><fmt:formatDate value="${item.borrowTime}" type="date" dateStyle="long" /></td>
                                <td><fmt:formatDate value="${item.dueTime}" type="date" dateStyle="long" /></td>
                                <td> ${item.returnOperator}</td>
                                <td><fmt:formatDate value="${item.returnTime}" type="date" dateStyle="long" /></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div align="center">
                        <font size="2">共 ${page.totalRecords} 条</font> <font size="2">第
                        ${page.pageIndex}/ ${page.totalPages} 页</font>
                        <a class="btn btn-primary" href="/reader/borrowBookList?readerID=${sessionScope.get("userID")}&pageNum=1">首页</a>

                        <c:choose>
                            <c:when test="${page.isHavePrePage}">
                                <a class="btn btn-primary" href="/reader/borrowBookList?readerID=${sessionScope.get("userID")}&pageNum=${page.pageIndex - 1}">上一页</a>
                            </c:when>
                            <c:when test="${!page.isHavePrePage}">
                                <a class="btn btn-primary" href="/reader/borrowBookList?readerID=${sessionScope.get("userID")}&pageNum=1">上一页</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${page.isHaveNextPage}">
                                <a class="btn btn-primary" href="/reader/borrowBookList?readerID=${sessionScope.get("userID")}&pageNum=${page.pageIndex + 1}">下一页</a>
                            </c:when>
                            <c:when test="${!page.isHaveNextPage}">
                                <a class="btn btn-primary" href="/reader/borrowBookList?readerID=${sessionScope.get("userID")}&pageNum=${page.totalPages}">下一页</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${page.totalPages==0}">
                                <a class="btn btn-primary" href="/reader/borrowBookList?readerID=${sessionScope.get("userID")}&pageNum=${page.pageIndex}">尾页</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-primary" href="/reader/borrowBookList?readerID=${sessionScope.get("userID")}&pageNum=${page.totalPages}">尾页</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<jsp:include page="include/footer.jsp"/>

</body>
</html>
