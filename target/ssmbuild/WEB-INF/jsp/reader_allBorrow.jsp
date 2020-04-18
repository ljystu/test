<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的借书</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
                    我的借书
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
                    <th>书籍名称</th>
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
                        <td>${borrow.getBookName()}</td>
                        <td>${borrow.getReaderId()}</td>
                        <td>${borrow.getBorrowDate()}</td>
                        <td>${borrow.getReturnDate()}</td>
                        <td>${borrow.getSta()}</td>
                        <td>
                            <a class="btn btn-info btn-xs"
                               href="${pageContext.request.contextPath}/Borrow/request?id=${borrow.getbookBorrowId()}">
                                <span class="glyphicon glyphicon-pencil"></span>申请归还</a> |
                            <a class="btn btn-success btn-xs"
                               href="${pageContext.request.contextPath}/Borrow/renewBorrow?id=${borrow.getbookBorrowId()}">
                                <span class="glyphicon glyphicon-time"></span>续借</a> |
                            <a class="btn btn-danger btn-xs"
                               href="${pageContext.request.contextPath}/Borrow/reparation?id=${borrow.getbookBorrowId()}">
                                <span class="glyphicon glyphicon-remove-sign"></span>损坏赔偿</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div>
        提示：<br>
        (1) 图书借阅的状态共有6种，即“未归还”，“申请归还”，“已归还”，“逾期”，“损坏赔偿”，“已损坏赔偿”。<br>
        (2) 图书归还需要在该网页上点击“申请归还”，管理员会在1个工作日内确认信息。<br>
        (3) 图书损坏赔偿需要在该网页上点击“损坏赔偿”，管理员会稍后联系您，待赔偿完毕后管理员会确认信息。<br>
        (4) 只要图书在“未归还”或“逾期”状态下才可以点击“申请归还”或“损坏赔偿”，否则操作无效。<br>
        (5) 图书在归还前10天可以申请续借，续借将还书日期延后30天。每本图书的借阅只能续借一次。有逾期图书不允许续借<br>
        (6) 有逾期、损坏未赔偿情况的读者不能借书。需要先归还逾期图书/赔偿书籍损坏后方可借书。<br>
    </div>
</div>
</body>
</html>