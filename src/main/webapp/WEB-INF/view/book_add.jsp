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
                                <div class="text-muted bootstrap-admin-box-title">添加图书</div>
                            </div>
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <div class="row">
                                    <div class="col-lg-12 control-label " align="center" id="message-info"></div>
                                </div>
                                <form class="form-horizontal" id="form_update" action="/admin/addBook" method="post" onsubmit="return checkAddForm()">
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_bookname"><label class="text-danger">*&nbsp;</label>图书名称</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_bookname" name="bookname" type="text" value="${book.bookName}"  >
                                                <label class="control-label" for="update_bookname"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_author"><label class="text-danger">*&nbsp;</label>作者</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_author" name="author" type="text" value="${book.author}"  />
                                                <label class="control-label" for="update_author"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_publish"><label class="text-danger">*&nbsp;</label>出版社</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_publish" name="publish" type="text" value="${book.publish}"  />
                                                <label class="control-label" for="update_publish"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group has">
                                            <label class="col-lg-3 control-label" for="update_bookType"><label class="text-danger">*&nbsp;</label>图书类别</label>
                                            <div class="col-lg-7">
                                                <select class="form-control" name="bookType" id="update_bookType">
                                                    <c:forEach var="type" items="${types}">
                                                        <c:choose>
                                                            <c:when test="${type.bookTypeID == book.bookTypeID}">
                                                                <option value=${type.bookTypeID} selected>${type.bookTypeName}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value=${type.bookTypeID}>${type.bookTypeName}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_translator">翻译者</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_translator" name="translator" type="text" value="${book.translator}"  />
                                                <label class="control-label" for="update_translator"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_ISBN"><label class="text-danger">*&nbsp;</label>ISBN</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_ISBN" name="ISBN" type="number" value="${book.ISBN}"  />
                                                <label class="control-label" for="update_ISBN"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_price"><label class="text-danger">*&nbsp;</label>价格</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_price" name="price" type="text" value="${book.price}"  />
                                                <label class="control-label" for="update_price"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_totalNumber"><label class="text-danger">*&nbsp;</label>总数量</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_totalNumber" name="totalNumber" type="number" value="${book.totalNumber}"  />
                                                <label class="control-label" for="update_totalNumber"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_nowNumber"><label class="text-danger">*&nbsp;</label>在馆数量</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_nowNumber" name="nowNumber" type="number" value="${book.nowNumber}"  />
                                                <label class="control-label" for="update_nowNumber"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_description">书本描述</label>
                                            <div class="col-lg-7">
                                                <textarea class="form-control" rows="10" id="update_description" name="description" >${book.description}</textarea>
                                                <label class="control-label" for="update_description"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group" style="text-align: center;">
                                            <button type="submit" class="btn btn-lg btn-primary" id="btn_update_save" >添&nbsp;&nbsp;加</button>
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

    function checkAddForm() {
        var flag = true;
        var bookname = $.trim($("#update_bookname").val());
        if (bookname == "") {
            $('#update_bookname').parent().addClass("has-error");
            $('#update_bookname').next().text("请输入图书名称");
            $("#update_bookname").next().show();
            flag = false;
        }else {
            $('#update_bookname').parent().removeClass("has-error");
            $('#update_bookname').next().text("");
            $("#update_bookname").next().hide();
        }

        var author = $.trim($("#update_author").val());
        if (author == "") {
            $('#update_author').parent().addClass("has-error");
            $('#update_author').next().text("请输入作者");
            $("#update_author").next().show();
            flag = false;
        }else {
            $('#update_author').parent().removeClass("has-error");
            $('#update_author').next().text("");
            $("#update_author").next().hide();
        }

        var publish = $.trim($("#update_publish").val());
        if (publish == "") {
            $('#update_publish').parent().addClass("has-error");
            $('#update_publish').next().text("请输入出版社");
            $("#update_publish").next().show();
            flag = false;
        }  else {
            $('#update_publish').parent().removeClass("has-error");
            $('#update_publish').next().text("");
            $("#update_publish").next().hide();
        }

        var bookType = $.trim($("#update_bookType").val());
        if (bookType == 0) {
            $('#update_bookType').parent().addClass("has-error");
            $('#update_bookType').next().text("请选择");
            $("#update_bookType").next().show();
            flag = false;
        }  else {
            $('#update_bookType').parent().removeClass("has-error");
            $('#update_bookType').next().text("");
            $("#update_bookType").next().hide();
        }

        var ISBN = $.trim($("#update_ISBN").val());
        if (ISBN=='') {
            $('#update_ISBN').parent().addClass("has-error");
            $('#update_ISBN').next().text("请输入ISBN");
            $("#update_ISBN").next().show();
            flag = false;
        }  else {
            $('#update_ISBN').parent().removeClass("has-error");
            $('#update_ISBN').next().text("");
            $("#update_ISBN").next().hide();
        }
        return flag;
    }
</script>
</body>
</html>
