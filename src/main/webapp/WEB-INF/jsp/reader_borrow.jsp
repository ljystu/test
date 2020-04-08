<!DOCTYPE html><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>借还日志</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
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
                <h4 style="size: 10pt">
                    借还日志
                </h4>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">

        </div>


    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>读者编号</th>
                    <th>借书日期</th>
                    <th>还书日期</th>
                    <th>备注</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="borrow" items="${requestScope.get('list')}">
                    <tr>
                        <td>${borrow.getBookId()}</td>
                        <td>${borrow.getReaderId()}</td>
                        <td>${borrow.getBorrowDate()}</td>
                        <td>${borrow.getReturnDate()}</td>
                        <td>${borrow.getSta()}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/Borrow/request?id=${borrow.getIdbookBorrow()}">申请归还</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>