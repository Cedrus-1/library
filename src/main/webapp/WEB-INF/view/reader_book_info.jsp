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
                                <div class="text-muted bootstrap-admin-box-title">图书信息</div>
                            </div>
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <div class="row">
                                    <div class="col-lg-12 control-label " align="center" id="message-info"></div>
                                </div>
                                <div class="form-horizontal">
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" ><label class="text-danger">*&nbsp;</label>图书名称</label>
                                        <div class="col-lg-7 ">
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
                                            <input class="form-control" id="update_publish" name="publish" disabled type="text" value="${book.publish}"  />
                                            <label class="control-label" for="update_publish"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group has">
                                        <label class="col-lg-3 control-label"><label class="text-danger">*&nbsp;</label>图书类别</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="bookTypeName" name="publish" disabled type="text" value="${book.bookTypeName}"  />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="update_translator"><label class="text-danger">*&nbsp;</label>翻译者</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_translator" name="translator" type="text" disabled value="${book.translator}"  />
                                            <label class="control-label" for="update_translator"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="update_ISBN"><label class="text-danger">*&nbsp;</label>ISBN</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_ISBN" name="ISBN" type="text" disabled value="${book.ISBN}"  />
                                            <label class="control-label" for="update_ISBN"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="update_price"><label class="text-danger">*&nbsp;</label>价格</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_price" name="price" type="text" disabled value="${book.price}"  />
                                            <label class="control-label" for="update_price"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="update_totalNumber"><label class="text-danger">*&nbsp;</label>总数量</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_totalNumber" name="totalNumber" disabled type="text" value="${book.totalNumber}"  />
                                            <label class="control-label" for="update_totalNumber"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="update_nowNumber"><label class="text-danger">*&nbsp;</label>在馆数量</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_nowNumber" name="nowNumber" disabled type="text" value="${book.nowNumber}"  />
                                            <label class="control-label" for="update_nowNumber"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="update_borrowTimes"><label class="text-danger">*&nbsp;</label>借阅次数</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_borrowTimes"  disabled type="text" value="${book.borrowTimes}"  />
                                            <label class="control-label" for="update_borrowTimes"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="update_rating"><label class="text-danger">*&nbsp;</label>评分</label>
                                        <div class="col-lg-7">
                                            <input class="form-control" id="update_rating"  disabled type="text" value="${book.rating}"  />
                                            <label class="control-label" for="update_rating"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-3 control-label" for="update_description">书本描述</label>
                                        <div class="col-lg-7">
                                            <textarea class="form-control"  rows="10" id="update_description" disabled name="description" >${book.description}</textarea>
                                            <label class="control-label" for="update_description"></label>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </div>
</div>




<jsp:include page="include/footer.jsp"/>

</body>
</html>
