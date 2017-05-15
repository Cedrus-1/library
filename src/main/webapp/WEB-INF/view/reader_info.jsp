<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Cedrus
  Date: 2017/4/24
  Time: 1:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书信息管理与推荐系统 | 读者</title>

    <jsp:include page="include/commonfile.jsp"/>
</head>
<body>
<jsp:include page="include/reader_header.jsp" />

<div class="container">
    <!-- left, vertical navbar & content -->
    <div class="row">
        <jsp:include page="include/reader_sidebar.jsp"/>
        <div class="col-md-10">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default bootstrap-admin-no-table-panel">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">修改个人信息</div>
                        </div>
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                            <div class="row">
                                <div class="col-lg-12 control-label " align="center" id="message-info"></div>
                            </div>
                            <form class="form-horizontal" id="form_update" action="/reader/updateInfo" method="post" onsubmit="return checkUpdateForm()">
                                <input type="hidden" id="update_id" name="readerID" value=${reader.readerID} />
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="update_username"><label class="text-danger">*&nbsp;</label>用户名</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_username" name="username" type="text" value="${reader.userName}" disabled />
                                            <label class="control-label" for="update_username"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group has">
                                        <label class="col-lg-3 control-label" for="update_type"><label class="text-danger">*&nbsp;</label>读者类别</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_type" type="text" value="${reader.readerTypeName}" disabled>
                                            <label class="control-label" for="update_type"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group has">
                                        <label class="col-lg-3 control-label" for="update_books"><label class="text-danger">*&nbsp;</label>已借阅本数</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_booknums" type="text" value="${reader.borrowBookNum}" disabled>
                                            <label class="control-label" for="update_type"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group has">
                                        <label class="col-lg-3 control-label" for="update_books"><label class="text-danger">*&nbsp;</label>可借阅本数</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_books" type="text" value="${reader.books}" disabled>
                                            <label class="control-label" for="update_type"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group has">
                                        <label class="col-lg-3 control-label" for="update_days"><label class="text-danger">*&nbsp;</label>可借阅天数</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_days" type="text" value="${reader.days}" disabled>
                                            <label class="control-label" for="update_days"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="update_sex"><label class="text-danger">*&nbsp;</label>性别</label>
                                        <div class="col-lg-7">
                                                <select  id="update_sex" name="sex" class="form-control">
                                                <c:choose>
                                                    <c:when test="${reader.sex == '0'}" >
                                                        <option value="0" selected>请选择</option>
                                                        <option value="1">男</option>
                                                        <option value="2">女</option>
                                                    </c:when>
                                                    <c:when test="${reader.sex == '1'}">
                                                        <option value="0">请选择</option>
                                                        <option value="1" selected>男</option>
                                                        <option value="2" >女</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="0">请选择</option>
                                                        <option value="1">男</option>
                                                        <option value="2" selected>女</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                 </select>
                                            <label class="control-label" for="update_sex"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="update_age"><label class="text-danger">*&nbsp;</label>年龄</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_age" name="age" type="number" value="${reader.age}">
                                            <label class="control-label" for="update_age"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="update_phone"><label class="text-danger">*&nbsp;</label>电话</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_phone" name="phone" type="number" value="${reader.phone}">
                                            <label class="control-label" for="update_phone"></label>
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

    function checkUpdateForm() {
        var flag = true;

        var sex = $("#update_sex").val();
        if(sex == 0){
            $('#update_sex').parent().addClass("has-error");
            $('#update_sex').next().text("请选择性别");
            $("#update_sex").next().show();
            flag = false;
        }

        var phone = $.trim($("#update_phone").val());
        if (phone == "") {
            $('#update_phone').parent().addClass("has-error");
            $('#update_phone').next().text("请输入电话");
            $("#update_phone").next().show();
            flag = false;
        } else if (!(/^1[34578]\d{9}$/.test(phone)) ) {
            $("#update_phone").parent().addClass("has-error");
            $("#update_phone").next().text("手机号码格式有误，请重填");
            $("#update_phone").next().show();
            flag = false;
        }
        return flag;
    }
</script>
</body>
</html>
