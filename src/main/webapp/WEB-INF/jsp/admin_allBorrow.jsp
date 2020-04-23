<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>借还日志</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body>
<div id="header"></div>
<br>
<div class="container" style="margin-left: 250px">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h4>
                    借还日志
                </h4>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-7 column pull-right">
            <form class="form-inline" id="searchForm" action="${pageContext.request.contextPath}/Borrow/adminQueryBorrow"
                  method="post">

                <div class="input-group">
                    <span class="input-group-addon">关键字</span>
                    <label for="keyword"></label>
                    <input type="text" class="form-control" maxlength="20" id="keyword" name="keyword" placeholder="请输入关键字">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">查询条件</span>
                    <label for="searchType"></label>

                    <select class="form-control" id="searchType" name="searchType">
                        <option>读者编号</option>
                        <option>图书编号</option>
                        <option>借阅状态</option>
                    </select>
                </div>
                <input type="submit" id="query" class="btn btn-primary" value="查询"/>

                <button id="cancel" class="btn btn-success"
                        href="${pageContext.request.contextPath}/borrow/allBorrow">重置
                </button>

            </form>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>借阅编号</th>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>读者编号</th>
                    <th>借书日期</th>
                    <th>还书日期</th>
                    <th>借阅状态</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="borrow" items="${requestScope.get('list')}">
                    <tr>
                        <td>${borrow.getbookBorrowId()}</td>
                        <td>${borrow.getBookId()}</td>
                        <td>${borrow.getBookName()}</td>
                        <td>${borrow.getReaderId()}</td>
                        <td>${borrow.getBorrowDate()}</td>
                        <td>${borrow.getReturnDate()}</td>
                        <td>${borrow.getSta()}</td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>
</body>
</html>