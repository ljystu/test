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
<body style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header" style="padding-bottom: 80px"></div>
<br/>
<div class="container" style="margin-left: 250px">
    <div class="col-xs-6 col-md-offset-3" style="position: relative">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">
                    新增读者
                </h3>
            </div>
            <div class="panel-body">
                <form action="${pageContext.request.contextPath}/Reader/addReader" method="post"
                      id="addReaderForm">
                    <div class="input-group">
                        <span class="input-group-addon">读者账号</span>
                        <input type="text" class="form-control" name="readerName" id="readerName" maxlength="20">

                    </div>
                    <p style="text-align: right;color: red;position: absolute" id="readerNameCheck"></p>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon">读者性别</span>
                        <input type="text" id="readerSex" name="readerSex" maxlength="1" class="form-control">

                    </div>
                    <p style="text-align: right;color: red;position: absolute" id="SexCheck"></p>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon">读者类型</span>
                        <input type="text" name="readerType" class="form-control" maxlength="20">
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon">读者密码</span>
                        <input type="text" class="form-control" name="readerPwd" id="readerPwd" maxlength="20"
                               placeholder="密码最长为20位">
                    </div>
                    <p style="text-align: right;color: red;position: absolute" id="PwdCheck"></p>
                    <br/>
                    <button type="button" class="btn btn-success btn-sm " id="addReaderButton">添加</button>
                    <a href="${pageContext.request.contextPath}/Reader/allReader">
                        <button type="button" class="btn btn-default btn-sm " onclick="return warning()" value="取消" id="returnButton">取消
                        </button>
                    </a>
                    <script>
                        $("#addReaderButton").click(function () {
                            var readerName = $("#readerName").val();
                            var readerPwd = $("#readerPwd").val();
                            var readerSex = $("#readerSex").val();
                            if (readerName == '' || readerPwd == '' || (readerSex != '男' && readerSex != '女')) {
                                if (readerName == '')
                                    $("#readerNameCheck").text("提示:读者账号不能为空！");
                                else
                                    $("#readerNameCheck").text("");
                                if (readerPwd == '')
                                    $("#PwdCheck").text("提示:读者密码不能为空！");
                                else
                                    $("#PwdCheck").text("");
                                if (readerSex != '男' && readerSex != '女') {
                                    $("#SexCheck").text("提示：请输入正确的性别！");
                                } else
                                    $("#SexCheck").text("");
                            } else {
                                $("#addReaderForm").submit();
                            }
                        })
                        function warning() {
                            return confirm("确认要取消添加吗？") == true;
                        }
                    </script>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>