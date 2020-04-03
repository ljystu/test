<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员登陆页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
    <script src="${pageContext.request.contextPath}/js/js.cookie.js"></script>
    <style>
        #login{
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
            padding:0;
            margin:0;
        }
    </style>
</head>
<body background="${pageContext.request.contextPath}/img/p2.JPG" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<%--<c:if test="${!empty error}">--%>
<%--    <script>--%>
<%--        alert("${error}");--%>
<%--        window.location.href="login.html";--%>
<%--    </script>--%>
<%--</c:if>--%>
<%--<h2 style="text-align: center; color: white; font-family: '华文行楷'; font-size: 500%">图 书 管 理 系 统</h2>--%>

<div class="panel panel-default" id="login">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">管理员请登录</h3>
    </div>
    <form action="${pageContext.request.contextPath}/Admin/login" method="post" id="loginForm">
        <div class="panel-body">

            <div class="form-group">

                <label for="username">账号</label>
                <input type="text" class="form-control" id="username" name="readerName" placeholder="请输入账号">
            </div>
            <div class="form-group">
                <label for="password">密码</label>
                <input type="password" class="form-control" id="password" name="readerPwd" placeholder="请输入密码">
            </div>

            <div class="checkbox text-left">
                <label>
                    <input type="checkbox" id="remember">记住密码
                </label>
            </div>
            <div class="text-right">
                <a href="#" class="r_float">忘记密码？</a>
            </div>

            <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
            <button id="loginButton" type="button" class="btn btn-primary  btn-block">登陆</button>
        </div>
    </form>
</div>
<script>
    $("#username").keyup(
        function () {
            if(isNaN($("#username").val())){
                $("#info").text("提示:账号只能为数字");
            }
            else {
                $("#info").text("");
            }
        }
    )
    // 记住登录信息
    function rememberLogin(username, password, checked) {
        Cookies.set('loginStatus', {
            username: username,
            password: password,
            remember: checked
        }, {expires: 30, path: ''})
    }
    // 若选择记住登录信息，则进入页面时设置登录信息
    function setLoginStatus() {
        var loginStatusText = Cookies.get('loginStatus')
        if (loginStatusText) {
            var loginStatus
            try {
                loginStatus = JSON.parse(loginStatusText);
                $('#username').val(loginStatus.username);
                $('#password').val(loginStatus.password);
                $("#remember").prop('checked',true);
            } catch (__) {}
        }
    }

    // 设置登录信息
    setLoginStatus();
    $("#loginButton").click(function () {
        var id =$("#username").val();
        var passwd=$("#password").val();
        var remember=$("#remember").prop('checked');
        if (id == '') {
            $("#info").text("提示:账号不能为空");
        }
        else if( passwd ==''){
            $("#info").text("提示:密码不能为空");
        }
        else if(isNaN( id )){
            $("#info").text("提示:账号必须为数字");
        }
        else {
            $("#loginForm").submit();
        }
    })

</script>
</div>

</body>
</html>