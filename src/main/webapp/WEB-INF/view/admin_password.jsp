<%@ page import="org.springframework.web.servlet.ModelAndView" %><%--
  Created by IntelliJ IDEA.
  User: Cedrus
  Date: 2017/4/24
  Time: 0:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理系统 | 管理员</title>
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
                            <div class="text-muted bootstrap-admin-box-title">修改密码</div>
                        </div>
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                            <div class="row">
                                <div class="col-lg-12 control-label " align="center" id="message-info"></div>
                            </div>
                            <form class="form-horizontal" id="form_update" action="/admin/updatePass" method="post" onsubmit="return checkUpdatePassForm()">
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="update_oldpas"><label class="text-danger">*&nbsp;</label>原密码</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_oldpas" name="oldpass" type="password" value="">
                                            <label class="control-label" for="update_oldpas"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="newpass1"><label class="text-danger">*&nbsp;</label>新密码</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="newpass1" name="newpass1" type="password" value="">
                                            <label class="control-label" for="newpass1"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="newpass2"><label class="text-danger">*&nbsp;</label>确认密码</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="newpass2" name="newpass2" type="password" value="">
                                            <label class="control-label" for="newpass2"></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-12 form-group" style="text-align: center;">
                                        <button type="submit" class="btn btn-lg btn-primary" id="btn_update_save" >保&nbsp;&nbsp;存</button>
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
    function checkUpdatePassForm() {
        var flag = true;

        var oldpass = $("#update_oldpas").val();
        if(oldpass == ""){
            $('#update_oldpas').parent().addClass("has-error");
            $('#update_oldpas').next().text("请输入原密码");
            $("#update_oldpas").next().show();
            flag = false;
        }
        var update_newpas1 = $("#newpass1").val();
        if(update_newpas1 == ""){
            $('#newpass1').parent().addClass("has-error");
            $('#newpass1').next().text("请输入新密码");
            $("#newpass1").next().show();
            flag = false;
        }
        var update_newpas2 = $("#newpass2").val();
        if(update_newpas2 == ""){
            $('#newpass2').parent().addClass("has-error");
            $('#newpass2').next().text("请确认密码");
            $("#newpass2").next().show();
            flag = false;
        }
        return flag;
    }
</script>

</body>
</html>
