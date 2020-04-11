<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员更改密码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body >
<div id="header"></div>
<br>
<div class="container" style="margin-left: 250px">
<div class="page-header">
    <h4>
        管理员修改密码
    </h4>
</div>
<div style="position: relative; ">
    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
            &times;
        </button>
        <h5>系统提醒：请修改为更为安全的密码！且修改前后密码不可一致！</h5>
    </div>
<%--    上方提示框判断是否更改成功--%>
    <c:if test="${!empty error}">
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${error}
        </div>
    </c:if>
    <c:if test="${!empty succ}">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${succ}
        </div>
    </c:if>

</div>
<div class="col-xs-6 col-md-offset-3" style="position: relative;">
    <div class="panel panel-primary ">
        <div class="panel-heading">
            <h3 class="panel-title">密码修改</h3>
        </div>
        <div class="panel-body">
            <form method="post" action="${pageContext.request.contextPath}/Admin/admin_repasswd_do" id="repasswd">
                <div class="form-group">
                    <label>输入旧密码:</label>
                    <input type="password" id="oldPasswd" name="oldPasswd" placeholder="输入旧密码" class="form-control" >
                    <br>
                    <label>输入新密码:</label>
                    <input type="password" id="newPasswd" name="newPasswd" placeholder="输入新密码" class="form-control">
                    <br>
                    <label>再次输入新密码:</label>
                    <input type="password" id="reNewPasswd" name="reNewPasswd" placeholder="再次输入新密码" class="form-control" >
                    <br>
                    <em id="tishi" style="color: red"></em>
                    <br>
                    <span>
                            <input type="submit" value="确认修改" class="btn btn-success btn-sm ">
                        <a href="${pageContext.request.contextPath}/book/allBook">
                        <button type="button" class="btn btn-default btn-sm " value="取消" id="returnButton">取消</button>
                         </a>
                    </span>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(document).keyup(function () {
        if ($("#newPasswd").val() != $("#reNewPasswd").val() && $("#newPasswd").val() != "" && $("#reNewPasswd").val() != "" && $("#newPasswd").val().length == $("#reNewPasswd").val().length) {
            $("#tishi").text("两次输入的新密码不同，请检查");
        } else {
            $("#tishi").text("");
        }
    })

    $("#repasswd").submit(function () {
        if ($("#oldPasswd").val() == '' || $("#newPasswd").val() == '' || $("#reNewPasswd").val() == '') {
            $("#tishi").text("请填写完毕后提交");
            return false;
        } else if ($("#newPasswd").val() != $("#reNewPasswd").val()) {
            $("#tishi").text("两次输入的新密码不同，请检查");
            return false;
        }
    })
</script>
</div>
</body>
</html>
