<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>新增书籍</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css"/>
    <title>全部图书信息</title>
    <%--    <link rel="stylesheet" href="css/bootstrap.min.css">--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body>
<div id="header" style="margin-left: 250px"></div>
<br/>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增书籍</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/book/addBook" method="post" class="smart-green" id="addBookForm">
        <div class="form-group">
            <label for="addBook"></label>
            书籍名称：<input id="addBook" class="form-control" type="text" name="bookName"/>
            <p style="text-align: right;color: red;position: absolute" id="info"></p>
        </div>
        <div class="error-msg"></div>
        <div class="form-group">
            <label for="updateBookCount"></label>
        书籍数量：<input id="updateBookCount" type="text" name="bookCounts"/>
            <p style="text-align: right;color: red;position: absolute" id="countInfo"></p>
        </div>
        <div class="error-msg"></div>
        书籍种类：<input type="text" name="bookType"/>
        <div class="error-msg"></div>
        关键字：<input type="text" name="bookKeyword"/>
        <div class="error-msg"></div>
        书籍详情：<textarea type="text" name="detail"></textarea>
        <div class="success-msg"></div>
        <span>&nbsp;</span>
        <BUTTON type="button" class="button" id="addBookButton">添加</BUTTON>
    </form>
    <script>
        $("#addBookButton").click(function () {
            var bookName = $("#addBook").val();
            var bookCount = $("#updateBookCount").val();
            if (bookName == '' || !/^\d+$/.test(bookCount)) {
                if (bookName == '')
                    $("#info").text("提示:书籍名称不能为空！");
                if (!/^\d+$/.test(bookCount))
                    $("#countInfo").text("提示:请输入整数！");
            } else {
                $("#addBookForm").submit();
            }
        })


        function isInteger(obj) {
            return typeof obj === 'number' && obj%1 === 0
        }
    </script>
</div>

</body>
</html>