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
    <title>图书信息管理与推荐系统 | 读者管理</title>
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
<jsp:include page="include/admin_header.jsp" />

<div class="container">
    <!-- left, vertical navbar & content -->
    <div class="row">
        <jsp:include page="include/admin_sidebar.jsp"/>
        <div class="col-md-10">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default bootstrap-admin-no-table-panel">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">查询</div>
                        </div>
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                            <form class="form-horizontal" action="/admin/queryReader"  method="get">
                                <div class="row">
                                    <input hidden="hidden" name="pageNum" value="1"  >
                                    <div class="col-lg-5 form-group">
                                        <label class="col-lg-4 control-label" for="query_bno">读者帐号</label>
                                        <div class="col-lg-8">
                                            <input class="form-control" id="query_bno" name="userName" type="text" value="${reader.userName}" />
                                            <label class="control-label" for="query_bno" style="display: none;"></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 form-group">
                                        <label class="col-lg-4 control-label" for="readerType">读者类型</label>
                                        <div class="col-lg-8">
                                            <select class="form-control" id="readerType" name="readerType">
                                                <option value=0 selected>请选择</option>
                                                <c:forEach var="type" items="${types}">
                                                    <c:choose>
                                                        <c:when test="${type.readerTypeID == reader.readerTypeID}">
                                                            <option value=${type.readerTypeID} selected>${type.name}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value=${type.readerTypeID}>${type.name}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                            <label class="control-label" for="readerType" style="display: none;"></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 form-group">
                                        <button type="submit"  class="btn btn-primary" id="btn_query" >查询</button>
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
                            <th hidden="hidden">读者ID</th>
                            <th >读者帐号</th>
                            <th>读者类型</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>电话</th>
                            <th>已借阅本书</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <c:forEach var="item" items="${page.pageDatas}">
                            <tr>
                                <td hidden="hidden"> ${item.readerID}</td>
                                <td> ${item.userName}</td>
                                <td> ${item.readerTypeName}</td>
                                <c:if test="${item.sex==0}">
                                    <td> 保密</td>
                                </c:if>
                                <c:if test="${item.sex==1}">
                                    <td> 男</td>
                                </c:if>
                                <c:if test="${item.sex==2}">
                                    <td> 女</td>
                                </c:if>
                                <td> ${item.age}</td>
                                <td> ${item.phone}</td>
                                <td> ${item.borrowBookNum}</td>
                                <td> <a class="btn btn-primary" href="/admin/updateReaderPage?readerID=${item.readerID}">修改</a>
                                </td>
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
                        <a class="btn btn-primary" href="/admin/queryReader?userName=${reader.userName}&readerType=${reader.readerTypeID}&pageNum=1">首页</a>
                        <c:choose>
                            <c:when test="${page.isHavePrePage}">
                                <a class="btn btn-primary" href="/admin/queryReader?userName=${reader.userName}&readerType=${reader.readerTypeID}&pageNum=${page.pageIndex - 1}">上一页</a>
                            </c:when>
                            <c:when test="${!page.isHavePrePage}">
                                <a class="btn btn-primary" href="/admin/queryReader?userName=${reader.userName}&readerType=${reader.readerTypeID}&pageNum=1">上一页</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <%--<c:when test="${page.totalPages==0}">
                                <a href="/reader/bookList?readerID=${user.readerID}&pageNum=${page.pageIndex}">下一页</a>
                            </c:when>--%>
                            <c:when test="${page.isHaveNextPage}">
                                <a class="btn btn-primary" href="/admin/queryReader?userName=${reader.userName}&readerType=${reader.readerTypeID}&pageNum=${page.pageIndex + 1}">下一页</a>
                            </c:when>
                            <c:when test="${!page.isHaveNextPage}">
                                <a class="btn btn-primary" href="/admin/queryReader?userName=${reader.userName}&readerType=${reader.readerTypeID}&pageNum=${page.totalPages}">下一页</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${page.totalPages==0}">
                                <a class="btn btn-primary" href="/admin/queryReader?userName=${reader.userName}&readerType=${reader.readerTypeID}&pageNum=${page.pageIndex}">尾页</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-primary" href="/admin/queryReader?userName=${reader.userName}&readerType=${reader.readerTypeID}&pageNum=${page.totalPages}">尾页</a>
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
