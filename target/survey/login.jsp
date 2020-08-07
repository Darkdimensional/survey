<%--
  Created by IntelliJ IDEA.
  User: 98316
  Date: 2020/1/20
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<!-- Head -->
<head>

    <title>登录表单</title>

    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //Meta-Tags -->

    <!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all">



</head>
<!-- //Head -->

<!-- Body -->
<body>

<h1>登录表单</h1>

<div class="container">

    <div class="login">
        <h2>登 录</h2>
        <form>
            <input type="text" id="username" placeholder="用户名" onblur="nameInfo()" onfocus="nameOut()">
            <span id="sname"></span>
            <input type="password" id="password" placeholder="密码" onblur="pwdInfo()" onfocus="pwdOut()">
            <span id="spwd"></span>

            <ul class="tick">
                <li>
                    <%--<input type="checkbox" id="brand1" value="">--%>
                    <%--<label for="brand1"><span></span>记住我</label>--%>
                </li>
            </ul>
            <div class="send-button">
                <input type="button" onclick="login()" value="登 录">
                <span id="sbtn"></span>
            </div>
        </form>
        <a href="register.jsp">立即注册</a>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
</div>

<div class="footer">
    <p>Copyright &copy; Keep trying until you can't</p>
</div>

<script src="js/jquery.min.js"></script>
<script >

    var isname = false;
    var ispwd = false;

    //判断用户名
    function nameInfo() {
        var name = $('#username').val();
        //判断用户名是否为空
        if ($.trim(name) == "") {
            $('#sname').html("用户名能不空");
        }else {
            isname = true;
        }
    }
    //密码校验
    function pwdInfo() {
        var pwd = $('#password').val();
        if ($.trim(pwd) == "") {
            $("#spwd").html("密码不能为空");
        }
        else {
            ispwd = true;
        }
    }
    function nameOut() {
        $("#sname").html("");
    }
    function pwdOut() {
        $("#sbtn").html("");
        $("#spwd").html("");
    }

    function login(){
        var pwd = $('#password').val();
        var name = $('#username').val();
        if(!isname) {
            $("#sname").html("用户名不能为空");
            return false;
        }
        if(!ispwd) {
            $("#spwd").html("密码不能为空");
            return false;
        }
        if(name == "admin"){
            if (pwd == "123456"){
                window.location.href = 'admin.jsp';
            }
            else {
                $("#sbtn").html("用户名或密码输入不正确，请重新输入");
                $("#password").html("");
            }
        }else {
            $.ajax({
                type: 'post',
                url: 'login/user',
                data: {
                    'username': name,
                    'password': pwd
                },
                success: function (result) {
                    if (result.success) {
                        window.location.href = 'index.jsp';
                    } else {
                        $("#sbtn").html("用户名或密码输入不正确，请重新输入");
                        $("#password").html("");
                    }
                },
                error: function (e) {
                    alert("！！" + e);
                }
            });
        }
    }

</script>


</body>
<!-- //Body -->

</html>