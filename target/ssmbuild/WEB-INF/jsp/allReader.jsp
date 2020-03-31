<!DOCTYPE html><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <title>全部图书信息</title>
    <%--    <link rel="stylesheet" href="css/bootstrap.min.css">--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body>
<div id="header"></div>
<br/>


<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>读者列表 —— 所有读者</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/Reader/toAddReader">新增</a>
        </div>

        <div class="colLast">
            <form action="${pageContext.request.contextPath}/Reader/findReaderByName" method="post">
                <input type="text" name="readerName"/>
                <input type="submit" value="查询"/>

            </form>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>读者编号</th>
                    <th>读者姓名</th>
                    <th>读者性别</th>
                    <th>借书数量</th>
                    <th>还书日期</th>
                    <th>读者类型</th>
                    <th>个人简介</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="reader" items="${requestScope.get('list')}">
                    <tr>
                        <td>${reader.getReaderId()}</td>
                        <td>${reader.getReaderName()}</td>
                        <td>${reader.getReaderSex()}</td>
                        <td>${reader.getReaderBooks()}</td>
                        <td>${reader.getRentDate()}</td>
                        <td>${reader.getReaderType()}</td>
                        <td>${reader.getReaderNote()}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/Reader/toUpdateReader?id=${reader.getReaderId()}">更改</a> |
                            <a href="${pageContext.request.contextPath}/Reader/del/${reader.getReaderId()}">删除</a>
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