<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0050)https://v4.bootcss.com/docs/4.0/examples/checkout/ -->
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://v4.bootcss.com/favicon.ico">

    <title>SilkRoad</title>

    <!-- Bootstrap core CSS -->
    <link href="../../down/form_files/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../down/form_files/form-validation.css" rel="stylesheet">

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.3.1.js"></script>
    <script type="text/javascript">
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
                    } else {
                        window.location.href = "/index.jsp";
                    }
                }
            })
        }


        <%--function format(date) {--%>
        <%--let dt = new Date(date);--%>
        <%--let yyyy = dt.getFullYear();--%>
        <%--let MM = dt.getMonth();--%>
        <%--let dd = dt.getDay();--%>
        <%--let h = dt.getHours();//获取时--%>
        <%--let m = dt.getMinutes();//获取分--%>
        <%--let s = dt.getSeconds();//获取秒--%>
        <%--let f = yyyy + "-" + MM + "-" + dd + "T" + h + ":" + m + ":" + s;--%>
        <%--return f;--%>
        <%--}--%>

        <%--window.onload = function () {--%>
        <%--let c = '${form.date}';--%>
        <%--alert(c);--%>
        <%--document.getElementById('dateString').value = format('${form.date}');--%>
        <%--}--%>

    </script>


</head>

<body class="bg-light">
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
<div class="container">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="../../down/form_files/bootstrap-solid.svg" alt="" width="72" height="72">
        <h2>Create or modify your events</h2>
        <p class="lead">You can manage the events you have here.</p>
    </div>

    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Login times</span>
                <span class="badge badge-secondary badge-pill">${user.loginCount}</span>
            </h4>
            <ul class="list-group mb-3">
                <li class="list-group-item d-flex justify-content-between bg-light">
                    <div class="text-success">
                        <h6 class="my-0">Login Type</h6>
                        <%--<small>system or ordinary user</small>--%>
                    </div>
                    <span class="text-success">${user.userType==0?"System user":"Consumer user"}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">User name</h6>
                        <%--<small class="text-muted">login name</small>--%>
                    </div>
                    <span class="text-muted">${user.username}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Email</h6>
                        <%--<small class="text-muted">User email</small>--%>
                    </div>
                    <span class="text-muted">${user.email}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Last login</h6>
                        <%--<small class="text-muted">Last Login Time</small>--%>
                    </div>
                    <span class="text-muted">${lastLoginDate}</span>
                </li>

                <li class="list-group-item d-flex justify-content-between">
                    <span>Phone</span>
                    <strong>${user.mobilePhone}</strong>
                </li>
            </ul>

        </div>

        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Billing or update event</h4>
            <form class="needs-validation" id="form" name="form" action="/addOrUpdateForm.do" method="post">


                <input type="text" name="id" hidden="hidden" value="${form.id}">
                <div class="mb-3">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="For example, Sydney Opera House."
                           required="" value="${form.address}">
                    <div class="invalid-feedback">
                        Please enter address.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="className">CLass Name <span class="text-muted">(Event Name)</span></label>
                    <input type="text" class="form-control" id="className" name="className" placeholder="For example, higher mathematics."
                           value="${form.className}">
                </div>

                <div class="mb-3">
                    <label for="dateString">Date<span class="text-muted"></span></label>
                    <input type="datetime-local" value="${form.dateString==null?'2018-01-01T00:00':form.dateString}"
                           class="form-control" id="dateString"
                           name="dateString" placeholder="">
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="price">Price</label>
                        <input type="text" class="form-control" id="price" name="price" placeholder="" required="价格"
                               onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" value="${form.price}">
                        <small class="text-muted">The price of event</small>
                        <%--<div class="invalid-feedback">--%>
                            <%--课程价格--%>
                        <%--</div>--%>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="maxPeople">Max People</label>
                        <input type="text" class="form-control" id="maxPeople" name="maxPeople" placeholder=""
                               required=""
                               onkeyup="this.value=this.value.replace(/\D/g,'')"
                               onafterpaste="this.value=this.value.replace(/\D/g,'')" value="${form.maxPeople}">
                        <small class="text-muted">The number of users that can be accommodated,default 100</small>
                        <%--<div class="invalid-feedback">--%>
                            <%--课程最大人数--%>
                        <%--</div>--%>
                    </div>
                </div>

                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">Add or update</button>
            </form>
        </div>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">2018 By SilkRoad</p>
        <%--<ul class="list-inline">--%>
        <%--<li class="list-inline-item"><a href="https://v4.bootcss.com/docs/4.0/examples/checkout/#">Privacy</a></li>--%>
    </footer>
</div>


</body>
</html>