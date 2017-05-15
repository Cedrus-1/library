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
    <title>图书信息管理与推荐系统 | 管理员</title>
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
                                <div class="text-muted bootstrap-admin-box-title">添加管理员</div>
                            </div>
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <div class="row">
                                    <div class="col-lg-12 control-label " align="center" id="message-info"></div>
                                </div>
                                <form class="form-horizontal" id="form_update" action="/admin/addAdmin" method="post" onsubmit="return checkForm()">
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="adminname"><label class="text-danger">*&nbsp;</label>管理员帐号</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="adminname" name="adminname" type="text" value="${admin.userName}"  />
                                                <label class="control-label" for="adminname"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="password1"><label class="text-danger">*&nbsp;</label>密码</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="password1" name="password1" type="password" value="${admin.password}"  />
                                                <label class="control-label" for="password1"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="password2"><label class="text-danger">*&nbsp;</label>确认密码</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="password2" name="password2" type="password" value="${admin.password}"  />
                                                <label class="control-label" for="password2"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group" style="text-align: center;">
                                            <button type="submit" class="btn btn-lg btn-primary" id="btn_update_save" >添&nbsp;&nbsp;加</button>
                                            <a class="btn btn-lg btn-primary" id="btn_update_back" href="/admin/adminList?pageNum=1">返&nbsp;&nbsp;回</a>
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

    function checkForm() {
        var flag = true;
        var adminname = $.trim($("#adminname").val());
        if (adminname == "") {
            $('#adminname').parent().addClass("has-error");
            $('#adminname').next().text("请输入账号");
            $("#adminname").next().show();
            flag = false;
        }  else {
            $('#adminname').parent().removeClass("has-error");
            $('#adminname').next().text("");
            $("#adminname").next().hide();
        }

        var password1 = $.trim($("#password1").val());
        if (password1 == "") {
            $('#password1').parent().addClass("has-error");
            $('#password1').next().text("请输入密码");
            $("#password1").next().show();
            flag = false;
        }else {
            $('#password1').parent().removeClass("has-error");
            $('#password1').next().text("");
            $("#password1").next().hide();
        }

        var password2 = $.trim($("#password2").val());
        if (password2 == "") {
            $('#password2').parent().addClass("has-error");
            $('#password2').next().text("请输入账号");
            $("#password2").next().show();
            flag = false;
        }  else {
            $('#password2').parent().removeClass("has-error");
            $('#password2').next().text("");
            $("#password2").next().hide();
        }
        return flag;
    }
</script>
</body>
</html>
