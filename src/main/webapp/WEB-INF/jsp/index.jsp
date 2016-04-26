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
    <title>凑钱吃饭</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="statics/css/materialize.css" rel="stylesheet">
</head>
<body>

<%--<div class="navbar-fixed">
    <nav class="z-depth-1">
        <div class="nav-wrapper z-depth-1">
            <a href="#" class="brand-logo center">凑钱吃饭</a>
        </div>
    </nav>
</div>--%>


<div class="container" id="container">
    <div class="row">
        <div class="col s12">
            <ul class="tabs">
                <li class="tab col s3"><a href="#test1">消费</a></li>
                <li class="tab col s3"><a href="#test2">充值</a></li>
                <li class="tab col s3"><a href="#test3">人员管理</a></li>
                <li class="tab col s3"><a href="#test4">本月账单</a></li>
            </ul>
        </div>
        <div id="test1" class="col s12">
            <blockquote>当前总资产为：<h4 class="materialize-red-text text-lighten-2">{{sum}}</h4></blockquote>
            <div class="row">
                <div class="input-field col s12">
                    <input type="number" id="consumeNumber" v-model="totalConsume">
                    <label for="consumeNumber">本次消费</label>
                </div>
            </div>
            <table class="centered">
                <thead>
                <tr>
                    <th data-field="name">姓名</th>
                    <th data-field="price">当前资产</th>
                    <th data-field="ff">本次消费</th>
                    <th data-field="dd">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="item in personalTotalList">
                    <td>{{item.userName}}</td>
                    <td>{{item.remainder}}</td>
                    <td>{{getEveryConsume}}</td>
                    <th><button class="modal-trigger btn" v-on:click="unConsume($index)">不消费</button></th>
                </tr>
                </tbody>
            </table>
            <button class="btn left" v-on:click="getAllUserInfor">显示所有</button>
            <div class="row" style="margin-top: 6em">
                <button class="btn right" v-on:click="consume">消费</button>
            </div>
        </div>
        <div id="test2" class="col s12">
            <blockquote>当前总资产为：<h4 class="materialize-red-text text-lighten-2">{{sum}}</h4></blockquote>
            <table class="centered">
                <thead>
                <tr>
                    <th data-field="name">姓名</th>
                    <th data-field="price">当前资产</th>
                    <th data-field="dd">充值数</th>
                </tr>
                </thead>

                <tbody>
                <tr v-for="item in personalTotalList">
                    <td>{{item.userName}}</td>
                    <td>{{item.remainder}}</td>
                    <th><input type="number" v-model="personalTotalList[$index].chargeNumber"></th>
                </tr>
                </tbody>
            </table>
            <blockquote>总金额为：{{getTotalCharge}}</blockquote>
            <button class="btn right" v-on:click="charge">充值</button>

        </div>
        <div id="test3" class="col s12">
            <div class="row" style="margin-top: 2em">
                <input class="col s8" placeholder="请输入要添加人的姓名" type="text" v-model="add_Username" id="addUserName">
                <div class="col s4">
                    <button class="btn" v-on:click="addUser">添加</button>
                </div>
                <table class="centered">
                    <thead>
                    <tr>
                        <th data-field="name">姓名</th>
                        <th data-field="price">总资产</th>
                        <th data-field="dd">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr v-for="item in personalTotalList">
                        <td>{{item.userName}}</td>
                        <td>{{item.remainder}}</td>
                        <th><button class="btn  red lighten-2" v-on:click="deleteUser(item.id)">删除</button></th>
                    </tr>
                    </tbody>
                </table>

            </div>
        </div>

        <div id="test4" class="col s12">
            <table class="centered">
                <thead>
                <tr>
                    <th data-field="name">类型</th>
                    <th data-field="price">金额</th>
                    <th data-field="price">时间</th>
                    <th data-field="dd">相关人员</th>
                </tr>
                </thead>

                <tbody>
                <tr v-for="item in MonthOrder">
                    <th>{{getType($index)}}</th>
                    <td>{{item.money}}</td>
                    <td>{{item.date}}</td>
                    <td>{{item.users}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="statics/js/jquery-2.2.1.js"></script>
<script src="statics/js/vue.js"></script>
<script src="statics/js/materialize.min.js"></script>
<script type="text/javascript">
    new Vue({
        el: '#container',
        computed:{
            getTotalCharge:function(){
                var totalCharge=0;
                for(var i=0;i<this.personalTotalList.length;i++){
                    var chargeNumber=this.personalTotalList[i].chargeNumber==null?0:this.personalTotalList[i].chargeNumber
                    totalCharge=totalCharge+parseFloat(chargeNumber)
                }
                this.totalCharge=totalCharge;
                return totalCharge;
            },
            getEveryConsume:function(){
                this.totalConsume=this.totalConsume==null?0:this.totalConsume
                this.everyConsume=this.totalConsume/this.personalTotalList.length
                return this.totalConsume/this.personalTotalList.length;
            },


        },
        data: {
            message: '',
            add_Username:'',
            personalTotalList:'',
            /*总充值数*/
            totalCharge:'',
            /*总资产*/
            sum:'',
            /*没人消费的数量*/
            everyConsume:'',
            /*总消费*/
            totalConsume:'',
            MonthOrder:'',
            getType:function(index){
                if(this.MonthOrder[index].type==0){
                    return '充值'
                }else if(this.MonthOrder[index].type==1){
                    return '消费'
                }
            },
        },
        methods: {
            addUser:function(){
                _self=this
                $.post('/user/addUser',{userName:this.add_Username},function(data){
                    var result= $.parseJSON(data)
                    if(result.msg=='success'){
                        Materialize.toast('保存成功',2000);
                        _self.getAllUserInfor();
                    }
                    else{
                        Materialize.toast('保存失败'+result.msg,2000);
                    }
                    debugger
                })
            },
            getAllUserInfor:function(){
                _self=this
                $.post('/order/allPersonalSum',function(data){
                    console.info(data)
                    _self.personalTotalList=$.parseJSON(data)
                    debugger
                })
            },
            deleteUser:function(id){
                _self=this
                $.post('/user/deleteUser',{id:id},function(data){
                    var result= $.parseJSON(data)
                    if(result.msg=='success'){
                        Materialize.toast('已删除',2000)
                        _self.getAllUserInfor();
                    }else{
                        Materialize.toast('删除失败'+result.msg,2000)
                    }

                })
            },
            //充值
            charge:function(){
                var Users=new Array();
                var money=new  Array();
                for(var i=0;i<this.personalTotalList.length;i++){
                    Users.push(this.personalTotalList[i].userName);
                    money.push(parseFloat(this.personalTotalList[i].chargeNumber));
                }
                var totoalMoney=this.totalCharge;
                _self=this
                $.post('/order/order',{type:0,Users:Users,money:money,totoalMoney:totoalMoney},function(data){
                    var result=$.parseJSON(data)
                    if(result.msg=='success'){
                        Materialize.toast('充值成功',2000)
                        _self.getAllUserInfor();
                        _self.Sum();
                        _self.monthOrder();
                    }else{
                        Materialize.toast('充值失败'+result.msg,2000)
                    }
                })
            },
            unConsume: function (index) {
                debugger
                this.personalTotalList.$remove(this.personalTotalList[index]);
            },
            //消费
            monthOrder:function(){
                _self=this
                $.post('/order/monthOrder',function(data){
                    debugger
                    _self.MonthOrder= $.parseJSON(data);
                    debugger
                })
            },
            consume:function(){

                var Users=new Array();
                var money=new  Array();
                for(var i=0;i<this.personalTotalList.length;i++){
                    Users.push(this.personalTotalList[i].userName);
                    money.push(parseFloat(this.everyConsume));
                }
                var totoalMoney=this.totalConsume;
                _self=this
                $.post('/order/order',{type:1,Users:Users,money:money,totoalMoney:totoalMoney},function(data){
                            var result= $.parseJSON(data);
                    if(result.msg=='success'){
                        Materialize.toast('消费成功',2000);
                        _self.getAllUserInfor();
                        _self.Sum();
                        _self.monthOrder();

                    }else{
                        Materialize.toast('消费失败'+result.msg,2000);
                    }
                })
            },
            /*送资产*/
            Sum:function(){
                _self=this
                $.post('/order/sum',function(data){
                    debugger
                    var result= $.parseJSON(data)
                    if(result.msg=='success'){
                        _self.sum=result.data;
                    }
                })
            }
        },
        ready: function () {
            $('ul.tabs').tabs('select_tab', 'tab_id');
            $('.modal-trigger').leanModal();
            this.getAllUserInfor();
            this.Sum();
            this.monthOrder();

        }
    })
</script>
</body>
</html>
