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
<bodystyle=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header" style="padding-bottom: 80px"></div>
<br/>
<div class="col-xs-5 col-md-offset-3">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                修改书籍信息
            </h3>
        </div>
        <div class="panel-body">

    <form action="${pageContext.request.contextPath}/book/updateBook" method="post" 
          id="updateBookForm">
       
        <div class="input-group">
            <span class="input-group-addon">书籍名称</span>
            <input type="text" id="updateBook" name="bookName" class="form-control" value="${book.getBookName()}"/>
            <p style="text-align: right;color: red;position: absolute" id="info"></p>
        </div>
        <div class="error-msg"></div>
        <div class="input-group">
            <span class="input-group-addon">书籍数量</span>
            <input type="text" id="updateBookCount" class="form-control"name="bookCounts" value="${book.getBookCounts()}"/>
            <p style="text-align: right;color: red;position: absolute" id="countInfo"></p>
        </div>
        <div class="error-msg"></div>
        <div class="input-group">
            <span class="input-group-addon">书籍类型</span>
        <input type="text" name="bookType"class="form-control" value="${book.getBookType()}"/>
        </div>
        <div class="error-msg"></div>
        <div class="input-group">
            <span class="input-group-addon">关键字</span>
        <input type="text" name="bookKeyword" class="form-control"value="${book.getBookKeyword()}"/>
        </div>
        <div class="error-msg"></div>
        <div class="input-group">
            <span class="input-group-addon">书籍详情</span>
        <textarea type="text" class="form-control"name="detail" onkeyup="checkLength(this)" maxlength="200">${book.getDetail() }</textarea>
        </div>
        <div class="error-msg"></div>
        <p>剩余字数：<span id="checkRest"></span></p>
        <button type="button" class="btn btn-success btn-sm" cvalue="提交" id="updateBookButton">提交</button>
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