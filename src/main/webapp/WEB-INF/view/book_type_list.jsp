<%--
  Created by IntelliJ IDEA.
  User: Cedrus
  Date: 2017/4/26
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理系统 | 管理员</title>
    <jsp:include page="include/commonfile.jsp"/>
    <style>
        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
        .table{
            font-size:16px;
        }
    </style>
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
                            <div class="text-muted bootstrap-admin-box-title">添加</div>
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <a  class="btn btn-primary" href="/admin/addbookTypePage" >添加</a>  点此添加一条数据
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-12 control-label " align="center" id="message-info"></div>
                    </div>
                    <table id="data_list" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th hidden="hidden">图书类别编号</th>
                            <th >图书类别名称</th>
                            <th >类别描述</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <c:forEach var="bookType" items="${page.pageDatas}">
                            <tr>
                                <td hidden="hidden"> ${bookType.bookTypeID}</td>
                                <td> ${bookType.bookTypeName}</td>
                                <td> ${bookType.description}</td>
                                <td> <a class="btn btn-primary "  href="/admin/getBookTypeInfo?bookTypeID=${bookType.bookTypeID}">修改</a>
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
                        <a class="btn btn-primary" href="/admin/bookTypeList?pageNum=1">首页</a>

                        <c:choose>
                            <c:when test="${page.isHavePrePage}">
                                <a class="btn btn-primary" href="/admin/bookTypeList?pageNum=${page.pageIndex - 1}">上一页</a>
                            </c:when>
                            <c:when test="${!page.isHavePrePage}">
                                <a class="btn btn-primary" href="/admin/bookTypeList?pageNum=1">上一页</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${page.isHaveNextPage}">
                                <a class="btn btn-primary" href="/admin/bookTypeList?pageNum=${page.pageIndex + 1}">下一页</a>
                            </c:when>
                            <c:when test="${!page.isHaveNextPage}">
                                <a class="btn btn-primary" href="/admin/bookTypeList?pageNum=${page.totalPages}">下一页</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${page.totalPages==0}">
                                <a class="btn btn-primary" href="/admin/bookTypeList?pageNum=${page.pageIndex}">尾页</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-primary" href="/admin/bookTypeList?pageNum=${page.totalPages}">尾页</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<jsp:include page="include/footer.jsp"/>

<script>
    if("${error}"){
        $("#message-info").text("${error}").css('color','red');
    }
    if("${message}"){
        $("#message-info").text("${message}");
    }
</script>
</body>
</html>
