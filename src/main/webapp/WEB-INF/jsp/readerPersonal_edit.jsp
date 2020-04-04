<%--
  Created by IntelliJ IDEA.
  User: ljy
  Date: 2020/4/4
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>书籍列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <title>全部图书信息</title>
    <%--    <link rel="stylesheet" href="css/bootstrap.min.css">--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
    </script>
</head>
<body  style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header" style="padding-bottom: 80px"></div>
<div class="col-xs-5 col-md-offset-3">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                信息修改
            </h3>
        </div>
        <div class="panel-body">
            <form action="${pageContext.request.contextPath}/Reader/readerPersonal_edit_do.html" method="post" id="edit" >
                <div class="input-group">
                    <span  class="input-group-addon">读者编号</span>
                    <input type="text" readonly="readonly" class="form-control" name="readerId" id="readerId" value="${readerInfo.readerId}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">账号</span>
                    <input type="text"  readonly="readonly" class="form-control" name="name" id="name" value="${readerInfo.readerName}" >
                    <p style="text-align: right;color: red;position: absolute" id="nameCheck"></p>
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">性别</span>
                    <input type="text" class="form-control" name="sex" id="sex"  value="${readerInfo.readerSex}" >
                    <p style="text-align: right;color: red;position: absolute" id="sexCheck"></p>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">类型</span>
                    <input type="text" class="form-control" name="type" id="type"  value="${readerInfo.readerType}" >
                    <p style="text-align: right;color: red;position: absolute" ></p>
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">简介</span>
                    <input type="text" class="form-control" name="detail" id="detail"  value="${readerInfo.readerNote}" >
                    <p style="text-align: right;color: red;position: absolute" ></p>
                </div>
                <br/>
                <button type="button" value="确定" class="btn btn-success btn-sm" class="text-left"id="editButton" >确定</button>
                <script>
                    $("#edit").submit(function () {
                        if($("#name").val()==''||$("#sex").val()==''){
                            alert("请填入完整信息！");
                            return false;
                        }
                    })

                    $("#editButton").click(function () {
                        var name = $("#name").val();
                        var sex = $("#sex").val();
                        if (name == '' || (sex != '男' && sex != '女')) {
                            if (name == '')
                                alert("提示:账号不能为空！");
                            if (sex != '男' && sex != '女')
                                alert("提示：请输入正确的性别！");

                        } else {
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