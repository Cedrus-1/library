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
    <title>图书管理系统 | 读者管理</title>
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
                                <div class="text-muted bootstrap-admin-box-title">修改读者</div>
                            </div>
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <div class="row">
                                    <div class="col-lg-12 control-label " align="center" id="message-info"></div>
                                </div>
                                <form class="form-horizontal"  action="/admin/updateReader" method="post" >
                                    <input hidden="hidden" name="readerID" value="${reader.readerID}" />
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_booktypename"><label class="text-danger">*&nbsp;</label>读者帐号</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_booktypename" disabled type="text" value="${reader.userName}"  />
                                                <label class="control-label" for="update_booktypename"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_sex"><label class="text-danger">*&nbsp;</label>性别</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_sex" disabled type="text" value="${reader.sex}"  />
                                                <label class="control-label" for="update_sex"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_age"><label class="text-danger">*&nbsp;</label>年龄</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_age" disabled type="text" value="${reader.age}"  />
                                                <label class="control-label" for="update_age"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_phone"><label class="text-danger">*&nbsp;</label>电话</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_phone" disabled type="text" value="${reader.phone}"  />
                                                <label class="control-label" for="update_phone"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="update_num"><label class="text-danger">*&nbsp;</label>已借阅本书</label>
                                            <div class="col-lg-7">
                                                <input class="form-control" id="update_num" disabled type="text" value="${reader.borrowBookNum}"  />
                                                <label class="control-label" for="update_num"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <label class="col-lg-3 control-label" for="readerType"><label class="text-danger">*&nbsp;</label>读者类型</label>
                                            <div class="col-lg-7">
                                                <select class="form-control" id="readerType" name="readerType">
                                                    <c:forEach var="type" items="${types}">
                                                        <c:choose>
                                                            <c:when test="${type.readerTypeID == reader.readerTypeID}">
                                                                <option value=${type.readerTypeID} selected>${type.name}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value=${type.readerTypeID}>${type.name}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                                <label class="control-label" for="readerType"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group" style="text-align: center;">
                                            <button type="submit" class="btn btn-lg btn-primary" id="btn_update_save" >确认修改</button>
                                            <a class="btn btn-lg btn-primary" id="btn_update_reset" href="/admin/resetReaderPassword?readerID=${reader.readerID}">重置密码</a>
                                            <a class="btn btn-lg btn-primary" id="btn_update_back" href="/admin/readerList">返&nbsp;&nbsp;回</a>
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
