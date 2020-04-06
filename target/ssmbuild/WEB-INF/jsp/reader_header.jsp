<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav style="position:fixed;z-index: 999;width: 100%;background-color: #286090"class="navbar navbar-default" role="navigation" >
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand " href="${pageContext.request.contextPath}/Reader/reader_main"><p class="text-primary" style="font-family: 华文行楷; font-size: 200%;color: white ">我的图书馆</p></a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
                <li>
                    <a href="reader_books.html"style="color: white">
                        图书查询
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/Reader/reader_info.html" style="color: white">
                        个人信息
                    </a>
                </li>
                <li >
                    <a href="${pageContext.request.contextPath}/Reader/borrowBook" style="color: white">
                        借书
                    </a>
                </li>
                <li >
                    <a href="${pageContext.request.contextPath}/Reader/reader_repasswd.html" style="color: white">
                        密码修改
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/Reader/reader_info.html"style="color: white">${sessionScope.reader.readerName}, 已登录</a></li>
                <li><a href="${pageContext.request.contextPath}/Reader/logout.html"style="color: white">退出</a></li>
            </ul>
        </div>
    </div>
</nav>
