<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>新增读者</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css"/>
    <title>全部读者信息</title>
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
<br/>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增读者</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/Reader/addReader" method="post" class="smart-green"
          id="addReaderForm">
        <div class="form-group">
            <label for="readerName"></label>
            读者姓名：<input type="text" class="form-control" name="readerNames" id="readerName">
            <p style="text-align: right;color: red;position: absolute" id="readerNameCheck"></p>
        </div>
        <div class="error-msg"></div>
        <div class="form-group">
            <label for="readerSex"></label>
        读者性别：<input type="text" id="readerSex" name="readerSex">
            <p style="text-align: right;color: red;position: absolute" id="SexCheck"></p>
        </div>
        <div class="error-msg"></div>
        读者类型：<input type="text" name="readerType">
        <div class="error-msg"></div>
        <div class="form-group">
            <label for="readerPwd"></label>
            读者密码：<input type="text" class="form-control" name="readerPwds" id="readerPwd">
            <p style="text-align: right;color: red;position: absolute" id="PwdCheck"></p>
        </div>
        <div class="error-msg"></div>
        <br/>
        <button type="button" class="button" id="addReaderButton">添加</button>
    </form>
    <script>
        $("#addReaderButton").click(function () {
            var readerName = $("#readerPwd").val();
            var readerPwd = $("#readerName").val();
            var readerSex= $("#readerSex").val();
            if (readerName == '' || readerPwd == ''||(readerSex!='男'&&readerSex!='女')) {
                if (readerName == '')
                    $("#readerNameCheck").text("提示:读者名称不能为空！");
                if (readerPwd == '')
                    $("#PwdCheck").text("提示:读者密码不能为空！");
                if(readerSex!='男'&&readerSex!='女'){
                    $("#SexCheck").text("提示：请输入正确的性别！");
                }
            }
            else {
                $("#addReaderForm").submit();
            }
        })
    </script>
</div>

</body>
</html>