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
    <title>图书管理系统 | 图书类别</title>
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
                                <div class="text-muted bootstrap-admin-box-title">修改图书类别</div>
                            </div>
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <div class="row">
                                    <div class="col-lg-12 control-label " align="center" id="message-info"></div>
                                </div>
                                <form class="form-horizontal" id="form_update" action="/admin/updateBookType" method="post" onsubmit="return checkUpdateForm()">
                                    <input hidden="hidden" name="bookTypeID" value="${bookType.bookTypeID}" />
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="bookTypeName"><label class="text-danger">*&nbsp;</label>图书类别名称</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="bookTypeName" name="booktypename" type="text" value="${bookType.bookTypeName}"  />
                                                <label class="control-label" for="bookTypeName"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="description"><label class="text-danger">*&nbsp;</label>图书类别描述</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="description" name="description" type="text" value="${bookType.description}"  />
                                                <label class="control-label" for="description"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group" style="text-align: center;">
                                            <button type="submit" class="btn btn-lg btn-primary" id="btn_update_save" >修&nbsp;&nbsp;改</button>
                                            <a class="btn btn-lg btn-primary" id="btn_update_delete" href="/admin/deleteBookType?bookTypeID=${bookType.bookTypeID}">删&nbsp;&nbsp;除</a>
                                            <a class="btn btn-lg btn-primary" id="btn_update_back" href="/admin/bookTypeList?pageNum=1">返&nbsp;&nbsp;回</a>
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

    function checkUpdateForm() {
        var flag = true;
        var bookTypeName = $.trim($("#bookTypeName").val());
        if (bookTypeName=="") {
            $('#bookTypeName').parent().addClass("has-error");
            $('#bookTypeName').next().text("请输入图书类别名称");
            $("#bookTypeName").next().show();
            flag = false;
        }  else {
            $('#bookTypeName').parent().removeClass("has-error");
            $('#bookTypeName').next().text("");
            $("#bookTypeName").next().hide();
        }

        var description = $.trim($("#description").val());
        if (description == "") {
            $('#description').parent().addClass("has-error");
            $('#description').next().text("请输入类别描述");
            $("#description").next().show();
            flag = false;
        } else {
            $('#description').parent().removeClass("has-error");
            $('#description').next().text("");
            $("#description").next().hide();
        }
        return flag;
    }
</script>
</body>
</html>
