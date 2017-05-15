<%--
  Created by IntelliJ IDEA.
  User: Cedrus
  Date: 2017/4/26
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<html>
<head>
    <title>图书信息管理与推荐系统 | 图书</title>
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
                                <div class="text-muted bootstrap-admin-box-title">借阅图书</div>
                            </div>
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <div class="row">
                                    <div class="col-lg-12 control-label " align="center" id="message-info"></div>
                                </div>
                                <form class="form-horizontal" id="form_update" action="/admin/borrowBook" method="post" >
                                    <input hidden name="bookID" value="${book.bookID}">
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_bookname"><label class="text-danger">*&nbsp;</label>借阅图书名称</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_bookname" name="bookname" type="text" disabled value="${book.bookName}"  />
                                                <label class="control-label" for="update_bookname"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_author"><label class="text-danger">*&nbsp;</label>作者</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_author" name="author" type="text" disabled value="${book.author}"  />
                                                <label class="control-label" for="update_author"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_publish"><label class="text-danger">*&nbsp;</label>出版社</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_publish" name="publish" type="text" disabled value="${book.publish}"  />
                                                <label class="control-label" for="update_publish"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_nowNumber"><label class="text-danger">*&nbsp;</label>剩余数量</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_nowNumber" name="nowNumber" type="number" disabled value="${book.nowNumber}"  />
                                                <label class="control-label" for="update_nowNumber"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_reader"><label class="text-danger">*&nbsp;</label>借阅人</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_reader" name="readerName" type="text"  value=""  />
                                                <label class="control-label" for="update_reader"></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12 form-group" style="text-align: center;">
                                            <button type="submit" class="btn btn-lg btn-primary" id="btn_update_save" >借&nbsp;&nbsp;阅</button>
                                            <a class="btn btn-lg btn-primary" id="btn_update_back" href="/admin/bookList">返&nbsp;&nbsp;回</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
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
