<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <title>修改图书信息</title>
    <%--    <link rel="stylesheet" href="css/bootstrap.min.css">--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css"/>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>

</head>
<body style="
background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;" onload="checkLength()">
<div id="header" style="padding-bottom: 80px"></div>
<br/>
<div class="container" style="margin-left: 250px">
<div class="col-xs-6 col-md-offset-3" style="position: relative">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">
                修改书籍信息
            </h3>
        </div>
        <div class="panel-body">

            <form action="${pageContext.request.contextPath}/book/updateBook" method="post"
                  id="updateBookForm">
                <input type="hidden" name="bookID" value="${book.getBookID()}">
                <div class="input-group">
                    <span class="input-group-addon">书籍名称</span>
                    <label for="updateBook"></label>
                    <input type="text" id="updateBook" name="bookName" class="form-control" maxlength="20"
                           value="${book.getBookName()}"/>
                </div>
                <p style="text-align: right;color: red;position: absolute" id="info"></p>
                <br/>
                <div class="input-group">
                    <span class="input-group-addon">书籍数量</span>
                    <label for="updateBookCount"></label>
                    <input type="text" id="updateBookCount" class="form-control" name="bookCounts" maxlength="6"
                           value="${book.getBookCounts()}"/>
                </div>
                <p style="text-align: right;color: red;position: absolute" id="countInfo"></p>
                <br/>
                <div class="input-group">
                    <span class="input-group-addon">书籍类型</span>
                    <label for="bookType"></label>
                    <input type="text" id="bookType" name="bookType" class="form-control" maxlength="20"
                           value="${book.getBookType()}"/>
                </div>
                <br/>
                <div class="input-group">
                    <span class="input-group-addon">关键字</span>
                    <input type="text" name="bookKeyword" class="form-control" maxlength="20"
                           value="${book.getBookKeyword()}"/>
                </div>
                <br/>
                <div class="input-group">
                    <span class="input-group-addon">书籍详情</span>
                    <textarea type="text" class="form-control" name="detail" id="detail" onkeyup="checkLength()"
                              maxlength="200">${book.getDetail() }</textarea>
                </div>
                <br/>
                <p>剩余字数：<span id="checkRest" ></span></p>
                <button type="button" class="btn btn-success btn-sm " value="提交" id="updateBookButton">提交</button>
                <a href="${pageContext.request.contextPath}/book/allBook">
                    <button type="button" class="btn btn-default btn-sm " value="取消" id="returnButton">取消</button>
                </a>
            </form>
            <script>
                $("#updateBookButton").click(function () {
                    var bookName = $("#updateBook").val();
                    var bookCount = $("#updateBookCount").val();
                    if (bookName == '' || !/^\d+$/.test(bookCount) || bookCount == 0) {
                        if (bookName == '')
                            $("#info").text("提示:书籍名称不能为空！");
                        else
                            $("#info").text("");
                        if (!/^\d+$/.test(bookCount))
                            $("#countInfo").text("提示:请输入整数！");
                        else if (bookCount == 0)
                            $("#countInfo").text("提示:书籍数量不可为0！");
                        else
                            $("#countInfo").text("");
                    } else {
                        $("#updateBookForm").submit();
                    }
                })

                function checkLength() {
                    var maxChars = 200;
                    var x=document.getElementById("detail");
                    if (x.value.length > maxChars)
                        x.value = x.value.substring(0, maxChars);
                    var curr = maxChars - x.value.length;
                    document.getElementById("checkRest").innerHTML = curr.toString();
                }
            </script>
            </table>

        </div>
    </div>
</div>
</div>
</body>
</html>