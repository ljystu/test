<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" media="screen" type="text/css">

</head>


<body style="">

<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<nav style="position:fixed;z-index: 1;width: 100%;background-color: #286090" class="navbar navbar-default"
     role="navigation">
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 45%;margin-right: 1% ">
            <a href="${pageContext.request.contextPath}/Admin/admin_main.html"
               style="width: 100%; display: inline-block; text-align: center; font-family: 华文行楷; font-size: 250%; color: white; ">图书管理系统</a>
        </div>
        <%--        <div class="collapse navbar-collapse" id="example-navbar-collapse">--%>
        <ul class="nav navbar-nav navbar-right">
            <li><a style="color: white"><span
                    class="glyphicon glyphicon-user"></span>${sessionScope.admin.adminName} 已登录</a>
            </li>
            <li></li>
            <li><a href="${pageContext.request.contextPath}/Admin/logout.html" style="color: white"><span
                    class="glyphicon glyphicon-off"></span>退出</a></li>
        </ul>
    </div>
</nav>
<div class="sidebar">
    <h1><i class="fa fa-bars push"></i>Library <span class="color">Menu</span></h1>
    <ul>

        <li><a href="#" style="color: rgb(85, 85, 85);"><i class="fa fa-user push"></i>读者管理<i
                class="fa fa-angle-right"></i></a><span class="hover" style="width: 0%; opacity: 0;"></span>
            <ul class="sub-menu">
                <li><a href="${pageContext.request.contextPath}/Reader/allReader" style="color: rgb(85, 85, 85);">管理所有读者<i
                        class="fa fa-angle-right"></i></a><span
                        class="hover" style="width: 0%; opacity: 0;"></span></li>
                <li><a href="${pageContext.request.contextPath}/Reader/toAddReader" style="color: rgb(85, 85, 85);">添加读者<i
                        class="fa fa-angle-right"></i></a><span
                        class="hover" style="width: 0%; opacity: 0;"></span></li>
            </ul>
        </li>
        <li><a href="#" style="color: rgb(85, 85, 85);"><i class="fa fa-file push"></i>书籍管理<i
                class="fa fa-angle-right"></i></a><span class="hover" style="width: 0%; opacity: 0;"></span>
            <ul class="sub-menu">
                <li><a href="${pageContext.request.contextPath}/book/allBook" style="color: rgb(85, 85, 85);">管理所有书籍<i
                        class="fa fa-angle-right"></i></a><span
                        class="hover" style="width: 0%; opacity: 0;"></span>
                </li>
                <li><a href="${pageContext.request.contextPath}/book/toAddBook" style="color: rgb(85, 85, 85);">添加书籍<i
                        class="fa fa-angle-right"></i></a><span class="hover" style="width: 0%; opacity: 0;"></span>
                </li>
            </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/Admin/admin_repasswd.html" style="color: rgb(85, 85, 85);"><i
                class="fa fa-cog push"></i>密码修改<i
                class="fa fa-angle-right"></i></a><span class="hover" style="width: 0%; opacity: 0;"></span>
        </li>
        <li><a href="#" style="color: rgb(85, 85, 85);"><i class="fa fa-dashboard push"></i>借还管理<i
                class="fa fa-angle-right"></i></a><span class="hover" style="width: 0%; opacity: 0;"></span>
            <ul class="sub-menu">
                <li><a href="${pageContext.request.contextPath}/Borrow/findRequest" style="color: rgb(85, 85, 85);">还书申请<i class="fa fa-angle-right"></i></a><span
                        class="hover" style="width: 0%; opacity: 0;"></span>
                </li>
                <li><a href="${pageContext.request.contextPath}/Borrow/findReparation" style="color: rgb(85, 85, 85);">损坏赔偿<i class="fa fa-angle-right"></i></a><span
                        class="hover" style="width: 0%; opacity: 0;"></span>
                </li>
                <li><a href="${pageContext.request.contextPath}/Borrow/allBorrow" style="color: rgb(85, 85, 85);">借还日志<i class="fa fa-angle-right"></i></a><span
                        class="hover" style="width: 0%; opacity: 0;"></span>
                </li>

            </ul>
        </li>
    </ul>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>

<script>
    $("li").hover(
        function () {
            $(this).find("a").css("color", "#FFF");
            $(this).find("span").stop().animate({
                width: "100%",
                opacity: "1",

            }, 600, function () {
                // Animation complete.
                // Show Navigation
            })
        }, function () {
            $(this).find("a").css("color", "#FFF");
            $(this).find("span").stop().animate({
                width: "0%",
                opacity: "0",
            }, 600, function () {
                // Animation complete.
                // Show Navigation
            })
        }
    );
</script>
</body>
