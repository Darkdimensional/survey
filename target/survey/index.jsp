<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: 98316
  Date: 2020/1/27
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<!-- Head -->
<head>

    <title>Home</title>

    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="keywords" content="">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //Meta-Tags -->

    <!-- Custom-Stylesheet-Links -->
    <!-- Bootstrap-CSS -->	  <link rel="stylesheet" href="/css/bootstrap.css" type="text/css" media="all">
    <!-- Index-Page-CSS -->	  <link rel="stylesheet" href="/css/home.css" type="text/css" media="all">
    <!-- //Custom-Stylesheet-Links -->

    <!-- Fonts -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Montserrat:400,700"	   type="text/css" media="all">
    <!-- //Fonts -->

    <!-- Font-Awesome-File-Links -->
    <!-- CSS --> <link rel="stylesheet" href="/css/font-awesome.css" type="text/css" media="all">
    <!-- //Font-Awesome-File-Links -->


</head>
<!-- //Head -->



<!-- Body -->
<body>

<!-- Header -->
<div class="agileheader" id="agileitshome">

    <!-- Navigation -->
    <div class="w3lsnavigation">
        <nav class="navbar navbar-default agilehovereffect wthreehovereffect">
            <div class="navbar-header navbar-left">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="w3_navigation_pos">
                    <a href="index.jsp">
                        <%--<img src="images/login.jpg" alt="Odyssey">--%>
                        <h1>问卷网</h1>
                    </a>
                </div>
            </div>

            <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                <nav class="link-effect-2" id="link-effect-2">
                    <ul class="nav navbar-nav">
                        <li><a class="scroll" href="index.jsp"><span>首页</span></a></li>
                        <li><a class="scroll" href=""><span>产品介绍</span></a></li>
                        <li><a class="scroll" href=""><span>联系客服</span></a></li>
                        <li><a class="scroll" href="answer_square.jsp"><span>我要答卷</span></a></li>
                        <li><a class="scroll" href="newPaper.jsp"><span>创建问卷</span></a></li>
                        <c:if test="${empty sessionScope.user_session}">
                            <li><a class="scroll" href="login.jsp"><span>登录</span></a></li>
                        </c:if>
                        <c:if test="${!empty sessionScope.user_session}">
                            <li><a class="scroll" href="myPaper.jsp"><span>我的问卷</span></a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </nav>
    </div>
    <!-- //Navigation -->

    <!-- Slider -->
    <div class="slider">
        <ul class="rslides" id="slider">
            <li class="first-slide w3ls">
                <img src="images/home.jpg" alt="Odyssey">
                <div class="wthreexperience">
                    <div id="animated-example" class="animated fadeIn"></div>
                    <button >Reload page</button>
                </div>
            </li>
        </ul>
    </div>
    <!-- //Slider -->

</div>
<!-- //Header -->





<!-- Footer -->
<div class="agilefooterwthree" id="agilefooterwthree">
    <div class="container">

        <div class="agilefooterwthree-grids">
            <div class="col-md-4 agilefooterwthree-grid agilefooterwthree-grid1">
                <h4>LINKS</h4>
                <ul>
                    <li><a class="scroll" href="#agileitshome">HOME</a></li>
                    <li><a class="scroll" href="#agileitshome"><span>ABOUT</span></a></li>
                    <li><a class="scroll" href="#agileitshome"><span>LOCATIONS</span></a></li>
                    <li><a class="scroll" href="#agileitshome"><span>PACKAGES</span></a></li>
                    <li><a class="scroll" href="#agileitshome"><span>PORTFOLIO</span></a></li>
                    <li><a class="scroll" href="#agileitshome"><span>REVIEWS</span></a></li>
                </ul>
            </div>
            <div class="col-md-4 agilefooterwthree-grid agilefooterwthree-grid2">
                <h4>ADDRESS</h4>
                <address>
                    <ul>
                        <li>352265 Fujian Province </li>
                        <li>Ningde</li>
                        <li>Thou farmland county</li>
                        <li>China</li>
                        <li>15037509582</li>
                        <li><a class="mail" href="https://me.csdn.net/pashuihou">https://me.csdn.net/pashuihou</a></li>
                    </ul>
                </address>
            </div>
            <div class="col-md-4 agilefooterwthree-grid agilefooterwthree-grid3 newsletter">
                <h4>SUBSCRIBE</h4>
                <p>Subscribe to our Newsletter</p>
                <form action="#" method="post">
                    <input class="email aitsw3ls" type="email" placeholder="Your Email" required="">
                    <input type="submit" class="submit" value="">
                </form>
            </div>
            <div class="clearfix"></div>
        </div>

    </div>

</div>
<!-- //Footer -->



<!-- Copyright -->
<div class="copyright">
    <p>Copyright &copy; Keep trying until you can't</p>
</div>
<!-- //Copyright -->

</body>
<!-- //Body -->

</html>