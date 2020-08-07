<%--
  Created by IntelliJ IDEA.
  User: 98316
  Date: 2020/1/28
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>问卷广场-官方免费互填社区</title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="keywords" content="">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //Meta-Tags -->

    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/navbar.css" type="text/css" media="all">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Montserrat:400,700"	   type="text/css" media="all">
    <link rel="stylesheet" href="css/font-awesome.css" type="text/css" media="all">
</head>
<body>
<!-- Header -->
    <nav class="link-effect-2" id="link-effect-2">
        <ul class="nav navbar-nav">
            <li>
                <a class="scroll" href="index.jsp"><img src="images/logo.png" alt="icon"><span>首页</span></a>
            </li>
            <li><a class="scroll" href="#"><span>产品介绍</span></a></li>
            <li><a class="scroll" href="#"><span>联系客服</span></a></li>
            <li><a class="scroll" href="answer_square.jsp"><span>我要答卷</span></a></li>
            <li><a class="scroll" href="newPaper.jsp"><span>创建问卷</span></a></li>
        </ul>
    </nav>
<!-- //Header -->

   <%-- <a href="edit-wj.html"><span id="add-major" class="btn btn-success pull-right" style="margin-right: 50px;">新增问卷</span></a>--%>
    <h3 class="text-center">问卷列表</h3>

    <table id="table" class="table table-hover table-striped text-center">
        <tr style="font-weight: bold;">
            <td>问卷ID</td>
            <td>问卷名称</td>
            <td>创建时间</td>
            <td>问卷操作</td>
        </tr>
    </table>

</body>

<script type="text/javascript" src="js/jquery.min.js" ></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>

<script type="text/javascript">
    var papers;
    $.ajax({
        type:'post',
        url:'paper/findStatus',
        success: function (result) {
            if (result.success){
                papers = result.data;
                var table= $("#table");
                for (var i = 0; i < papers.length; i++) {
                    var temp = "";
                    temp += "<tr>";
                    temp += "<td> "+papers[i].paper_id+" </td>";
                    temp += "<td> <a href='survey.jsp?id="+papers[i].paper_id+"'>"+papers[i].title+"</a></td>";
                    temp += "<td> "+papers[i].create_time+" </td>";
                    temp += "<td> <a href='survey.jsp?id="+papers[i].paper_id+"'>参与调查</a></td>";
                    temp += "</tr>";
                    table.append(temp);
                }
            }
            else {
                alert("获取问卷失败");
            }
        },
        error:function(e){
            alert("系统出错了"+e);
        }
    })


</script>


</html>
