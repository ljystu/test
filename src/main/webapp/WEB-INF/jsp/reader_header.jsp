<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" media="screen" type="text/css">
</head>

<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<nav style="position:fixed;z-index: 1;width: 100%;background-color: #286090" class="navbar navbar-default"
     role="navigation">
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 45%;margin-right: 1% ">
            <a href="${pageContext.request.contextPath}/Reader/reader_main"
               style="width: 100%; display: inline-block; text-align: center; font-family: 华文行楷; font-size: 250%; color: white; ">我的图书馆</a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/Reader/reader_info.html" style="color: white"
                       class="glyphicon glyphicon-user">${sessionScope.reader.readerName}读者已登录</a></li>
                <li><a href="${pageContext.request.contextPath}/Reader/logout.html" style="color: white"
                       class="glyphicon glyphicon-off">退出</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="sidebar">
    <h1><i class="fa fa-bars push" ></i>Library <span class="color">Menu</span></h1>
    <ul>
        <li><a href="${pageContext.request.contextPath}/book/reader_allBook" style="color: rgb(85, 85, 85);"><i
                class="fa fa-book push"></i>图书查询<i
                class="fa fa-angle-right"></i></a><span class="hover" style="width: 0%; opacity: 0;"></span>

        </li>
        <li><a href="#" style="color: rgb(85, 85, 85);"><i class="fa fa-file push"></i>个人信息管理<i
                class="fa fa-angle-right"></i></a><span class="hover" style="width: 0%; opacity: 0;"></span>
            <ul class="sub-menu">
                <li><a href="${pageContext.request.contextPath}/Reader/reader_info.html"
                       style="color: rgb(85, 85, 85);">查看个人信息<i class="fa fa-angle-right"></i></a><span
                        class="hover" style="width: 0%; opacity: 0;"></span>
                </li>
                <li><a href="${pageContext.request.contextPath}/Reader/readerPersonal_edit.html"
                       style="color: rgb(85, 85, 85);">管理个人信息<i
                        class="fa fa-angle-right"></i></a><span class="hover" style="width: 0%; opacity: 0;"></span>
                </li>
            </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/Reader/reader_repasswd.html" style="color: rgb(85, 85, 85);"><i
                class="fa fa-cog push"></i>密码修改<i
                class="fa fa-angle-right"></i></a><span class="hover" style="width: 0%; opacity: 0;"></span>
        </li>
        <li><a href="${pageContext.request.contextPath}/Borrow/readerBorrow?id=${sessionScope.reader.readerId}"
               style="color: rgb(85, 85, 85);"><i
                class="fa fa-dashboard push"></i>我的借阅<i
                class="fa fa-angle-right"></i></a><span class="hover" style="width: 0%; opacity: 0;"></span>
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




