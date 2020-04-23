<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>读者更改密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
    </script>
</head>
<body>
<div id="header"></div>
<br>
<div class="container" style="margin-left: 250px">
    <div class="page-header">
        <h4>
            读者修改密码
        </h4>
    </div>
    <div style="position: relative">
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
                <form method="post" action="${pageContext.request.contextPath}/Reader/reader_repasswd_do" id="repasswd">
                    <div class="form-group">
                        <label>输入旧密码:</label>
                        <input type="password" id="oldPasswd" name="oldPasswd" placeholder="输入旧密码" class="form-control"
                               maxlength="20">
                        <br>
                        <label>输入新密码:</label>
                        <input type="password" id="newPasswd" name="newPasswd" placeholder="输入新密码" class="form-control"
                               maxlength="20">
                        <br>
                        <label>再次输入新密码:</label>
                        <input type="password" id="reNewPasswd" name="reNewPasswd" placeholder="再次输入新密码 最长20位"
                               maxlength="20"
                               class="form-control">
                        <br>
                        <em id="tishi" style="color: red"></em>
                        <br>
                        <span>
                            <input type="submit" value="确认修改" onclick="return warning()"
                                   class="btn btn-success btn-sm"/>
                               <a href="${pageContext.request.contextPath}/book/reader_allBook">
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

        function warning() {
            return confirm("确认要更改密码吗？") == true;
        }
    </script>
</div>
</body>
</html>
