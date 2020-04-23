<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css"/>
    <title>修改读者信息</title>
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
background-attachment: fixed;" onload="checkLength()">
<div id="header" style="padding-bottom: 80px"></div>
<div class="container" style="margin-left: 250px">
    <div class="col-xs-6 col-md-offset-3" style="position: relative">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">
                    管理读者信息
                </h3>
            </div>
            <div class="panel-body">
                <form action="${pageContext.request.contextPath}/Reader/updateReader" method="post"
                      id="updateReaderForm">

                    <div class="input-group">
                        <span class="input-group-addon">读者账号</span>
                        <input type="text" id="updateReaderName" class="form-control" readonly="readonly" maxlength="20"
                               name="readerName"
                               value="${reader.getReaderName()}"/>
                        <p style="text-align: right;color: red;position: absolute" id="readerNameCheck"></p>
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon">读者类型</span>
                        <input type="text" name="readerType" class="form-control" maxlength="20"
                               value="${reader.getReaderType()}"/>
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon">读者性别</span>
                        <input type="text" name="readerSex" class="form-control" maxlength="1" id="readerSex"
                               value="${reader.getReaderSex() }"/>

                    </div>
                    <p style="text-align: right;color: red;position: absolute" id="SexCheck"></p>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon">读者备注</span>
                        <textarea type="text" class="form-control" name="readerNote" id="readerNote" maxlength="200"
                                  onkeyup="checkLength()"
                                  maxlength="200">${reader.getReaderNote()}</textarea>
                    </div>
                    <br/>
                    <p>剩余字数：<span id="checkRest"></span></p>
                    <br/>
                    <button type="button" class="btn btn-success btn-sm " value="提交" id="updateReaderButton">提交
                    </button>
                    <a href="${pageContext.request.contextPath}/Reader/allReader">
                        <button type="button" class="btn btn-default btn-sm " onclick="return warning()" value="取消"
                                id="returnButton">取消
                        </button>
                    </a>
                </form>
                <script>
                    $("#updateReaderButton").click(function () {
                        var updateReaderName = $("#updateReaderName").val();
                        var readerSex = $("#readerSex").val();
                        if (updateReaderName == '' || (readerSex != '男' && readerSex != '女')) {
                            if (updateReaderName == '')
                                $("#readerNameCheck").text("提示:读者账号不能为空！");
                            else
                                $("#readerNameCheck").text("");
                            if (readerSex != '男' && readerSex != '女')
                                $("#SexCheck").text("提示：请输入正确的性别！");
                            else
                                $("#SexCheck").text("");
                        } else {
                            $("#updateReaderForm").submit();
                        }
                    })

                    function warning() {
                        return confirm("确认要放弃更改吗？") == true;
                    }

                    function checkLength() {
                        var maxChars = 200;
                        var x = document.getElementById("readerNote");
                        if (x.value.length > maxChars)
                            x.value = x.value.substring(0, maxChars);
                        var curr = maxChars - x.value.length;
                        document.getElementById("checkRest").innerHTML = curr.toString();
                    }
                </script>
            </div>
        </div>
    </div>
</div>
</body>
</html>