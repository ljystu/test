<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍列表</title>
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
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表 —— 显示所有书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook">新增</a>
        </div>


        <%--            <form action="${pageContext.request.contextPath}/book/QueryBookByName" method="post">--%>
        <%--                <label>--%>
        <%--                    图书名：  <input type="text" placeholder="输入图书名" name="bookName">--%>
        <%--            </label>--%>

        <%--                <label>--%>
        <%--                    图书类型： <input type="text" placeholder="输入图书名" name="bookName">--%>
        <%--            </label>--%>

        <%--                <label>--%>
        <%--                    书籍编号：  <input type="text" placeholder="输入图书名" name="bookName">--%>
        <%--            </label>--%>

        <%--                <label>--%>
        <%--                    书籍关键字：<input type="text" placeholder="输入图书名" name="bookName">--%>
        <%--                </label>--%>

        <%--                <input type="submit" value="查询"/>--%>

        <%--            </form>--%>
        <form class="form-inline" id="searchForm" action="${pageContext.request.contextPath}/book/QueryBook"
              method="post">
            <input type="hidden" name="currentPage" id="currentPage" value="${qo.currentPage}">
            <input type="hidden" name="pageSize" id="pageSize" value="${qo.pageSize}">
            <label for="keyword">关键字:</label>
            <input type="text" class="form-control" id="keyword" name="keyword" placeholder="请输入书籍关键字">

            <label for="searchType">查询条件：</label>
            <select class="form-control" id="searchType"name="searchType">
                <option >全部</option>
                <option>书籍编号</option>
                <option >书籍名称</option>
                <option >书籍类型</option>
                <option >书籍关键字</option>
                <option >书籍详情</option>
            </select>
            <input type="submit" id="query" class="btn btn-default" value="查询"/>

            <button  id="cancel" class="btn btn-default"
                    href="${pageContext.request.contextPath}/book/allBook">重置
            </button>


        </form>
    </div>


    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名字</th>
                    <th>书籍数量</th>
                    <th>书籍类型</th>
                    <th>关键字</th>
                    <th>书籍详情</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="book" items="${requestScope.get('list')}">
                    <tr>
                        <td>${book.getBookID()}</td>
                        <td>${book.getBookName()}</td>
                        <td>${book.getBookCounts()}</td>
                        <td>${book.getBookType()}</td>
                        <td>${book.getBookKeyword()}</td>
                        <td>${book.getDetail()}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/book/toUpdateBook?id=${book.getBookID()}">更改</a>
                            |
                            <a href="${pageContext.request.contextPath}/book/del/${book.getBookID()}">删除</a>
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