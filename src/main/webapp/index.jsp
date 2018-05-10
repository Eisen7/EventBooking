<%--
  Created by IntelliJ IDEA.
  User: 12973
  Date: 2018/5/9
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <%
    String login = "/loginAndSignUp/Login.html";
//    request.getRequestDispatcher(login).forward(request, response);
    response.sendRedirect(login);
  %>
  $END$
  </body>
</html>
