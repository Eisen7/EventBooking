<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0051)https://v4.bootcss.com/docs/4.0/examples/offcanvas/ -->
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://v4.bootcss.com/favicon.ico">

    <title>SilkRoad</title>

    <!-- Bootstrap core CSS -->
    <link href="../../down/list_files/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../down/list_files/offcanvas.css" rel="stylesheet">
    <link href="/resources/common.css" rel="stylesheet">

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        function delBooking(classId) {
            $.ajax({
                url: "/delBooking.do",
                type: "POST",
                dataType: "json",
                data: "classId=" + classId,
                success: function (data) {
                    alert(data.data);
                    if (data.state === 0) {
                        window.location.href = "/classList.do";
                    }else{
                        window.location.href = "/index.jsp";
                    }
                }
            })
        }

        function booking(classId) {
            $.ajax({
                url: "/booking.do",
                type: "POST",
                dataType: "json",
                data: "classId=" + classId,
                success: function (data) {
                    alert(data.data);
                    if (data.state === 0) {
                        window.location.href = "/classList.do";
                    }else{
                        window.location.href = "/index.jsp";
                    }
                }
            })
        }


        var t = null;
        t = setTimeout(time, 1000);//開始运行
        function time() {
            clearTimeout(t);//清除定时器
            dt = new Date();
            var yyyy = dt.getFullYear();
            var MM = dt.getMonth() + 1;
            var dd = dt.getDay();
            var h = dt.getHours();//获取时
            var m = dt.getMinutes();//获取分
            var s = dt.getSeconds();//获取秒
            document.getElementById("showTime").innerHTML = "Time:" /*+ yyyy + "-" + MM + "-" + dd */+ " " + h + ":" + m + ":" + s;
            t = setTimeout(time, 1000); //设定定时器，循环运行
        }

    </script>

</head>

<%--<body class="bg-light">--%>
<body class="myback1">
<nav class="navbar navbar-expand-md fixed-top navbar-dark bg-dark">
    <a class="navbar-brand" href="/classList.do">Index page</a>
    <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/classList.do">Event management<span
                        class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/userInfo.do">User settings</a>
            </li>

        </ul>
    </div>

    <form class="form-inline my-2 my-lg-0" action="/logout.do" method="post">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</button>
    </form>
</nav>
<main role="main" class="container">
    <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded box-shadow">
        <img class="mr-3" src="../../down/list_files/bootstrap-outline.svg" alt="" width="48" height="48">
        <div class="lh-100">
            <h6 class="mb-0 text-white lh-100">User:&nbsp;${user.username}</h6>
            <small id="showTime"></small>
            <%--<label id="showTime"></label>--%>
        </div>
    </div>

    <div class="my-3 p-3 bg-white rounded box-shadow">
        <h6 class="border-bottom border-gray pb-2 mb-0">&nbsp;&nbsp;&nbsp;Selected event</h6>
        <c:forEach var="bean" items="${bookingList}">
        <div class="media text-muted pt-3">
            &nbsp;&nbsp;&nbsp;
            <img data-src="holder.js/32x32?theme=thumb&amp;bg=e83e8c&amp;fg=e83e8c&amp;size=1" alt="32x32"
                 class="mr-2 rounded"
                 src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_163508a92ff%20text%20%7B%20fill%3A%23e83e8c%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_163508a92ff%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23e83e8c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2211.546875%22%20y%3D%2216.9%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
                 data-holder-rendered="true" style="width: 32px; height: 32px;">
            <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                <strong class="d-block text-gray-dark">Event Name：${bean.className} &nbsp;&nbsp;&nbsp;Teacher name：${bean.teacher}</strong>
                Address:${bean.address} &nbsp;&nbsp;&nbsp; Date:${bean.date} &nbsp;&nbsp;&nbsp; Selected/Max people number:${bean.nowPeople}/${bean.maxPeople}
            </p>
                <%--<a href="/classDel.do?classId=${bean.id}" onclick="">删除</a>--%>
            <a href="javascript:void(0);" onclick="delBooking(${bean.id})">Unselected</a>
                <%--<input type="button" onclick="" value="del" class="btn btn-dark ">--%>

        </div>
        </c:forEach>


        <div class="my-3 p-3 bg-white rounded box-shadow">

            <h6 class="border-bottom border-gray pb-2 mb-0">Unselected event</h6>
            <c:forEach var="bean" items="${bookingExit}">

            <div class="media text-muted pt-3">
                <img data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1" alt="32x32"
                     class="mr-2 rounded"
                     src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_163508a9301%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_163508a9301%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2211.546875%22%20y%3D%2216.9%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
                     data-holder-rendered="true" style="width: 32px; height: 32px;">
                <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                    <div class="d-flex justify-content-between align-items-center w-100">
                        <strong class="text-gray-dark">Event Name：${bean.className} &nbsp;&nbsp;&nbsp;Teacher name：${bean.teacher}</strong>
                        <a href="javascript:void(0);" onclick="booking(${bean.id})">Selected</a>
                    </div>
                    <span class="d-block">Address:${bean.address} &nbsp;&nbsp;&nbsp; Date:${bean.date}&nbsp;&nbsp;&nbsp;Selected/Max people number:${bean.nowPeople}/${bean.maxPeople}</span>
                </div>
            </div>
            </c:forEach>

            <%--<small class="d-block text-right mt-3">--%>
                <%--<a href="https://v4.bootcss.com/docs/4.0/examples/offcanvas/#">All suggestions</a>--%>
            <%--</small>--%>
        </div>
</main>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<%--<script src="../../down/list_files/jquery-3.2.1.slim.min.js.下载"--%>
<%--integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"--%>
<%--crossorigin="anonymous"></script>--%>
<%--<script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>--%>
<%--<script src="../../down/list_files/popper.min.js.下载"></script>--%>
<%--<script src="../../down/list_files/bootstrap.min.js.下载"></script>--%>
<%--<script src="../../down/list_files/holder.min.js.下载"></script>--%>
<%--<script src="../../down/list_files/offcanvas.js.下载"></script>--%>
<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">2018 By SilkRoad</p>
</footer>

<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32" preserveAspectRatio="none"
     style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;">
    <defs>
        <style type="text/css"></style>
    </defs>
    <text x="0" y="2" style="font-weight:bold;font-size:2pt;font-family:Arial, Helvetica, Open Sans, sans-serif">32x32
    </text>
</svg>
</body>
</html>