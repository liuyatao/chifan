<%--
  创建人: 刘亚涛
  创建时间： 2016/2/25 15:52
  说明：
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--  <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="statics/css/materialize.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style type="text/css">
        .card-panel{
            margin-top: 20%;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col s12 m6 offset-m3 l4 offset-l4">
            <div class="card-panel">
                <form action="/login" method="post">
                    <c:if test="${param.error != null}">
                        <p>
                            Invalid username and password.
                        </p>
                    </c:if>
                    <c:if test="${param.logout != null}">
                        <p>
                            You have been logged out.
                        </p>
                    </c:if>
                    <p>
                        <label for="username">请输入用户名</label>
                        <input type="text" id="username" name="username"/>
                    </p>

                    <p>
                        <label for="password">请输入密码</label>
                        <input type="password" id="password" name="password"/>
                    </p>
                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <button type="submit" class="btn">登陆</button>
                </form>
            </div>
        </div>
    </div>

</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="statics/js/jquery-2.2.1.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="statics/js/materialize.min.js"></script>


</body>
</html>

