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
    <link type="text/css" rel="stylesheet"href="${pageContext.request.contextPath}/css/form.css"/>
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
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改信息</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/updateBook" method="post" class="smart-green">
        <input type="hidden" name="bookID" value="${book.getBookID()}"/>
        书籍名称：<input type="text" name="bookName" value="${book.getBookName()}"/>
        <div class="error-msg"></div>
        书籍数量：<input type="text" name="bookCounts" value="${book.getBookCounts()}"/>
        <div class="error-msg"></div>
        书籍类型：<input type="text" name="bookType" value="${book.getBookType()}"/>
        <div class="error-msg"></div>
        关键字：<input type="text" name="bookKeyword" value="${book.getBookKeyword()}"/>
        <div class="error-msg"></div>
        书籍详情：<textarea type="text" name="detail" value="${book.getDetail() }"></textarea>
        <div class="error-msg"></div>
        <input type="submit" class="button" value="提交"/>
    </form>
    </table>

</div>
</body>
</html>