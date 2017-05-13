<%--
  Created by IntelliJ IDEA.
  User: Cedrus
  Date: 2017/4/24
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
    <title>图书管理系统 | 注册</title>
    <link rel="stylesheet" href="${path}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${path}/static/css/common.css">
    <script src="${path}/static/js/lib/jquery.min.js"></script>
    <script src="${path}/static/js/lib/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h2  class="  login-head ">图书馆管理系统</h2>
            <div class="row">
                <div class="col-lg-12 control-label " align="center" id="message-info"></div>
            </div>
            <form class="bootstrap-admin-login-form" action="/register" method="post" onsubmit="return checkRegisterForm()">

                <div class="form-group">
                    <label class="control-label" for="username">账&nbsp;号(一旦设置，不可修改)</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="读者"/>
                    <label class="control-label" for="username" style="display:none;"></label>
                </div>
                <div class="form-group">
                    <label class="control-label" for="phone">手&nbsp;机</label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="手机"/>
                    <label class="control-label" for="phone" style="display:none;"></label>
                </div>
                <div class="form-group">
                    <label class="control-label" for="password">密&nbsp;码</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="密码"/>
                    <label class="control-label" for="password" style="display:none;"></label>
                </div>
                <input type="submit" class="btn btn-lg btn-primary" id="login_submit" value="注&nbsp;&nbsp;&nbsp;&nbsp;册"/>
                <a class="panel-footer-a" href="/login">已经注册？转去登陆</a>
            </form>
        </div>
    </div>
</div>

<script>
    if("${error}"){
        $("#message-info").text("${error}").css('color','red');
    }
    if("${message}"){
        $("#message-info").text("${message}");
    }
    function checkRegisterForm() {
        var flag = true;
        var username = $.trim($("#username").val());
        if (username == "") {
            $('#username').parent().addClass("has-error");
            $('#username').next().text("请输入账号");
            $("#username").next().show();
            flag = false;
        } else if (username.length > 20) {
            $("#username").parent().addClass("has-error");
            $("#username").next().text("账号长度不能大于20");
            $("#username").next().show();
            flag = false;
        } else {
            $('#username').parent().removeClass("has-error");
            $('#username').next().text("");
            $("#username").next().hide();
        }

        var password = $.trim($("#password").val());
        if (password == "") {
            $('#password').parent().addClass("has-error");
            $('#password').next().text("请输入密码");
            $("#password").next().show();
            flag = false;
        } else if (password.length > 20) {
            $("#password").parent().addClass("has-error");
            $("#password").next().text("密码长度不能大于20");
            $("#password").next().show();
            flag = false;
        } else {
            $('#password').parent().removeClass("has-error");
            $('#password').next().text("");
            $("#password").next().hide();
        }

        var phone = $.trim($("#phone").val());
        if (phone == "") {
            $('#phone').parent().addClass("has-error");
            $('#phone').next().text("请输入账号");
            $("#phone").next().show();
            flag = false;
        } else if (!(/^1[34578]\d{9}$/.test(phone)) ) {
            $("#phone").parent().addClass("has-error");
            $("#phone").next().text("手机号码有误，请重填");
            $("#phone").next().show();
            flag = false;
        } else {
            $('#phone').parent().removeClass("has-error");
            $('#phone').next().text("");
            $("#phone").next().hide();
        }
        return flag;
    }

</script>
</body>
</html>