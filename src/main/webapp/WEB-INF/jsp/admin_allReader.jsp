<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>读者列表</title>
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
<br/>
<div class="container" style="margin-left: 250px">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h4>
                    读者列表 —— 所有读者
                </h4>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/Reader/toAddReader">新增</a>
        </div>

        <div class="col-md-6 column pull-right">
            <form class="form-inline" action="${pageContext.request.contextPath}/Reader/findReaderByName" method="post">
                <div class="input-group">
                    <span class="input-group-addon">关键字</span>
                    <label for="readerName"></label>
                    <input type="text"  id="readerName"class="form-control" maxlength="20" name="readerName" placeholder="请输入读者关键字">
                </div>

                <input type="submit" id="query" class="btn btn-primary" value="查询"/>
                <button id="cancel" class="btn btn-success"
                        href="${pageContext.request.contextPath}/Reader/allReader">重置
                </button>

            </form>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>读者编号</th>
                    <th>读者账号</th>
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
                        <td >${reader.getRentDate()}</td>
                        <td class="product-buyer-name">${reader.getReaderType()}</td>
                        <td class="product-buyer-name">${reader.getReaderNote()}</td>
                        <td>
                            <a class="btn btn-info btn-xs"
                               href="${pageContext.request.contextPath}/Reader/toUpdateReader?id=${reader.getReaderId()}">
                                <span class="glyphicon glyphicon-pencil"></span>更改</a>
                            <a class="btn btn-danger btn-xs"
                               href="${pageContext.request.contextPath}/Reader/del/${reader.getReaderId()}">
                                <span class="glyphicon glyphicon-trash"></span>删除</a>
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