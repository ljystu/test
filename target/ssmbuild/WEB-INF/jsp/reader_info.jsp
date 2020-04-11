<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <title>读者信息查看</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
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
<body style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header" style="padding-bottom: 80px"></div>
<c:if test="${!empty succ}">
    <div class="alert alert-success alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
            ${succ}
    </div>
</c:if>
<c:if test="${!empty error}">
    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
            ${error}
    </div>
</c:if>
<div class="col-xs-5 col-md-offset-3">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                我的信息
            </h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover table-striped">

                <tr>
                    <th width="20%">读者编号</th>
                    <td>${readerInfo.readerId}</td>
                </tr>
                <tr>
                    <th>账号</th>
                    <td>${readerInfo.readerName}</td>
                </tr>
                <tr>
                    <th>性别</th>
                    <td>${readerInfo.readerSex}</td>
                </tr>
                <tr>
                    <th>类型</th>
                    <td class="product-buyer-name">${readerInfo.readerType}</td>
                </tr>
                <tr>
                    <th>简介</th>
                    <td class="product-buyer-name">${readerInfo.readerNote}</td>
                </tr>
            </table>
        </div>
        <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/Reader/readerPersonal_edit.html" role="button">修改</a>
    </div>
</div>


</body>
</html>
