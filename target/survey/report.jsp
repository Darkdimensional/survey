<%--
  Created by IntelliJ IDEA.
  User: 98316
  Date: 2020/2/3
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>统计结果</title>

    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/navbar.css" type="text/css" media="all">

</head>
<body>
    <nav class="link-effect-2" id="link-effect-2">
        <ul class="nav navbar-nav">
            <li>
                <a class="scroll" href="index.jsp"><img src="images/logo.png" alt="icon"><span>首页</span></a>
            </li>
            <li><a class="scroll" href=""><span>产品介绍</span></a></li>
            <li><a class="scroll" href=""><span>联系客服</span></a></li>
            <li><a class="scroll" href="answer_square.jsp"><span>我要答卷</span></a></li>
            <li><a class="scroll" href="newPaper.jsp"><span>创建问卷</span></a></li>
        </ul>
    </nav>

    <div class="container">
        <form class="form center-block">

            <div id="title">
                <%--<h3 class='text-center'>青少年压力测试</h3>--%>
            </div>
            <%--答案信息--%>
            <div id="answerArea" class="container">
               <%-- <div class="container">
                    <dl class='dl dl-horizontal input-lg list-inline;' style='margin-bottom: 0px;'>
                    <dt style='text-align:left;width: 80px;'>第1题:</dt>
                    <dd style='margin-left: 80px'>你的性别</dd></dl>
                    <table class='table table-hover table-striped text-center table-bordered'>
                        <tr><td>选项</td><td>小计</td><td>比例</td></tr>
                        <tr><td>男</td><td>7</td><td>70%</td></tr>
                        <tr><td>女</td><td>3</td><td>30%</td></tr>
                        <tr><td>本题有效填写人次</td><td>10</td><td>100%</td></tr>
                    </table>
                </div><div class="container">
                <dl class='dl dl-horizontal input-lg list-inline;' style='margin-bottom: 0px;'>
                    <dt style='text-align:left;width: 80px;'>第2题:</dt>
                    <dd style='margin-left: 80px'>你生活在哪</dd></dl>
                <table class='table table-hover table-striped text-center table-bordered'>
                    <tr><td>选项</td><td>小计</td><td>比例</td></tr>
                    <tr><td>城市</td><td>6</td><td>60%</td></tr>
                    <tr><td>农村</td><td>4</td><td>40%</td></tr>
                    <tr><td>本题有效填写人次</td><td>10</td><td>100%</td></tr>
                </table>
                <dl class='dl dl-horizontal input-lg list-inline;' style='margin-bottom: 0px;'>
                    <dt style='text-align:left;width: 80px;'>第3题:</dt>
                    <dd style='margin-left: 80px'>频次与人交流多吗</dd></dl>
                <table class='table table-hover table-striped text-center table-bordered'>
                    <tr><td>选项</td><td>小计</td><td>比例</td></tr>
                    <tr><td>城市</td><td>6</td><td>60%</td></tr>
                    <tr><td>农村</td><td>4</td><td>40%</td></tr>
                    <tr><td>本题有效填写人次</td><td>10</td><td>100%</td></tr>
                </table>
            </div>--%>

            </div>

        </form>
    </div>

</body>
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
    <script type="text/javascript">
        $.ajaxSetup({
            async: false
        });
        var count;
        var id = window.location.href.split("=")[1];
        $.ajax({
            type: 'post',
            data: {'id': id},
            url: 'answer/findPaperCount',
            success: function (result) {
                count = result.data;
                showPage();
            }/*,error: function (e) {
                alert("系统出错了" + e);
            }*/
        })
        function showPage() {
            $.ajax({
                type: 'post',
                data: {'id': id},
                url: 'paper/findId',
                success: function (result) {
                    if (result.success) {
                        var paper = result.data;
                        var title = $("#title");
                        var answerArea = $("#answerArea");
                        var stitle = "<h3 id='title' class='text-center'>" + paper.title + "</h3>";
                        title.append(stitle);
                        var questions = paper.questions;
                        for (var i = 0; i < questions.length; i++) {
                            var temp = "";
                            var tye = questions[i].question_type;
                            temp += "<dl class='dl dl-horizontal input-lg list-inline;' style='margin-bottom: 0px;'>";
                            temp += "<dt style='text-align:left;width: 80px;'>第" + (i+1) + "题:</dt>";
                            temp += "<dd style='margin-left: 80px'>" + questions[i].question_name + "</dd></dl>";
                            temp += getAnswer(questions[i].options, tye, questions[i].question_id);
                            answerArea.append(temp);
                        }
                    }
                },
                /*error: function (e) {
                    alert("系统出错了" + e);
                }*/
            })
        }
        function getAnswer(options,tye,question_id) {
            var temp = "";
            if(tye == "1" || tye == "2"){
                temp += "<table class='table table-hover table-striped text-center table-bordered'>";
                temp += "<tr><td>选项</td><td>小计</td><td>比例</td></tr>";
                for (var i = 0 ; i < options.length;i++){
                    temp += getOptionAnswer(options[i]);
                }
                temp += " <tr><td>本题有效填写人次</td><td>"+count+"</td><td>100%</td></tr>";
                temp += "</table>";
            }
            else if (tye == "3"){
                var textAnswer = [];
                $.ajax({
                    type: 'post',
                    data: {'id': question_id},
                    url: 'answer/findTextAnswer',
                    success: function (result){
                        textAnswer = result.data;
                    }
                })
                for (var i = 0 ;i < textAnswer.length;i++){
                    temp+="<input  type='text' class='form-control' value='"+textAnswer[i]+"' style='border: 0px;'readonly='readonly'>";
                }
            }
            return temp;
        }
        function getOptionAnswer(option) {
            var cnt;
            var temp = "";
            $.ajax({
                type: 'post',
                data: {'id': option.option_id},
                url: 'answer/findOptionCount',
                success: function (result){
                    cnt = result.data;
                    temp += "<tr><td>"+option.option_name+"</td><td>"+cnt+"</td><td>"+(cnt/count*100).toFixed(2)+"%</td></tr>";
                }
            })
            return temp;
        }
    </script>
</html>
