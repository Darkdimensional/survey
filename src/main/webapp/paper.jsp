<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: 98316
  Date: 2020/2/1
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看问卷</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">

    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/navbar.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/survey.css" type="text/css" media="all">
</head>
<body style="padding: 5px;">

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

<top id="top"></top>

<!--问卷主体-->
<div class="container">
    <form id="form" class="form center-block">
        <!--问卷标题-->
        <div id="title" class="form-group">
        </div>
        <!--问题容器，用来装问题-->
        <div id="qarea">

        </div>



        <!--提交问卷-->
        <div class="form-group text-center row">
            <div class="col-xs-4">
                <div id="complete" class="btn btn-success" style="float: inherit;" onclick="update()" >完成修改</div>
            </div>
        </div>

    </form>
</div>

</body>

<script type="text/javascript" src="js/jquery.min.js" ></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>
<script src="http://pv.sohu.com/cityjson"></script>
<script>
    //获取问卷信息
    var id = window.location.href.split("=")[1];
    $.ajax({
        type:'post',
        data:{ 'id':id},
        url:'paper/findId',
        success: function (result) {
            if (result.success){
                var paper = result.data;
                var title= $("#title");
                var qarea = $("#qarea");
                var stitle = " <textarea id='title1' class='form-control text-center' style='font-size: 20px;' placeholder='请输入问卷标题'>"+paper.title+"</textarea>";
                /*var stitle = "<span id='stitle' name='name' class='form-control' style='font-size: 20px;text-align: center;display:block;'>"+paper.title+"</span>";*/
                title.append(stitle);
                var questions = paper.questions;
                for (var i = 0; i < questions.length; i++) {
                    var temp = "";
                    var tye = questions[i].question_type;
                    temp+="<input type='text'  class='form-control qname'  value='"+(i+1)+"."+questions[i].question_name+"' name='"+questions[i].question_id+"'>";
                    temp += setOption(questions[i].options,tye,i,questions[i].question_id);
                    qarea.append(temp);
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
    function setOption(options ,tye,pnum,q_id) {
        var temp = "";
        temp += "<div class='quest"+pnum+"'>";
        if(tye == "1"){
            for (var i = 0; i < options.length; i++){
                temp+="<input  type='radio' name='option"+pnum+"' value='"+options[i].option_id+"'/>"
                temp+="<input  type='text' class='option-text op"+pnum+"'  value='"+options[i].option_name+"' style='border: 0px;' name='"+options[i].option_id+"'>";
                temp+="<br />";
            }
        }else if (tye == "2"){
            for (var i = 0; i < options.length; i++){
                temp+="<input type='checkbox' name='option"+pnum+"' value='"+options[i].option_id+"'/>";
                temp+="<input  type='text'  class='option-text op"+pnum+"'  value='"+options[i].option_name+"' style='border: 0px;' name='"+options[i].option_id+"'>";
                temp+="<br />";
            }
        }else if (tye == "3") {
            temp+="<input id='"+q_id+"'  type='text'  class='form-control' style='margin-top: 20px' name='textContent'  readonly='readonly'>";
        }
        temp += "</div><br />";
        return temp;
    }

    //修改问卷
    function update() {
        var paper = {};
        var title = $("#title1").val();
        var status = '1';
        var questions = getQuestions();

        paper.title = title;
        paper.paper_id = id;
        paper.status = status;
        paper.questions = questions;

        $.ajax({
            type:'post',
            url:'paper/update',
            dataType:"json",
            data:JSON.stringify(paper),
            contentType : 'application/json;charset=utf-8', //设置请求头信息
            success: function (result) {
                if (result.success){
                    alert("修改成功");
                    window.location.href='myPaper.jsp';
                }
                else {
                    alert("发生错误");
                }
            },
            error:function(e){
                alert("出错了"+e);
            }
        })
    }
    function getQuestions() {
        var questions = [];
        var qnames =  $(".qname");
        for (var i = 0; i < qnames.length; i++){
            var j = {};
            j.question_name = qnames[i].value;
            j.question_id = qnames[i].name;
            j.options =  getOptions(i);
            questions.push(j);
        }
        return questions;
    }

    function getOptions(pnum) {
        var options = [];
        var onames = $(".op"+pnum+"");
        for(var i = 0; i < onames.length;i++){
            var j = {};
            j.option_name = onames[i].value;
            j.option_id = onames[i].name;
            options.push(j);
        }
        return options;
    }

</script>
</html>
