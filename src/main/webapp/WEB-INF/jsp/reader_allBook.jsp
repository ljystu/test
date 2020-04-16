<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    .product-buyer-name {
        max-width: 200px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;}

    .containers {
        /*padding-right: 15px;*/
        /*padding-left: 15px;*/
        margin-right: auto;
        margin-left: auto
    }</style>
<head>
    <title>书籍列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
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

<body background="${pageContext.request.contextPath}/img/bg1.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed; height: 751px">

<div  id="header"></div>
<br/>
<div class="container" style="margin-left: 250px">

    <div class="row clearfix" style="background-color: #fff">
        <div class="col-md-12 column">
            <div class="page-header">
                <h4>
                    书籍列表 —— 显示所有书籍
                </h4>
            </div>
        </div>
    </div>

    <div class="row" style="background-color: #fff">
        <div class="col-md-7 column pull-right">

        <form class="form-inline" id="searchForm" action="${pageContext.request.contextPath}/book/readerQueryBook"
              method="post">
            <input type="hidden" name="currentPage" id="currentPage" >
            <input type="hidden" name="pageSize" id="pageSize" >
            <div class="input-group">
                <span class="input-group-addon">关键字</span>
            <label for="keyword"></label>
            <input type="text" class="form-control" id="keyword" maxlength="20" name="keyword" placeholder="请输入书籍关键字">
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
                    href="${pageContext.request.contextPath}/book/reader_allBook">重置
            </button>
        </form>
        </div>
    </div>


    <div class="row clearfix" style="background-color: #fff">
        <div class="col-md-12 column" >
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
                        <td class="product-buyer-name">${book.getBookType()}</td>
                        <td class="product-buyer-name">${book.getBookKeyword()}</td>
                        <td class="product-buyer-name">${book.getDetail()}</td>
                        <td>
                            <a class="btn btn-primary"
                               href="${pageContext.request.contextPath}/Borrow/addBorrow?bookId=${book.getBookID()}">
                                借阅</a>
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