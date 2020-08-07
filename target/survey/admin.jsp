<%--
  Created by IntelliJ IDEA.
  User: 98316
  Date: 2020/2/3
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员界面</title>
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/admin.css" type="text/css" media="all">
</head>
<body>
    <div class="layout-admin">
        <header class="layout-header">
            <span class="header-logo">问卷调查系统后台管理</span>
            <a class="header-menu-btn" href=""><i class="icon-font">&#xe600;</i></a>
            <ul class="header-bar">
                <li class="header-bar-role"><a href="">超级管理员</a></li>
                <li class="header-bar-nav"><a href="index.jsp">admin|退出</a></li>
            </ul>
        </header>
        <div class="layout-side" style="width: 15%;float: left">
            <ul class="side-menu">
                <ul class="nav nav-list">
                    <li class="active"><a href="#" onclick="showUser()">用户管理</a></li>
                    <li><a href="#" onclick="showPaper()">问卷管理</a></li>
                </ul>
            </ul>
        </div>
        <div id="show" style="width: 85%;float: right">
            <img src="images/gbg.jpg">
        </div>
    </div>
</body>
<script type="text/javascript" src="js/jquery.min.js" ></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>
<script type="text/javascript">
    var show = $("#show");
    function showUser() {
        $.ajax({
            type:'post',
            url:'user/findAll',
            success: function (result){
                show.empty();
                var users = result.data;
                var temp = "";
                temp += "<table id='table' class='table table-hover table-striped text-center'>";
                temp += "<tr style='font-weight: bold;'>";
                temp += "<td>用户ID</td> <td>用户名</td><td>操作</td></tr>";
                for (var i = 0; i < users.length;i++){
                    temp += "<td id='id"+i+"'>"+users[i].user_id+"</td>";
                    temp += "<td><input id='name"+i+"' style='border: 0px;' class='text-center' value='"+users[i].username+"'></td>";
                    temp += "<td><a href='#' class='btn btn-success'  onclick='delU("+users[i].user_id+")'>删除</a><a href='#'class='btn btn-success' onclick='Upd("+i+")'>修改</a></td></tr>";
                }
                temp += "</table>"
                show.append(temp);
            }
        })
    }

    function showPaper() {
        $.ajax({
            type:'post',
            url:'paper/findAll',
            success: function (result){
                show.empty();
                var papers = result.data;
                var temp = "";
                temp += "<table id='table' class='table table-hover table-striped text-center'>";
                temp += "<tr style='font-weight: bold;'>";
                temp += "<td>问卷ID</td><td>问卷标题</td><td>创建时间</td><<td>操作</td></tr>";
                for (var i = 0; i < papers.length;i++){
                    temp += "<td>"+papers[i].paper_id+"</td><td>"+papers[i].title+"</td><td>"+papers[i].create_time+"</td>";
                    temp += "<td><a href='paper.jsp?id="+papers[i].paper_id+"' class='btn btn-success'>查看</a><a href='#' class='btn btn-success' onclick='delP("+papers[i].paper_id+")'>删除</a><a href='paper.jsp?id="+papers[i].paper_id+"' class='btn btn-success' >修改</a></td></tr>";
                }
                temp += "</table>"
                show.append(temp);
            }
        })
    }

    function delP(id) {
        var r = confirm("确认删除？");
        if(r == true) {
            $.ajax({
                type: 'post',
                data: {id: id},
                url: 'paper/delete',
                success: function (result) {
                    alert("问卷删除成功！");
                    location.reload();
                }
            })
        }
    }
    function delU(id) {
        var r = confirm("确认删除？");
        if(r == true) {
            $.ajax({
                type: 'post',
                data: {id: id},
                url: 'user/delete',
                success: function (result) {
                    alert("用户删除成功！");
                    location.reload();
                }
            })
        }
    }
    function Upd(num) {
        var r = confirm("确认修改？");
        if(r == true) {
            var user = {};
            var id = $('#id' + num).text();
            var name = $('#name' + num).val();
            user.user_id = id;
            user.username = name;
            $.ajax({
                type: 'post',
                data: user,
                url: 'user/update',
                success: function (result) {
                    alert("用户修改成功！");
                    location.reload();
                }
            })
        }
    }
</script>
</html>
