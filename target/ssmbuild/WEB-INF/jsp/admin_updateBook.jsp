<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <title>全部图书信息</title>
    <%--    <link rel="stylesheet" href="css/bootstrap.min.css">--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css"/>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>

</head>
<body>
<div id="header"></div>
<br/>
<br/>
<div class="container" style="margin-left: 250px">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改信息</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/updateBook" method="post" class="smart-green"
          id="updateBookForm">
        <input type="hidden" name="bookID" value="${book.getBookID()}"/>
        <div class="form-group">
            <label for="updateBook"></label>
            书籍名称：<input type="text" id="updateBook" name="bookName" value="${book.getBookName()}"/>
            <p style="text-align: right;color: red;position: absolute" id="info"></p>
        </div>
        <div class="error-msg"></div>
        <div class="form-group">
            <label for="updateBookCount"></label>
            书籍数量：<input type="text" id="updateBookCount" name="bookCounts" value="${book.getBookCounts()}"/>
            <p style="text-align: right;color: red;position: absolute" id="countInfo"></p>
        </div>
        <div class="error-msg"></div>
        书籍类型：<input type="text" name="bookType" value="${book.getBookType()}"/>
        <div class="error-msg"></div>
        关键字：<input type="text" name="bookKeyword" value="${book.getBookKeyword()}"/>
        <div class="error-msg"></div>
        书籍详情：<textarea type="text" name="detail" onkeyup="checkLength(this)" maxlength="200">${book.getDetail() }</textarea>
        <div class="error-msg"></div>
        <p>剩余字数：<span id="checkRest"></span></p>
        <button type="button" class="button" value="提交" id="updateBookButton">提交</button>
    </form>
    <script>
        $("#updateBookButton").click(function () {
            var bookName = $("#updateBook").val();
            var bookCount = $("#updateBookCount").val();
            if (bookName == '' || !/^\d+$/.test(bookCount)) {
                if (bookName == '')
                    $("#info").text("提示:书籍名称不能为空！");
                if (!/^\d+$/.test(bookCount))
                    $("#countInfo").text("提示:请输入整数！");
            } else {
                $("#updateBookForm").submit();
            }
        })
        function checkLength(which) {
            var maxChars = 200;
            if (which.value.length > maxChars)
                which.value = which.value.substring(0, maxChars);
            var curr = maxChars - which.value.length;
            document.getElementById("checkRest").innerHTML = curr.toString();
        }
    </script>
    </table>

</div>
</body>
</html>