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
<body background="${pageContext.request.contextPath}/img/p2.JPG" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

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
                    <input type="text" class="form-control" name="readerName" id="readerName" placeholder="只可填入数字学号" maxlength="20">
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span  class="input-group-addon">性别</span>
                    <input type="text" class="form-control" name="readerSex" id="readerSex" placeholder="男或女" maxlength="1">
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span class="input-group-addon">类型</span>
                    <input type="text" class="form-control" name="readerType" id="readerType" placeholder="teacher or student" maxlength="20" >
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span  class="input-group-addon">密码</span>
                    <input  type="password" class="form-control" name="readerPwd" id="readerPwd" maxlength="20" placeholder="密码最长为20位">
                </div>
                <br>
                <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
                <input style="align-items: center" type="submit" value="添加" class="btn btn-success btn-sm"
                       class="text-left" id="registerButton">
                <script>
                    $("#readerName").keyup(
                        function () {
                            if(isNaN($("#readerName").val())){
                                $("#info").text("提示:账号只能为数字学号");
                            }
                            else {
                                $("#info").text("");
                            }
                        }
                    )
                    $("#readerPwd").keyup(
                        function () {
                            if(isNaN($("#readerPwd").val())){
                                $("#info").text("提示:密码只能为数字");
                            }
                            else {
                                $("#info").text("");
                            }
                        }
                    )
                    $("#readerSex").keyup(
                        function () {
                            if($("#readerSex").val() != '男' && $("#readerSex").val() != '女'){
                                $("#info").text("提示:性别必须为男或女");
                            }
                            else {
                                $("#info").text("");
                            }
                        }
                    )
                    $("#readerType").keyup(
                        function () {
                            if($("#readerType").val() != 'teacher' && $("#readerType").val() != 'student'){
                                $("#info").text("提示:类型必须为student或teacher");
                            }
                            else {
                                $("#info").text("");
                            }
                        }
                    )

                    function mySubmit(flag){
                        return flag;
                    }
                    $("#readerRegister").submit(function () {
                        var readerName = $("#readerName").val();
                        var readerSex = $("#readerSex").val();
                        var readerType = $("#readerType").val();
                        var readerPwd = $("#readerPwd").val();

                        if($(readerPwd).val()==''||$(readerName).val()==''||$(readerSex).val()==''||$(readerType).val()==''){
                            alert("请填入完整读者信息！");
                            return mySubmit(false);
                        }
                        if(readerName == ''){
                            alert("提示：账号不能为空");
                            return mySubmit(false);
                        }
                        else if(readerPwd == ''){
                            alert("提示：密码不能为空");
                            return mySubmit(false);
                        }
                        else if(!/^\d+$/.test( readerName )){
                            alert("提示：账号必须为数字学号");
                            return mySubmit(false);
                        }
                        else if(!/^\d+$/.test( readerPwd )){
                            alert("提示：密码必须为数字");
                            return mySubmit(false);
                        }
                        else if(readerSex != '男' && readerSex != '女'){
                            alert("提示：性别必须为男或女");
                            return mySubmit(false);
                        }
                        else if(readerType != 'teacher' && readerType != 'student'){
                            alert("提示：类型必须为student或teacher");
                            return mySubmit(false);
                        }
                    })

                    $("#registerButton").click(function () {
                        var readerName = $("#readerName").val();
                        var readerSex = $("#readerSex").val();
                        var readerType = $("#readerType").val();
                        var readerPwd = $("#readerPwd").val();

                        if(readerName == ''){
                            alert("提示：账号不能为空");
                        }
                        else if(readerPwd == ''){
                            alert("提示：密码不能为空");
                        }
                        else if(!/^\d+$/.test( readerName )){
                            alert("提示：账号必须为数字学号");
                        }
                        else if(!/^\d+$/.test( readerPwd )){
                            alert("提示：密码必须为数字");
                        }
                        else if(readerSex != '男' && readerSex != '女'){
                            alert("提示：性别必须为男或女");
                        }
                        else if(readerType != 'teacher' && readerType != 'student'){
                            alert("提示：类型必须为student或teacher");
                        }
                        else {
                            $("#edit").submit();
                        }
                    })
                </script>
            </form>
        </div>
    </div>

</div>

</body>
</html>
