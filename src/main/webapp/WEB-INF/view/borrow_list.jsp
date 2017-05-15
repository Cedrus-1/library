<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书信息管理与推荐系统 | 借阅记录</title>
    <jsp:include page="include/commonfile.jsp"/>
    <style>
        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
        .table{
            font-size:13px;
        }
    </style>
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
                            <div class="text-muted bootstrap-admin-box-title">查询</div>
                        </div>
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                            <form class="form-horizontal" action="queryRecordList"  method="get">
                                <div class="row">
                                    <input hidden="hidden" name="pageNum" value="1"  />
                                    <div class="col-lg-5 form-group">
                                        <label class="col-lg-4 control-label" for="query_bno">借阅用户</label>
                                        <div class="col-lg-8">
                                            <input class="form-control" id="query_bno" name="readerName" type="text" value="${record.readerName}" />
                                            <label class="control-label" for="query_bno" style="display: none;"></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 form-group">
                                        <label class="col-lg-4 control-label" for="query_bname">归还状态</label>
                                        <div class="col-lg-8">
                                            <select class="form-control" name="isReturn">
                                                <c:if test="${record.isReturn==0}">
                                                    <option value=0 selected>未归还</option>
                                                    <option value=1 >已归还</option>
                                                </c:if>
                                                <c:if test="${record.isReturn==1}">
                                                    <option value=0 >未归还</option>
                                                    <option value=1 selected>已归还</option>
                                                </c:if>
                                            </select>
                                            <label class="control-label" for="query_bname" style="display: none;"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5 form-group">
                                        <label class="col-lg-4 control-label" for="query_bname">借阅图书</label>
                                        <div class="col-lg-8">
                                            <input class="form-control" id="query_bname" name="bookName" type="text" value="${record.bookName}">
                                            <label class="control-label" for="query_bname" style="display: none;"></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 form-group">
                                        <label class="col-lg-4 control-label" for="query_bname">借阅时间</label>
                                        <div class="col-lg-8">
                                            <select class="form-control" name="time">
                                                    <option value=1  <c:if test="${time==1}" > selected</c:if> >最近一个月</option>
                                                    <option value=3 <c:if test="${time==3}" > selected</c:if> >最近三个月</option>
                                                    <option value=6 <c:if test="${time==6}" > selected</c:if>>最近六个月</option>
                                                    <option value=12 <c:if test="${time==12}" > selected</c:if>>最近一年</option>
                                                    <option value=0 <c:if test="${time==0}" > selected</c:if>>全部记录</option>
                                            </select>
                                            <label class="control-label" for="query_bname" style="display: none;"></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 form-group">
                                        <button type="submit" class="btn btn-primary" id="btn_query" >查询</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <table id="data_list" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th hidden="hidden">记录编号</th>
                            <th>借阅图书</th>
                            <th>借阅用户</th>
                            <th>是否归还</th>
                            <th>借阅管理员</th>
                            <th>借阅时间</th>
                            <th>应归还时间</th>
                            <c:if test="${record.isReturn==1}">
                                <th>归还管理员</th>
                                <th>归还时间</th>
                            </c:if>
                            <c:if test="${record.isReturn==0}">
                                <th>操作</th>
                            </c:if>
                        </tr>
                        </thead>
                        <c:forEach var="item" items="${page.pageDatas}">
                            <tr>
                                <td hidden="hidden"> ${item.recordID}</td>
                                <td> ${item.bookName}</td>
                                <td> ${item.readerName}</td>
                                <td>
                                    <c:if test="${item.isReturn==0}">
                                    未归还
                                    </c:if>
                                    <c:if test="${item.isReturn==1}">
                                        已归还
                                    </c:if>
                                </td>
                                <td> ${item.borrowOperator}</td>
                                <td><fmt:formatDate value="${item.borrowTime}" type="date" dateStyle="long" /></td>
                                <td><fmt:formatDate value="${item.dueTime}" type="date" dateStyle="long" /></td>
                                <c:if test="${record.isReturn==1}">
                                    <td> ${item.returnOperator}</td>
                                    <td><fmt:formatDate value="${item.returnTime}" type="date" dateStyle="long" /></td>
                                </c:if>
                                <c:if test="${record.isReturn==0}">
                                    <td><a class="btn btn-primary "  href="returnBookPage?recordID=${item.recordID}">归还</a></td>
                                </c:if>

                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div align="center">
                        <font size="2">共 ${page.totalRecords} 条</font> <font size="2">第
                        ${page.pageIndex}/ ${page.totalPages} 页</font>
                        <a class="btn btn-primary" href="/admin/queryRecordList?readerName=${record.readerName}&bookName=${record.bookName}&isReturn=${record.isReturn}&time=${time}&pageNum=1">首页</a>

                        <c:choose>
                            <c:when test="${page.isHavePrePage}">
                                <a class="btn btn-primary" href="/admin/queryRecordList?readerName=${record.readerName}&bookName=${record.bookName}&isReturn=${record.isReturn}&time=${time}&pageNum=${page.pageIndex - 1}">上一页</a>
                            </c:when>
                            <c:when test="${!page.isHavePrePage}">
                                <a class="btn btn-primary" href="/admin/queryRecordList?readerName=${record.readerName}&bookName=${record.bookName}&isReturn=${record.isReturn}&time=${time}&pageNum=1">上一页</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${page.isHaveNextPage}">
                                <a class="btn btn-primary" href="/admin/queryRecordList?readerName=${record.readerName}&bookName=${record.bookName}&isReturn=${record.isReturn}&time=${time}&pageNum=${page.pageIndex + 1}">下一页</a>
                            </c:when>
                            <c:when test="${!page.isHaveNextPage}">
                                <a class="btn btn-primary" href="/admin/queryRecordList?readerName=${record.readerName}&bookName=${record.bookName}&isReturn=${record.isReturn}&time=${time}&pageNum=${page.totalPages}">下一页</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${page.totalPages==0}">
                                <a class="btn btn-primary" href="/admin/queryRecordList?readerName=${record.readerName}&bookName=${record.bookName}&isReturn=${record.isReturn}&time=${time}&pageNum=${page.pageIndex}">尾页</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-primary" href="/admin/queryRecordList?readerName=${record.readerName}&bookName=${record.bookName}&isReturn=${record.isReturn}&time=${time}&pageNum=${page.totalPages}">尾页</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<jsp:include page="include/footer.jsp"/>

</body>
</html>
