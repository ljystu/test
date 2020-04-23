<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登陆错误</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/js.cookie.js"></script>
    <style>
        #login {
            height: 50%;
            width: 28%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 5%;
            display: block;
            position: center;
        }

        .form-group {
            margin-bottom: 0;
        }

        * {
            padding: 0;
            margin: 0;
        }
    </style>
</head>
<body background="${pageContext.request.contextPath}/img/p2.JPG" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div class="panel panel-default" id="login">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">对不起，登陆失败！</h3>
    </div>
    <div class="panel-body">

        <h4>可能存在的问题：</h4>
        <h5>1.用户名或密码错误</h5>
        <h5>2.账户信息大小写不匹配</h5>

        <br>
        <div class="form-group">
            <label for="problem">其余问题由此反馈</label>
            <input type="text" class="form-control" id="problem" name="readerProblem" placeholder="请输入登录存在的问题">
        </div>

        <br>
        <input style="align-items:center" type="submit" value="提交" class="btn btn-success btn-sm" class="text-center">

        <br>
        <div class="text-center">
            <a href="${pageContext.request.contextPath}/Reader/register" class="r_float">没有帐户？点此立即注册！</a>
        </div>

        <br>
        <a class="btn btn-primary btn-block" href="${pageContext.request.contextPath}/Reader/backIndex">返回登录界面</a>
    </div>

</div>
</body>
</html>