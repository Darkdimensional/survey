<%--
  Created by IntelliJ IDEA.
  User: 98316
  Date: 2020/2/3
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的问卷列表</title>
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
    <%--<a href="edit-wj.html"><span id="add-major" class="btn btn-success pull-right" style="margin-right: 50px;">新增问卷</span></a>--%>
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
    var user_id = "${sessionScope.user_session.user_id}";
    var papers;
    $.ajax({
        type:'post',
        url:'paper/findUserId',
        data:{user_id :user_id},
        success: function (result) {
            if (result.success){
                papers = result.data;
                var table= $("#table");
                for (var i = 0; i < papers.length; i++) {
                    var temp = "";
                    temp += "<tr>";
                    temp += "<td> "+papers[i].paper_id+" </td>";
                    temp += "<td> <a href='paper.jsp?id="+papers[i].paper_id+"'>"+papers[i].title+"</a></td>";
                    temp += "<td> "+papers[i].create_time+" </td>";
                    temp += "<td><a href='paper.jsp?id="+papers[i].paper_id+"' class='btn btn-success'>修改问卷</a>";
                    temp += "<a href='javascript:void(0);' class='btn btn-success' onclick='del("+papers[i].paper_id+")'>删除</a>";
                    temp += "<a href='answerList.jsp?id="+papers[i].paper_id+"' class='btn btn-success'>查看结果</a>";
                    temp += "<a href='report.jsp?id="+papers[i].paper_id+"' class='btn btn-success'>结果统计</a></td>";
                    //temp += "<div class='btn btn-info' @click='publish(survey.id)'>发布操作</div>";
                    temp += "</tr>";
                    table.append(temp);
                }
            }
        }
    })

    //删除问卷
    function del(id) {
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

    function exit() {
        $.ajax({
            type: 'post',
            url: 'login/logout',
            success: function (result) {
                window.location.href="index.jsp";
            }
        })
    }
</script>
</html>
