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

    <title>Checkout example for Bootstrap</title>

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
    <a class="navbar-brand" href="/classList.do"> 主页 </a>
    <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/classList.do">选课管理 <span
                        class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/userInfo.do">用户设置</a>
            </li>

        </ul>

    </div>
</nav>
<div class="container">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="../../down/form_files/bootstrap-solid.svg" alt="" width="72" height="72">
        <h2>创建或者修改您的事件</h2>
        <p class="lead">您可以在这管理您所拥有的事件</p>
    </div>

    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">您的登陆次数为</span>
                <span class="badge badge-secondary badge-pill">${user.loginCount}</span>
            </h4>
            <ul class="list-group mb-3">
                <li class="list-group-item d-flex justify-content-between bg-light">
                    <div class="text-success">
                        <h6 class="my-0">Login Type</h6>
                        <small>登陆身份</small>
                    </div>
                    <span class="text-success">${user.userType==0?"管理员":"普通用户"}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Login Name</h6>
                        <small class="text-muted">您的登陆名</small>
                    </div>
                    <span class="text-muted">${user.username}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Email</h6>
                        <small class="text-muted">您的邮箱地址</small>
                    </div>
                    <span class="text-muted">${user.email}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Last Login Time</h6>
                        <small class="text-muted">上次登录时间</small>
                    </div>
                    <span class="text-muted">${lastLoginDate}</span>
                </li>

                <li class="list-group-item d-flex justify-content-between">
                    <span>Mobile Phone</span>
                    <strong>${user.mobilePhone}</strong>
                </li>
            </ul>

            <%--<form class="card p-2">--%>
            <%--<div class="input-group">--%>
            <%--<input type="text" class="form-control" placeholder="Promo code">--%>
            <%--<div class="input-group-append">--%>
            <%--<button type="submit" class="btn btn-secondary">Redeem</button>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</form>--%>
        </div>

        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Billing Event</h4>
            <form class="needs-validation" id="form" name="form" action="/addOrUpdateForm.do" method="post">
                <%--<div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName">First name</label>
                        <input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Last name</label>
                        <input type="text" class="form-control" id="lastName" placeholder="" value="" required="">
                        <div class="invalid-feedback">
                            Valid last name is required.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="username">Username</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">@</span>
                        </div>
                        <input type="text" class="form-control" id="username" placeholder="Username" required="">
                        <div class="invalid-feedback" style="width: 100%;">
                            Your username is required.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="email">Email <span class="text-muted">(Optional)</span></label>
                    <input type="email" class="form-control" id="email" placeholder="you@example.com">
                    <div class="invalid-feedback">
                        Please enter a valid email address for shipping updates.
                    </div>
                </div>
--%>

                <input type="text" name="id" hidden="hidden" value="${form.id}">
                <div class="mb-3">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="比如 北京市 昌平区"
                           required="" value="${form.address}">
                    <div class="invalid-feedback">
                        Please enter address.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="className">CLass Name <span class="text-muted">(Event Name)</span></label>
                    <input type="text" class="form-control" id="className" name="className" placeholder="比如 Java开发讲座"
                           value="${form.className}">
                </div>

                <div class="mb-3">
                    <label for="dateString">Date<span class="text-muted"></span></label>
                    <input type="datetime-local" value="${form.dateString==null?'2018-01-01T00:00':form.dateString}"
                           class="form-control" id="dateString"
                           name="dateString" placeholder="">
                </div>
                <%--
                                <div class="row">
                                    <div class="col-md-5 mb-3">
                                        <label for="country">Country</label>
                                        <select class="custom-select d-block w-100" id="country" required="">
                                            <option value="">Choose...</option>
                                            <option>United States</option>
                                        </select>
                                        <div class="invalid-feedback">
                                            Please select a valid country.
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="state">State</label>
                                        <select class="custom-select d-block w-100" id="state" required="">
                                            <option value="">Choose...</option>
                                            <option>California</option>
                                        </select>
                                        <div class="invalid-feedback">
                                            Please provide a valid state.
                                        </div>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="zip">Zip</label>
                                        <input type="text" class="form-control" id="zip" placeholder="" required="">
                                        <div class="invalid-feedback">
                                            Zip code required.
                                        </div>
                                    </div>
                                </div>
                                <hr class="mb-4">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="same-address">
                                    <label class="custom-control-label" for="same-address">Shipping address is the same as my billing
                                        address</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="save-info">
                                    <label class="custom-control-label" for="save-info">Save this information for next time</label>
                                </div>
                                <hr class="mb-4">

                                <h4 class="mb-3">Payment</h4>

                                <div class="d-block my-3">
                                    <div class="custom-control custom-radio">
                                        <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked=""
                                               required="">
                                        <label class="custom-control-label" for="credit">Credit card</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required="">
                                        <label class="custom-control-label" for="debit">Debit card</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required="">
                                        <label class="custom-control-label" for="paypal">Paypal</label>
                                    </div>
                                </div>
                                --%>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="price">Price</label>
                        <input type="text" class="form-control" id="price" name="price" placeholder="" required="价格"
                               onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" value="${form.price}">
                        <small class="text-muted">课程价格</small>
                        <div class="invalid-feedback">
                            课程价格
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="maxPeople">Max People</label>
                        <input type="text" class="form-control" id="maxPeople" name="maxPeople" placeholder=""
                               required="最大人数"
                               onkeyup="this.value=this.value.replace(/\D/g,'')"
                               onafterpaste="this.value=this.value.replace(/\D/g,'')" value="${form.maxPeople}">
                        <div class="invalid-feedback">
                            课程最大人数
                        </div>
                    </div>
                </div>
                <%--
            <div class="row">
                <div class="col-md-3 mb-3">
                    <label for="cc-expiration">Expiration</label>
                    <input type="text" class="form-control" id="cc-expiration" placeholder="" required="">
                    <div class="invalid-feedback">
                        Expiration date required
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="cc-expiration">CVV</label>
                    <input type="text" class="form-control" id="cc-cvv" placeholder="" required="">
                    <div class="invalid-feedback">
                        Security code required
                    </div>
                </div>
            </div>--%>
                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">Add or update</button>
            </form>
        </div>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">© 2017-2018 Company Name</p>
        <%--<ul class="list-inline">--%>
        <%--<li class="list-inline-item"><a href="https://v4.bootcss.com/docs/4.0/examples/checkout/#">Privacy</a></li>--%>
        <%--<li class="list-inline-item"><a href="https://v4.bootcss.com/docs/4.0/examples/checkout/#">Terms</a></li>--%>
        <%--<li class="list-inline-item"><a href="https://v4.bootcss.com/docs/4.0/examples/checkout/#">Support</a></li>--%>
        <%--</ul>--%>
    </footer>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster
<script src="../../down/form_files/jquery-3.2.1.slim.min.js.下载"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
<script src="../../down/form_files/popper.min.js.下载"></script>
<script src="../../down/form_files/bootstrap.min.js.下载"></script>
<script src="../../down/form_files/holder.min.js.下载"></script>
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict';

        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');

            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
-->

</body>
</html>