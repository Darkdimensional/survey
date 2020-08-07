<%--
  Created by IntelliJ IDEA.
  User: 98316
  Date: 2020/2/9
  Time: 7:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>答案列表</title>
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/navbar.css" type="text/css" media="all">
</head>
<body>
    <nav class="link-effect-2" id="link-effect-2">
        <ul class="nav navbar-nav">
            <li>
                <a class="scroll" href="index.jsp"><img src="images/logo.png" alt="icon"><span>首页</span></a>
            </li>
            <li><a class="scroll" href="#"><span>产品介绍</span></a></li>
            <li><a class="scroll" href="#"><span>联系客服</span></a></li>
            <li><a class="scroll" href="answer_square.jsp"><span>我要答卷</span></a></li>
            <li><a class="scroll" href="newPaper.jsp"><span>创建问卷</span></a></li>
            <li><a class="scroll" href="index.jsp" onclick="exit()"><span>退出</span></a></li>
        </ul>
    </nav>
    <h3 class="text-center">答案列表</h3>
    <table id="table" class="table table-hover table-striped text-center">
        <tr style="font-weight: bold;">
            <td>用户IP</td>
            <td>用户地址</td>
            <td>创建时间</td>
            <td>答案操作</td>
        </tr>
    </table>
</body>
<script type="text/javascript" src="js/jquery.min.js" ></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>
<script type="text/javascript">
    var id = window.location.href.split("=")[1];
    $.ajax({
        type:'post',
        data:{ 'id':id},
        url:'answer/findPaperId',
        success: function (result) {
            var answerInfos = result.data;
            var table= $("#table");
            for (var i = 0; i < answerInfos.length; i++) {
                var temp = "";
                temp += "<tr>";
                temp += "<td> "+answerInfos[i].user_ip+" </td>";
                temp += "<td> "+answerInfos[i].user_address+"</td>";
                temp += "<td> "+answerInfos[i].create_date+" </td>";
                temp += "<td><a href='answer.jsp?id="+answerInfos[i].answer_id+"' class='btn btn-success'>查看详情</a></td>";
                temp += "</tr>";
                table.append(temp);
            }
        }
    })
</script>
</html>
