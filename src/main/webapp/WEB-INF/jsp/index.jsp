<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/24
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="statics/css/materialize.css" rel="stylesheet">
</head>
<body>
<div class="container" id="container">
    <div class="row">
        <div class="col s12">
            <ul class="tabs">
                <li class="tab col s3"><a href="#test1">消费</a></li>
                <li class="tab col s3"><a href="#test2">充值</a></li>
                <li class="tab col s3"><a href="#test3">人员管理</a></li>
            </ul>
        </div>
        <div id="test1" class="col s12">

        </div>
        <div id="test2" class="col s12">Test 2</div>
        <div id="test3" class="col s12">Test 3</div>
    </div>
</div>
<script src="statics/js/jquery-2.2.1.js"></script>
<script src="statics/js/vue.js"></script>
<script src="statics/js/materialize.min.js"></script>
<script type="text/javascript">
    new Vue({
        el: '#container',
        data:{
            message:''
        },
        methods:{


        },
        ready:function(){
            $('ul.tabs').tabs('select_tab', 'tab_id');
        }
    })
</script>
</body>
</html>
