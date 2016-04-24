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
  <link rel="stylesheet" href="statics/css/vux.css">
  <script src="statics/js/vue.min.1.0.18.js"></script>

</head>
<body>
<div id="demo">
  <group>
    <cell title="vue" value="cool"></cell>
  </group>
</div>

<script src="statics/components/group/index.js"></script>
<script src="statics/components/cell/index.js"></script>

<script>
  Vue.component('group', vuxGroup)
  Vue.component('cell', vuxCell)
  new Vue({
    el: '#demo'
  })
</script>
</body>
</html>
