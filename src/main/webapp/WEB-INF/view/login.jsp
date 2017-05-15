<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
  <title>图书信息管理与推荐系统 | 登陆</title>

  <link rel="stylesheet" href="${path}/static/css/bootstrap.min.css">
  <link rel="stylesheet" href="${path}/static/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="${path}/static/css/common.css">
  <script src="${path}/static/js/lib/jquery.min.js"></script>
  <script src="${path}/static/js/lib/bootstrap.min.js"></script>
<%--  <script src="${path}/static/js/login.js"></script>--%>

<%--  <style type="text/css">
    .alert{
      margin: 0 auto 20px;
      text-align: center;
    }
  </style>--%>

</head>
<body>

  <div class="container">
      <div class="row">
          <div class="col-lg-12">
              <h2  class="  login-head ">图书信息管理与推荐系统</h2>
              <div class="row">
                <div class="col-lg-12 control-label " align="center" id="message-info"></div>
              </div>

            <form class="bootstrap-admin-login-form" action="/login" method="post" onsubmit="return checkLoginForm()">
                  <div class="form-group">
                      <label class="control-label" for="username">账&nbsp;号</label>
                      <input type="text" class="form-control" id="username" name="username" placeholder="读者/管理员"/>
                      <label class="control-label" for="username" style="display:none;"></label>
                  </div>
                  <div class="form-group">
                      <label class="control-label" for="password">密&nbsp;码</label>
                      <input type="password" class="form-control" id="password" name="password" placeholder="密码"/>
                      <label class="control-label" for="password" style="display:none;"></label>
                  </div>
                  <div class="form-group">
                      <label for="role">身&nbsp;份</label>
                      <select class="form-control" id="role" name="role">
                          <option value="1">读者</option>
                          <option value="2">管理员</option>
                      </select>
                  </div>
                  <input type="submit" class="btn btn-lg btn-primary" id="login_submit" value="登&nbsp;&nbsp;&nbsp;&nbsp;录"/>
                <a class="panel-footer-a" href="/register">还未注册？赶紧去注册一个</a>
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

    /**
     * check the login form before user login.
     * @returns {boolean}
     */
    function checkLoginForm(){
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
        if(flag){
            $('#submit').attr('value','正在登陆~');
        }
        return flag;
    }
</script>

</body>
</html>