<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改信息</title>
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
<div id="header"></div>
<br/><br/>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改读者信息</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/Reader/updateReader" method="post" class="smart-green"
          id="updateReaderForm">
        <input type="hidden" name="readerId" value="${reader.getReaderId()}"/>
        <div class="form-group">
            <label for="updateReaderName"></label>
            读者名称：<input type="text" id="updateReaderName" name="readerName" value="${reader.getReaderName()}"/>
            <p style="text-align: right;color: red;position: absolute" id="readerNameCheck"></p>
        </div>
        <div class="error-msg"></div>
        读者类型：<input type="text" name="readerType" value="${reader.getReaderType()}"/>
        <div class="error-msg"></div>
        <div class="form-group">
            <label for="readerSex"></label>
            读者性别：<input type="text" name="readerSex" id="readerSex" value="${reader.getReaderSex() }"/>
            <p style="text-align: right;color: red;position: absolute" id="SexCheck"></p>
        </div>
        <div class="error-msg"></div>
        读者备注：<textarea type="text" name="readerNote" value="${reader.getReaderNote() }"></textarea>
        <div class="error-msg"></div>
        <button type="button" class="button" value="提交" id="updateReaderButton">提交</button>
    </form>
    <script>
        $("#updateReaderButton").click(function () {
            var updateReaderName = $("#updateReaderName").val();
            var readerSex = $("#readerSex").val();
            if (updateReaderName == '' || (readerSex != '男' && readerSex != '女')) {
                if (updateReaderName == '')
                    $("#readerNameCheck").text("提示:读者名称不能为空！");
                if (readerSex != '男' && readerSex != '女')
                    $("#SexCheck").text("提示：请输入正确的性别！");

            } else {
                $("#updateReaderForm").submit();
            }
        })
    </script>
</div>
</body>
</html>