<%--
  Created by IntelliJ IDEA.
  User: liuyatao
  Date: 16-4-24
  Time: 下午7:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="statics/css/vux.css">
    <script src="statics/js/vue.min.1.0.18.js"></script>
    <style type="text/css">
        button{
            margin: 2em;
        }
        #btn
        {
            padding: 2em;

        }
        #demo
        { margin-top: 4em;}
    </style>
</head>
<body>

<form id="demo">
    <group>
        <x-input title="用户名：" placeholder="请输入用户名"></x-input>
        <x-input title="密码：" placeholder="请输入密码"></x-input>
    </group>
    <div id="btn">
        <input type="submit" class="weui_btn weui_btn_primary" value="登陆"/>
    </div>

</form>

<script src="statics/components/group/index.js"></script>
<script src="statics/components/cell/index.js"></script>
<script src="statics/components/x-input/index.js"></script>
<script src="statics/components/x-button/index.js"></script>

<script>
    Vue.component('group', vuxGroup)
    Vue.component('cell', vuxCell)
    Vue.component('x-input', vuxXInput)
    new Vue({
        el: '#demo'
    })
</script>
</body>
</html>
