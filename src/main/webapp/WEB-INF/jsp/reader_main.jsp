<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>读者主页</title>
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
<body background="${pageContext.request.contextPath}/img/p2.JPG" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    温馨提示
                </h4>
            </div>
            <div class="modal-body">
                欢迎使用图书管理系统，使用结束后请安全退出。
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">知道了
                </button>
            </div>
        </div>
    </div>
</div>

<div class="col-xs-6 col-md-offset-3" style="padding-top: 100px;position: relative">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">读者须知</h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <h4>借书须知：</h4>
                (1) 同一读者最多同时借阅<span style="color: red; ">5本不同</span>的书。<br>
                (2) 同一读者不能借阅<span style="color: red; ">2本相同</span>的书。<br>
                (3) 有逾期、损坏未赔偿情况的读者不能借书。需要先归还逾期图书/赔偿书籍损坏后方可借书。<br>
                (4) 图书在归还前<span style="color: red; ">10天</span>可以申请续借，续借将还书日期延后<span style="color: red; ">30天</span>。每本图书的借阅只能续借一次。具体可在左侧菜单“我的借阅”中查看<br>
                <h4>系统提示：</h4>
                (1) 图书借阅的状态共有6种，即“未归还”，“申请归还”，“已归还”，“逾期”，“损坏赔偿”，“已损坏赔偿”。
                (2) 图书归还需要在该网页上点击“申请归还”，管理员会在1个工作日内确认信息。<br>
                (3) 图书损坏赔偿需要在该网页上点击“损坏赔偿”，管理员会稍后联系您，待赔偿完毕后管理员会确认信息。<br>
                (4) 只要图书在“未归还”状态下才可以点击“申请归还”或“损坏赔偿”，否则操作无效。<br>
                (5) 图书在归还前10天可以申请续借，续借将还书日期延后30天。每本图书的借阅只能续借一次。有逾期图书不允许续借<br>
                (6) 有逾期、损坏未赔偿情况的读者不能借书。需要先归还逾期图书/赔偿书籍损坏后方可借书。<br>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $("#myModal").modal({
            show: true
        })
    })
</script>
</body>
</html>
