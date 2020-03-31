<!DOCTYPE html><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<%--<body background="img/school.jpg" style=" background-repeat:no-repeat ;--%>
<%--background-size:100% 100%;--%>
<%--background-attachment: fixed;">--%>

<%--<div id="header"></div>--%>
<div class="col-xs-6 col-md-offset-3" style="padding-top: 100px;position: relative">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">读者注册</h3>
        </div>
        <div class="panel-body">
            <form action="${pageContext.request.contextPath}/Reader/registerReader" method="post" id="readerRegister" >

                <div class="input-group" style="padding-top: 20px;">
                    <span class="input-group-addon">学号</span>
                    <input type="text" class="form-control" name="readerName" id="readerName"  >
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span  class="input-group-addon">性别</span>
                    <input type="text" class="form-control" name="readerSex" id="readerSex" >
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span class="input-group-addon">类型</span>
                    <input type="text" class="form-control" name="readerType" id="readerType" placeholder="teacher or student" >
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span  class="input-group-addon">密码</span>
                    <input  type="password" class="form-control" name="readerPwd" id="readerPwd" >
                </div>
                <br>
                <input style="align-items: center" type="submit" value="添加" class="btn btn-success btn-sm"
                       class="text-left">
                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#readerRegister").submit(function () {
                        if($("#readerPwd").val()==''||$("#readerName").val()==''||$("#readerSex").val()==''||$("#readerType").val()==''){
                            alert("请填入完整读者信息！");
                            return mySubmit(false);
                        }
                    })
                </script>
            </form>
        </div>
    </div>

</div>

</body>
</html>
