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
    <style>
        .product-buyer-name {
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }</style>

</head>
<body>
<div id="header"></div>
<br>
<div class="container" style="margin-left: 250px">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h4>
                    书籍列表 —— 显示所有书籍
                </h4>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook">新增</a>
        </div>

        <div class="col-md-7 column pull-right">
            <form class="form-inline" id="searchForm" action="${pageContext.request.contextPath}/book/adminQueryBook"
                  method="post">

                <div class="input-group">
                    <span class="input-group-addon">关键字</span>
                    <label for="keyword"></label>
                    <input type="text" class="form-control" maxlength="20" id="keyword" name="keyword" placeholder="请输入书籍关键字">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">查询条件</span>
                    <label for="searchType"></label>

                    <select class="form-control" id="searchType" name="searchType">
                        <option>全部</option>
                        <option>书籍编号</option>
                        <option>书籍名称</option>
                        <option>书籍类型</option>
                        <option>书籍关键字</option>
                        <option>书籍详情</option>
                    </select>
                </div>
                <input type="submit" id="query" class="btn btn-primary" value="查询"/>

                <button id="cancel" class="btn btn-success"
                        href="${pageContext.request.contextPath}/book/allBook">重置
                </button>

            </form>
        </div>
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
                        <td class="product-buyer-name">${book.getBookName()}</td>
                        <td>${book.getBookCounts()}</td>
                        <td class="product-buyer-name">${book.getBookType()}</td>
                        <td class="product-buyer-name">${book.getBookKeyword()}</td>
                        <td class="product-buyer-name">${book.getDetail()}</td>
                        <td>
                            <a class="btn btn-info btn-xs"
                               href="${pageContext.request.contextPath}/book/toUpdateBook?id=${book.getBookID()}">
                                <span class="glyphicon glyphicon-pencil"></span>更改</a>
                            <a class="btn btn-danger btn-xs"
                               href="${pageContext.request.contextPath}/book/del/${book.getBookID()}"
                               onclick="return warning()">
                                <span class="glyphicon glyphicon-trash"></span>删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    function warning() {
        return confirm("确认要删除吗？") == true;
    }
</script>
</body>
</html>