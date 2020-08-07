<%--
  Created by IntelliJ IDEA.
  User: 98316
  Date: 2020/1/24
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<!-- Head -->
<head>

    <title>注册表单</title>

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

<div>
    <h1>注册表单</h1>
</div>

<div class="container">
    <div class="register">
            <h2>注 册</h2>
        <form>
            <input type="text" id="username" placeholder="用户名" onblur="nameInfo()" onfocus="nameOut()">
            <span id="sname"></span>
            <input type="password" id="password" placeholder="密码" onblur="pwdInfo()" onfocus="pwdOut()">
            <span id="spwd"></span>
            <input type="password" id="repassword" placeholder="确认密码" onblur="repwdInfo()" onfocus="repwdOut()">
            <span id="srepwd"></span>
            <div class="send-button">
                <form>
                    <input type="button" onclick="register()" value="免费注册">
                </form>
            </div>
        </form>
        <div class="clear"></div>
    </div>
    <a href="login.jsp">已有账号，立即登录</a>
    <div class="clear"></div>

</div>

<div class="footer">
    <p>Copyright &copy; Keep trying until you can't</p>
</div>

<script src="js/jquery.min.js"></script>
<script >

    var isname = false;
    var ispwd = false;
    var isrepwd = false;

    //判断用户名
    function nameInfo() {
        var name = $('#username').val();
        //判断用户名是否为空
        if ($.trim(name) == "") {
            $('#sname').html("用户名能不空");
        }
        else
        {
            $.ajax({
                type:'post',
                url:'register/findByName',
                data:{
                    'username' : name
                },
                success: function (result) {
                    if (result.success){
                        /*$("#sname").css("color","green");
                        $("#sname").html("√");*/
                        isname = true;
                    }
                    else {
                        $("#sname").html("用户已存在");
                    }
                }
            })
        }
    }
    //密码校验
    function pwdInfo() {
        var pwd = $('#password').val();
        if ($.trim(pwd) == "") {
            $("#spwd").html("密码不能为空");
        }
        else {
            /*$("#spwd").css("color","green");
            $("#spwd").html("√");*/
            ispwd = true;
        }
    }
    //重复密码校验
    function repwdInfo() {
        var pwd = $('#password').val();
        var repwd = $('#repassword').val();
        if ($.trim(repwd) == "") {
            $("#srepwd").html("密码不能为空");
        }else if ($.trim(pwd) == ""){
            $("#spwd").html("密码不能为空");
        } else if(pwd != repwd){
            $("#srepwd").html("两次密码不同");
        }else {
            /*$("#srepwd").css("color","green");
            $("#srepwd").html("√");*/
            isrepwd = true;
        }
    }

    function nameOut() {
        $("#sname").html("");
    }
    function pwdOut() {
        $("#spwd").html("");
    }
    function repwdOut() {
        $("#srepwd").html("");
    }

    function register(){
        var pwd = $('#password').val();
        var name = $('#username').val();
        if(!isname) {
            $("#sname").html("用户名错误");
            return false;
        }
        if(!ispwd) {
            $("#spwd").html("密码错误");
            return false;
        }
        if(!isrepwd) {
            $("#srepwd").html("密码错误");
            return false;
        }

        $.ajax({
            type:'post',
            url:'register/save',
            data:{
                'username' : name,
                'password' : pwd
            },
            success: function (result) {
                if (result.success){
                    alert("注册成功，请进行登录");
                    window.location.href='login.jsp';
                }
                else {
                    alert("错误");
                }
            },
            error:function(e){
                alert("！！"+e);
            }
        });
    }

</script>


</body>
<!-- //Body -->
</html>