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
    <title>图书信息管理与推荐系统 | 图书</title>
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
                            <div class="text-muted bootstrap-admin-box-title">查询</div>
                        </div>
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                            <form class="form-horizontal" action="/reader/queryBook"  method="get">
                                <div class="row">
                                    <input hidden="hidden" name="pageNum" value="1"  />
                                    <input hidden="hidden" name="readerID" value=${user.readerID}  />
                                    <div class="col-lg-5 form-group">
                                        <label class="col-lg-4 control-label" for="query_bno">图书名称</label>
                                        <div class="col-lg-8">
                                            <input class="form-control" id="query_bno" name="bookname" type="text" value="${bookquery.bookName}" />
                                            <label class="control-label" for="query_bno" style="display: none;"></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 form-group">
                                        <label class="col-lg-4 control-label" for="query_bname">图书类型</label>
                                        <div class="col-lg-8">
                                            <select class="form-control" name="bookType">
                                                <option value=0 selected>请选择</option>
                                                <c:forEach var="type" items="${types}">
                                                    <c:choose>
                                                        <c:when test="${type.bookTypeID == bookquery.bookTypeID}">
                                                            <option value=${type.bookTypeID} selected>${type.bookTypeName}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value=${type.bookTypeID}>${type.bookTypeName}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                            <%--<input class="form-control" id="query_bname" name="auther" type="text" value="${bookquery.author}">--%>
                                            <label class="control-label" for="query_bname" style="display: none;"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5 form-group">
                                        <label class="col-lg-4 control-label" for="query_bname">作者</label>
                                        <div class="col-lg-8">
                                            <input class="form-control" id="query_bname" name="auther" type="text" value="${bookquery.author}">
                                            <label class="control-label" for="query_bname" style="display: none;"></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 form-group">
                                        <label class="col-lg-4 control-label" for="query_publish">出版社</label>
                                        <div class="col-lg-8">
                                            <input class="form-control" id="query_publish" name="publish" type="text" value="${bookquery.publish}" />
                                            <label class="control-label" for="query_publish" style="display: none;"></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 form-group">
                                        <button type="submit" class="btn btn-primary" id="btn_query" >查询</button>
                                    </div>
                                </div>
                            </form>
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
                            <th>翻译者</th>
                            <th>在馆数量</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <c:forEach var="book" items="${page.pageDatas}">
                            <tr>
                                <td hidden="hidden"> ${book.bookID}</td>
                                <td> ${book.bookName}</td>
                                <td> ${book.author}</td>
                                <td> ${book.publish}</td>
                                <td> ${book.bookTypeName}</td>
                                <td> ${book.translator}</td>
                                <td> ${book.nowNumber}</td>
                                <td> <a class="btn btn-primary" href="/reader/readerBookInfoPage?bookID=${book.bookID}">查看</a></td>
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
                        <a class="btn btn-primary" href="/reader/queryBook?bookname=${bookquery.bookName}&auther=${bookquery.author}&publish=${bookquery.publish}&bookType=${bookquery.bookTypeID}&pageNum=1">首页</a>
                        <c:choose>
                            <c:when test="${page.isHavePrePage}">
                                <a class="btn btn-primary" href="/reader/queryBook?bookname=${bookquery.bookName}&auther=${bookquery.author}&publish=${bookquery.publish}&bookType=${bookquery.bookTypeID}&pageNum=${page.pageIndex - 1}">上一页</a>
                            </c:when>
                            <c:when test="${!page.isHavePrePage}">
                                <a class="btn btn-primary" href="/reader/queryBook?bookname=${bookquery.bookName}&auther=${bookquery.author}&publish=${bookquery.publish}&bookType=${bookquery.bookTypeID}&pageNum=1">上一页</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <%--<c:when test="${page.totalPages==0}">
                                <a href="/reader/bookList?readerID=${user.readerID}&pageNum=${page.pageIndex}">下一页</a>
                            </c:when>--%>
                            <c:when test="${page.isHaveNextPage}">
                                <a class="btn btn-primary" href="/reader/queryBook?bookname=${bookquery.bookName}&auther=${bookquery.author}&publish=${bookquery.publish}&bookType=${bookquery.bookTypeID}&pageNum=${page.pageIndex + 1}">下一页</a>
                            </c:when>
                            <c:when test="${!page.isHaveNextPage}">
                                <a class="btn btn-primary" href="/reader/queryBook?bookname=${bookquery.bookName}&auther=${bookquery.author}&publish=${bookquery.publish}&bookType=${bookquery.bookTypeID}&pageNum=${page.totalPages}">下一页</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${page.totalPages==0}">
                                <a class="btn btn-primary" href="/reader/queryBook?bookname=${bookquery.bookName}&auther=${bookquery.author}&publish=${bookquery.publish}&bookType=${bookquery.bookTypeID}&pageNum=${page.pageIndex}">尾页</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-primary" href="/reader/queryBook?bookname=${bookquery.bookName}&auther=${bookquery.author}&publish=${bookquery.publish}&bookType=${bookquery.bookTypeID}&pageNum=${page.totalPages}">尾页</a>
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
