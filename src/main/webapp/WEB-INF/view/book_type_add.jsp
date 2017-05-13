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
                                <div class="text-muted bootstrap-admin-box-title">添加图书类别</div>
                            </div>
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <div class="row">
                                    <div class="col-lg-12 control-label " align="center" id="message-info"></div>
                                </div>
                                <form class="form-horizontal" id="form_update" action="/admin/addbookType" method="post" onsubmit="return checkaddForm()">
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_booktypename"><label class="text-danger">*&nbsp;</label>图书类别名称</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_booktypename" name="booktypename" type="text" value="${bookType.bookTypeName}"  />
                                                <label class="control-label" for="update_booktypename"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_description"><label class="text-danger">*&nbsp;</label>图书类别描述</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_description" name="description" type="text" value="${bookType.description}"  />
                                                <label class="control-label" for="update_description"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group" style="text-align: center;">
                                            <button type="submit" class="btn btn-lg btn-primary" id="btn_update_save" >添&nbsp;&nbsp;加</button>
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
    function checkaddForm() {
        var flag = true;
        var update_booktypename = $.trim($("#update_booktypename").val());
        if (update_booktypename == "") {
            $('#update_booktypename').parent().addClass("has-error");
            $('#update_booktypename').next().text("请输入图书类别名称");
            $("#update_booktypename").next().show();
            flag = false;
        }  else {
            $('#update_booktypename').parent().removeClass("has-error");
            $('#update_booktypename').next().text("");
            $("#update_booktypename").next().hide();
        }

        var update_description = $.trim($("#update_description").val());
        if (update_description == "") {
            $('#update_description').parent().addClass("has-error");
            $('#update_description').next().text("请输入类别描述");
            $("#update_description").next().show();
            flag = false;
        } else {
            $('#update_description').parent().removeClass("has-error");
            $('#update_description').next().text("");
            $("#update_description").next().hide();
        }
        return flag;
    }
</script>
</body>
</html>
